<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Historique des Réservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom right, #e6f0fa, #f9e6f0);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            font-family: 'Roboto', sans-serif;
        }

        .card {
            border: none;
            border-radius: 1.5rem;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            max-width: 1000px;
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

        .table {
            border-radius: 0.75rem;
            overflow: hidden;
        }

        .table thead {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: #ffffff;
        }

        .table th, .table td {
            vertical-align: middle;
            padding: 1rem;
        }

        .table tbody tr {
            transition: background-color 0.2s ease;
        }

        .table tbody tr:hover {
            background-color: #f1f3f5;
        }

        .alert {
            border: none;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 0.75rem;
            padding: 0.5rem 1rem;
            font-weight: 500;
            transition: background-color 0.2s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .text-center a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .text-center a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2 class="card-title">Historique de vos Réservations</h2>

   
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Départ</th>
                            <th>Arrivée</th>
                            <th>Date de Départ</th>
                            <th>Prix</th>
                            <th>Classe</th>
                            <th>Statut</th>
                            <th>Date de Réservation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservation" items="${reservations}">
                            <tr>
                                <td>${reservation.voyage.trajet.departStation.name}, ${reservation.voyage.trajet.departStation.city}</td>
                                <td>${reservation.voyage.trajet.arrivalStation.name}, ${reservation.voyage.trajet.arrivalStation.city}</td>
                                <td>${reservation.voyage.heureDepartFormatted}</td>
                                <td>${reservation.voyage.prix} €</td>
                                <td>${reservation.classe}</td>
                                <td>${reservation.etat}</td>
                                <td>${reservation.dateReservation.format(java.time.format.DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm'))}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
          
        <p class="text-center mt-3">
            <a href="recherche">Retour à la recherche</a>
        </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>