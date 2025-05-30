<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Trajets les plus populaires</title>
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

        /* Bouton retour stylé */
        .back-button {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            border: none;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
            color: white;
            text-decoration: none;
        }

        /* Table moderne */
        .table-container {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-top: 1.5rem;
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

        /* Styles pour les trajets */
        .trajet-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .trajet-route {
            font-weight: 600;
            color: #495057;
            font-size: 1rem;
        }

        .trajet-arrow {
            color: #4a90e2;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .station-name {
            background: linear-gradient(135deg, #e7f3ff 0%, #cce7ff 100%);
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #1e4a72;
            border: 1px solid rgba(74, 144, 226, 0.2);
        }

        /* Badge pour le nombre de réservations */
        .reservation-badge {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Ranking indicators */
        .rank-indicator {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.1rem;
            color: white;
            margin-right: 0.75rem;
        }

        .rank-1 {
            background: linear-gradient(135deg, #ffd700 0%, #ffb300 100%);
            box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);
        }

        .rank-2 {
            background: linear-gradient(135deg, #c0c0c0 0%, #a0a0a0 100%);
            box-shadow: 0 4px 12px rgba(192, 192, 192, 0.4);
        }

        .rank-3 {
            background: linear-gradient(135deg, #cd7f32 0%, #b8860b 100%);
            box-shadow: 0 4px 12px rgba(205, 127, 50, 0.4);
        }

        .rank-default {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #dee2e6;
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

            .table-responsive {
                border-radius: 1rem;
            }

            .trajet-info {
                flex-direction: column;
                gap: 0.5rem;
                align-items: flex-start;
            }

            .rank-indicator {
                width: 2rem;
                height: 2rem;
                font-size: 0.9rem;
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

        /* Animation pour les lignes du tableau */
        .table tbody tr {
            animation: fadeInUp 0.6s ease-out;
        }

        .table tbody tr:nth-child(1) { animation-delay: 0.1s; }
        .table tbody tr:nth-child(2) { animation-delay: 0.2s; }
        .table tbody tr:nth-child(3) { animation-delay: 0.3s; }
        .table tbody tr:nth-child(4) { animation-delay: 0.4s; }
        .table tbody tr:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>

    <!-- Barre de navigation -->
    <%@ include file="navbar.jsp" %>

    <div class="main-content">
        <div class="content-container">

            <!-- Header de la page -->
            <div class="page-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h2><i class="bi bi-trophy-fill me-2"></i>Trajets les plus populaires</h2>
                    <div class="text-end">
                        <small>Analytics & Performances</small>
                    </div>
                </div>
            </div>

            <!-- Bouton retour -->
            <div class="mb-4">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-button">
                    <i class="bi bi-arrow-left"></i> Retour au tableau de bord
                </a>
            </div>

            <!-- Tableau des trajets populaires -->
            <c:if test="${not empty popularTrajets}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>Rang</th>
                                    <th><i class="bi bi-geo-alt-fill me-1"></i>Trajet</th>
                                    <th><i class="bi bi-people-fill me-1"></i>Nombre de réservations</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${popularTrajets}" varStatus="status">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="rank-indicator rank-${status.index + 1 <= 3 ? status.index + 1 : 'default'}">
                                                    ${status.index + 1}
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="trajet-info">
                                                <span class="station-name">${entry[0].departStation.name}</span>
                                                <span class="trajet-arrow">
                                                    <i class="bi bi-arrow-right"></i>
                                                </span>
                                                <span class="station-name">${entry[0].arrivalStation.name}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="reservation-badge">
                                                <i class="bi bi-bookmark-check-fill"></i>
                                                ${entry[1]} réservations
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty popularTrajets}">
                <div class="empty-state">
                    <i class="bi bi-graph-up"></i>
                    <h4>Aucun trajet populaire trouvé</h4>
                    <p>Il n'y a actuellement aucune donnée de trajet populaire disponible.</p>
                </div>
            </c:if>

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Analytics des trajets
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>