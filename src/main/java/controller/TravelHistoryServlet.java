package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Reservation;
import dao.ReservationDAO;
import dao.UserDAO;
import util.HibernateUtil;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/travelHistory")
public class TravelHistoryServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(TravelHistoryServlet.class.getName());
    private ReservationDAO reservationDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO(HibernateUtil.getSessionFactory());
        userDAO = new UserDAO(HibernateUtil.getSessionFactory());
        if (reservationDAO == null || userDAO == null) {
            throw new ServletException("Failed to initialize DAOs: SessionFactory issue");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("user") == null) {
            LOGGER.info("Unauthorized access to travel history, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("user");
        String userIdParam = request.getParameter("userId");

        // Validate userId parameter
        if (userIdParam == null || userIdParam.trim().isEmpty()) {
            LOGGER.warning("Missing userId parameter");
            request.setAttribute("error", "ID d'utilisateur requis.");
            request.getRequestDispatcher("/recherche").forward(request, response);
            return;
        }

        Long userId;
        try {
            userId = Long.parseLong(userIdParam);
        } catch (NumberFormatException e) {
            LOGGER.warning("Invalid userId format: " + userIdParam);
            request.setAttribute("error", "ID d'utilisateur invalide.");
            request.getRequestDispatcher("/recherche").forward(request, response);
            return;
        }

        // Fetch the target user
        User targetUser = userDAO.findById(userId);
        if (targetUser == null) {
            LOGGER.warning("User not found for userId: " + userId);
            request.setAttribute("error", "Utilisateur non trouvé.");
            request.getRequestDispatcher("/recherche").forward(request, response);
            return;
        }

        // Security check: Ensure logged-in user can access the requested user's history
        if (!loggedInUser.isAdmin() && !loggedInUser.getId().equals(userId)) {
            LOGGER.warning("Unauthorized access attempt by user " + loggedInUser.getEmail() + " for userId " + userId);
            request.setAttribute("error", "Vous n'êtes pas autorisé à voir l'historique de cet utilisateur.");
            request.getRequestDispatcher("/recherche").forward(request, response);
            return;
        }

        try {
            List<Reservation> reservations;
            String voyageIdParam = request.getParameter("voyageId");

            if (voyageIdParam != null && !voyageIdParam.trim().isEmpty()) {
                // Fetch reservations for specific voyage ID
                try {
                    Long voyageId = Long.parseLong(voyageIdParam);
                    reservations = reservationDAO.findByUserAndVoyageId(targetUser, voyageId);
                } catch (NumberFormatException e) {
                    LOGGER.warning("Invalid voyageId format: " + voyageIdParam);
                    request.setAttribute("error", "ID de voyage invalide.");
                    request.getRequestDispatcher("/recherche").forward(request, response);
                    return;
                }
            } else {
                // Fetch all reservations for the user
                reservations = reservationDAO.findByUserr(targetUser);
            }

            request.setAttribute("reservations", reservations);
            request.setAttribute("targetUser", targetUser);
            request.getRequestDispatcher("/travelHistory.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.severe("Error fetching travel history for userId " + userId + ": " + e.getMessage());
            request.setAttribute("error", "Une erreur est survenue lors de la récupération de l'historique des réservations.");
            request.getRequestDispatcher("/recherche").forward(request, response);
        }
    }
}