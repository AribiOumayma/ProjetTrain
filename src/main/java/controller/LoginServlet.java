package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.HibernateUtil;

import java.io.IOException;
import java.util.logging.Logger;

import org.mindrot.jbcrypt.BCrypt;

import dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(HibernateUtil.getSessionFactory());
        if (userDAO == null) {
            throw new ServletException("Failed to initialize UserDAO: SessionFactory issue");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Vérifier si l'utilisateur est déjà connecté
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            
            // Rediriger selon le rôle de l'utilisateur
            if (user.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/monCompte");
            } else {
                // Vérifier s'il y a une URL de redirection stockée
                String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
                if (redirectUrl != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectUrl);
                } else {
                    response.sendRedirect(request.getContextPath() + "/recherche");
                }
            }
            return;
        }
        
        // Stocker l'URL de redirection si voyageId est fourni
        String voyageId = request.getParameter("voyageId");
        if (voyageId != null && !voyageId.trim().isEmpty()) {
            session = request.getSession(true);
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/selection?voyageId=" + voyageId);
        }
        
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String voyageId = request.getParameter("voyageId");

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "L'email est requis.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Le mot de passe est requis.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try {
            User user = userDAO.findByEmail(email);
            if (user == null) {
                LOGGER.info("Tentative de connexion échouée pour l'email: " + email + " (utilisateur non trouvé)");
                request.setAttribute("error", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            if (user.isBlocked()) {
                LOGGER.info("Tentative de connexion échouée pour l'email: " + email + " (compte bloqué)");
                request.setAttribute("error", "Votre compte est bloqué. Veuillez contacter un administrateur.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            if (!BCrypt.checkpw(password, user.getPassword())) {
                LOGGER.info("Tentative de connexion échouée pour l'email: " + email + " (mot de passe incorrect)");
                request.setAttribute("error", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            LOGGER.info("Utilisateur connecté avec succès: " + email);
            
            // Stocker l'URL de redirection si voyageId est fourni
            if (voyageId != null && !voyageId.trim().isEmpty()) {
                session.setAttribute("redirectAfterLogin", request.getContextPath() + "/selection?voyageId=" + voyageId);
            }
            
            // Redirection après connexion réussie
            if (user.isAdmin()) {
                // Admin -> Dashboard
                response.sendRedirect(request.getContextPath() + "/monCompte");
            } else {
                // Utilisateur normal -> vérifier s'il y a une URL de redirection
                String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
                if (redirectUrl != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectUrl);
                } else {
                    response.sendRedirect(request.getContextPath() + "/recherche");
                }
            }
            
        } catch (Exception e) {
            LOGGER.severe("Erreur lors de la tentative de connexion pour l'email " + email + ": " + e.getMessage());
            request.setAttribute("error", "Une erreur est survenue. Veuillez réessayer.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}