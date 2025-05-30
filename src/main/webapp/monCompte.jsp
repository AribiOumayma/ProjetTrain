<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mon Compte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        /* Ajustement du contenu principal pour la sidebar */
        .main-content {
            margin-left: 270px;
            padding: 2rem;
            min-height: 100vh;
        }
                /* Footer moderne */
        .footer {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #6c757d;
            text-align: center;
            padding: 1.5rem;
            margin-top: 3rem;
            border-radius: 1rem 1rem 0 0;
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.1);
        }
        

        /* Conteneur principal avec style moderne */
        .content-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1.5rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Header avec gradient */
        .page-header {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            color: white;
            padding: 1.5rem 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 20px rgba(74, 144, 226, 0.3);
        }

        .page-header h2 {
            margin: 0;
            font-weight: 700;
            font-size: 1.8rem;
        }

        /* Section headers */
        .section-header {
            background: linear-gradient(135deg, #6f42c1 0%, #5a2d91 100%);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 0.75rem;
            margin: 2rem 0 1rem 0;
            box-shadow: 0 6px 15px rgba(111, 66, 193, 0.3);
        }

        .section-header h3 {
            margin: 0;
            font-weight: 600;
            font-size: 1.3rem;
        }

        /* Alerts modernes */
        .alert {
            border: none;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
            border-left: 4px solid #28a745;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        /* Card pour les liens d'administration */
        .admin-card {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.3);
            transition: all 0.3s ease;
        }

        .admin-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(40, 167, 69, 0.4);
        }

        .admin-card a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .admin-card a:hover {
            color: #f8f9fa;
        }

        /* Table moderne */
        .table-container {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-top: 1.5rem;
            margin-bottom: 2rem;
        }

        .table {
            margin: 0;
            font-size: 0.95rem;
        }

        .table thead th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #495057;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 1.25rem 1rem;
            border: none;
            position: relative;
        }

        .table thead th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, #4a90e2 0%, #357abd 100%);
        }

        .table tbody tr {
            transition: all 0.3s ease;
            border: none;
        }

        .table tbody tr:hover {
            background-color: rgba(74, 144, 226, 0.05);
            transform: scale(1.01);
        }

        .table tbody td {
            padding: 1.25rem 1rem;
            vertical-align: middle;
            border-top: 1px solid #e9ecef;
        }

        /* Badges modernes */
        .badge {
            font-size: 0.8rem;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 500;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        }

        .bg-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%) !important;
        }

        .bg-warning {
            background: linear-gradient(135deg, #ffc107 0%, #ffb300 100%) !important;
            color: #212529 !important;
        }

        .bg-info {
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%) !important;
        }

        /* Boutons d'action modernes */
        .action-links {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .action-links a {
            padding: 0.5rem 1rem;
            border-radius: 0.75rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
            font-size: 0.85rem;
        }

        .btn-modify {
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%);
            color: white;
        }

        .btn-modify:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(23, 162, 184, 0.4);
            color: white;
        }

        .btn-cancel {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            color: white;
        }

        .btn-cancel:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
            color: white;
        }

        .btn-download {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
        }

        .btn-download:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
            color: white;
        }

        /* Navigation links card */
        .nav-card {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-top: 2rem;
            box-shadow: 0 8px 25px rgba(108, 117, 125, 0.3);
            text-align: center;
        }

        .nav-card a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            margin: 0 1rem;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-card a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            transform: translateY(-2px);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #6c757d;
            background: white;
            border-radius: 1rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #dee2e6;
        }

        /* History link card */
        .history-card {
            background: linear-gradient(135deg, #fd7e14 0%, #e65100 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-top: 1rem;
            box-shadow: 0 8px 25px rgba(253, 126, 20, 0.3);
            transition: all 0.3s ease;
        }

        .history-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(253, 126, 20, 0.4);
        }

        .history-card a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .history-card a:hover {
            color: #f8f9fa;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .content-container {
                padding: 1.5rem;
            }

            .page-header {
                padding: 1rem 1.5rem;
            }

            .page-header h2 {
                font-size: 1.5rem;
            }

            .action-links {
                flex-direction: column;
            }

            .nav-card a {
                display: block;
                margin: 0.5rem 0;
            }
        }

        /* Animation d'entrée */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .content-container {
            animation: fadeInUp 0.6s ease-out;
        }

        .section {
            animation: fadeInUp 0.6s ease-out;
            animation-delay: 0.1s;
            animation-fill-mode: both;
        }
    </style>
