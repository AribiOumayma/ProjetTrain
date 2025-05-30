<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to bottom right, #e6f0fa, #f9e6f0);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .card {
            border: none;
            border-radius: 1.5rem;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            max-width: 450px;
            width: 100%;
            background: #ffffff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            color: #343a40;
            font-weight: 700;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.75rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border-radius: 0.75rem;
            border: 1px solid #ced4da;
            padding: 0.75rem 1rem;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            transform: scale(1.02);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem;
            font-weight: 500;
            font-size: 1rem;
            width: 100%;
            transition: background-color 0.2s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .text-danger {
            font-size: 0.875rem;
            margin-top: 0.5rem;
            text-align: center;
        }

        .form-text {
            text-align: center;
            margin-top: 1.5rem;
        }

        .form-text a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .form-text a:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        footer {
            margin-top: 2rem;
            text-align: center;
            color: #495057;
            font-size: 0.875rem;
            padding: 1rem;
            width: 100%;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        footer a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2 class="card-title">Inscription</h2>
        <c:if test="${not empty error}">
            <p class="text-danger" aria-live="polite">${error}</p>
        </c:if>
        <form action="register" method="post">
            <div class="mb-4">
                <label for="username" class="form-label">Nom d'utilisateur</label>
                <input type="text" id="username" name="username" class="form-control" required aria-describedby="username-error">
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mot de passe</label>
                <input type="password" id="password" name="password" class="form-control" required aria-describedby="password-error">
            </div>
            <div class="mb-4">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required 
                       pattern="^[A-Za-z0-9+_.-]+@(.+)$" 
                       title="Veuillez entrer un email valide (exemple@domaine.com)" 
                       aria-describedby="email-error">
            </div>
            <button type="submit" class="btn btn-primary">S'inscrire</button>
        </form>
        <p class="form-text">
            <a href="login">Déjà inscrit ? Connectez-vous</a>
        </p>
    </div>
    <footer>
        <p>&copy; 2025 Votre Application. Tous droits réservés. | <a href="login">Connectez-vous</a></p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>