</head>
<body>

    <!-- Barre de navigation -->
    <%@ include file="navbar.jsp" %>

    <div class="main-content">
        <div class="content-container">

            <!-- Header de la page -->
            <div class="page-header">
                <h2><i class="bi bi-person-circle me-2"></i>Mon Compte</h2>
            </div>

           

            <!-- Section Administration (pour les admins) -->
            <c:if test="${sessionScope.user.role == 'admin'}">
                <div class="section">
                   
                    

                    <div class="section-header">
                        <h3><i class="bi bi-clock-history me-2"></i>Historique des voyages de tous les utilisateurs</h3>
                    </div>
                    <c:if test="${not empty allUsedReservations}">
                        <div class="table-container">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th><i class="bi bi-hash me-1"></i>ID</th>
                                            <th><i class="bi bi-person me-1"></i>Utilisateur</th>
                                            <th><i class="bi bi-geo-alt me-1"></i>Gare Départ</th>
                                            <th><i class="bi bi-geo-alt-fill me-1"></i>Gare Arrivée</th>
                                            <th><i class="bi bi-calendar me-1"></i>Date Réservation</th>
                                            <th><i class="bi bi-info-circle me-1"></i>État</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reservation" items="${allUsedReservations}">
                                            <tr>
                                                <td><strong>#${reservation.id}</strong></td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <i class="bi bi-person-circle me-2 text-primary"></i>
                                                        ${reservation.user.username}
                                                    </div>
                                                </td>
                                                <td>${reservation.voyage.trajet.departStation.name}</td>
                                                <td>${reservation.voyage.trajet.arrivalStation.name}</td>
                                                <td>${reservation.dateReservation}</td>
                                                <td>
                                                    <span class="badge bg-info">
                                                        <i class="bi bi-check2-all me-1"></i>${reservation.etat}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty allUsedReservations}">
                        <div class="empty-state">
                            <i class="bi bi-clock-history"></i>
                            <h4>Aucun voyage utilisé</h4>
                            <p>Il n'y a actuellement aucun voyage utilisé dans le système.</p>
                        </div>
                    </c:if>
                </div>
            </c:if>

            <!-- Section pour les utilisateurs normaux -->
            <c:if test="${sessionScope.user.role != 'admin'}">
                <div class="section">
                    <div class="section-header">
                        <h3><i class="bi bi-ticket-detailed me-2"></i>Réservations achetées</h3>
                    </div>
                    <c:if test="${not empty reservations}">
                        <div class="table-container">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th><i class="bi bi-hash me-1"></i>ID</th>
                                            <th><i class="bi bi-geo-alt me-1"></i>Gare Départ</th>
                                            <th><i class="bi bi-geo-alt-fill me-1"></i>Gare Arrivée</th>
                                            <th><i class="bi bi-info-circle me-1"></i>État</th>
                                            <th><i class="bi bi-clock me-1"></i>Heure Départ</th>
                                            <th><i class="bi bi-clock-fill me-1"></i>Heure Arrivée</th>
                                            <th><i class="bi bi-gear me-1"></i>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reservation" items="${reservations}">
                                            <c:if test="${reservation.etat == 'acheté'}">
                                                <tr>
                                                    <td><strong>#${reservation.id}</strong></td>
                                                    <td>${reservation.voyage.trajet.departStation.name}</td>
                                                    <td>${reservation.voyage.trajet.arrivalStation.name}</td>
                                                    <td>
                                                        <span class="badge bg-success">
                                                            <i class="bi bi-check-circle me-1"></i>${reservation.etat}
                                                        </span>
                                                    </td>
                                                    <td>${reservation.voyage.heureDepartFormatted}</td>
                                                    <td>${reservation.voyage.heureArriveeFormatted}</td>
                                                    <td>
                                                        <div class="action-links">
                                                            <a href="${pageContext.request.contextPath}/modifierReservation?id=${reservation.id}" class="btn-modify">
                                                                <i class="bi bi-pencil me-1"></i>Modifier
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/annulerReservation?id=${reservation.id}" class="btn-cancel">
                                                                <i class="bi bi-x-circle me-1"></i>Annuler
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/telechargerBillet?id=${reservation.id}" class="btn-download">
                                                                <i class="bi bi-download me-1"></i>PDF
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty reservations}">
                        <div class="empty-state">
                            <i class="bi bi-ticket"></i>
                            <h4>Aucune réservation trouvée</h4>
                            <p>Vous n'avez actuellement aucune réservation active.</p>
                        </div>
                    </c:if>
                </div>

                <div class="section">
                    <div class="section-header">
                        <h3><i class="bi bi-clock-history me-2"></i>Historique des voyages</h3>
                    </div>
                    <c:if test="${not empty usedReservations}">
                        <div class="table-container">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th><i class="bi bi-hash me-1"></i>ID</th>
                                            <th><i class="bi bi-geo-alt me-1"></i>Gare Départ</th>
                                            <th><i class="bi bi-geo-alt-fill me-1"></i>Gare Arrivée</th>
                                            <th><i class="bi bi-calendar me-1"></i>Date Réservation</th>
                                            <th><i class="bi bi-info-circle me-1"></i>État</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reservation" items="${usedReservations}">
                                            <tr>
                                                <td><strong>#${reservation.id}</strong></td>
                                                <td>${reservation.voyage.trajet.departStation.name}</td>
                                                <td>${reservation.voyage.trajet.arrivalStation.name}</td>
                                                <td>${reservation.dateReservation}</td>
                                                <td>
                                                    <span class="badge bg-info">
                                                        <i class="bi bi-check2-all me-1"></i>${reservation.etat}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty usedReservations}">
                        <div class="empty-state">
                            <i class="bi bi-clock-history"></i>
                            <h4>Aucun voyage utilisé</h4>
                            <p>Vous n'avez actuellement aucun voyage utilisé.</p>
                        </div>
                    </c:if>
                </div>
            </c:if>

             <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Interface d'administration
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>