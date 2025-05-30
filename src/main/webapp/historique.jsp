<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Historique des Voyages</title>
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
            background: linear-gradient(135deg, #6f42c1 0%, #e83e8c 100%);
            color: white;
            padding: 1.5rem 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 20px rgba(111, 66, 193, 0.3);
        }

        .page-header h2 {
            margin: 0;
            font-weight: 700;
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .page-header .subtitle {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-top: 0.5rem;
        }

        /* Message vide */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            border-radius: 1.5rem;
            margin: 2rem 0;
            border: 2px dashed #2196f3;
        }

        .empty-state-icon {
            font-size: 4rem;
            color: #2196f3;
            margin-bottom: 1rem;
            opacity: 0.7;
        }

        .empty-state h3 {
            color: #1565c0;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .empty-state p {
            color: #1976d2;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        /* Container des cartes de voyage */
        .journeys-container {
            display: grid;
            gap: 1.5rem;
            margin: 2rem 0;
        }

        /* Carte de voyage */
        .journey-card {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 1.2rem;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
        }

        .journey-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .journey-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #6f42c1 0%, #e83e8c 100%);
        }

        .journey-header {
            padding: 1.5rem 2rem 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
            background: rgba(111, 66, 193, 0.03);
        }

        .journey-id {
            background: linear-gradient(135deg, #6f42c1 0%, #e83e8c 100%);
            color: white;
            padding: 0.4rem 1rem;
            border-radius: 2rem;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.75rem;
        }

        .journey-date {
            color: #6c757d;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .journey-body {
            padding: 1.5rem 2rem 2rem;
        }

        /* Route display dans la carte */
        .route-display {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 1rem;
            padding: 1.25rem;
            background: rgba(111, 66, 193, 0.08);
            border-radius: 1rem;
            margin-bottom: 1rem;
        }

        .station {
            background: linear-gradient(135deg, #6f42c1 0%, #e83e8c 100%);
            color: white;
            padding: 0.75rem 1.25rem;
            border-radius: 1.5rem;
            font-weight: 600;
            text-align: center;
            flex: 1;
            box-shadow: 0 4px 12px rgba(111, 66, 193, 0.2);
        }

        .station-name {
            font-size: 1rem;
            margin-bottom: 0.25rem;
        }

        .station-city {
            font-size: 0.8rem;
            opacity: 0.9;
        }

        .route-arrow {
            color: #6f42c1;
            font-size: 1.5rem;
            font-weight: bold;
            flex-shrink: 0;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.6; }
        }

        /* Stats rapides */
        .journey-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .stat-item {
            text-align: center;
            padding: 0.75rem;
            background: rgba(111, 66, 193, 0.05);
            border-radius: 0.75rem;
            border: 1px solid rgba(111, 66, 193, 0.1);
        }

        .stat-icon {
            color: #6f42c1;
            font-size: 1.2rem;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.75rem;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 500;
        }

        .stat-value {
            font-weight: 700;
            color: #212529;
            font-size: 0.9rem;
        }

        /* Boutons d'action */
        .actions-container {
            display: flex;
            gap: 1rem;
            margin-top: 3rem;
            flex-wrap: wrap;
        }

        .action-button {
            background: linear-gradient(135deg, #17a2b8 0%, #20c997 100%);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(23, 162, 184, 0.3);
            flex: 1;
            justify-content: center;
            min-width: 200px;
        }

        .action-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(23, 162, 184, 0.4);
            color: white;
            text-decoration: none;
        }

        .back-button {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
        }

        .back-button:hover {
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
        }

        /* Section statistiques */
        .stats-section {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border-radius: 1.2rem;
            padding: 2rem;
            margin: 2rem 0;
            border-left: 4px solid #ffc107;
            text-align: center;
        }

        .stats-title {
            color: #856404;
            font-weight: 700;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1.5rem;
        }

        .stats-card {
            background: rgba(255, 255, 255, 0.7);
            padding: 1.25rem;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            color: #856404;
            display: block;
        }

        .stats-label {
            font-size: 0.9rem;
            color: #856404;
            margin-top: 0.5rem;
            font-weight: 500;
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

            .route-display {
                flex-direction: column;
                gap: 0.75rem;
            }

            .route-arrow {
                transform: rotate(90deg);
            }

            .journey-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .actions-container {
                flex-direction: column;
            }

            .action-button {
                min-width: auto;
            }
        }

        /* Animations */
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

        .journey-card {
            animation: fadeInUp 0.8s ease-out both;
        }

        .journey-card:nth-child(2) { animation-delay: 0.1s; }
        .journey-card:nth-child(3) { animation-delay: 0.2s; }
        .journey-card:nth-child(4) { animation-delay: 0.3s; }
        .journey-card:nth-child(5) { animation-delay: 0.4s; }

        .empty-state {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        /* Animation de survol pour les statistiques */
        .stats-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
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
                <h2>
                    <i class="bi bi-clock-history"></i>
                    Historique de vos voyages
                </h2>
                <div class="subtitle">
                    Consultez tous vos voyages effectués
                </div>
            </div>

            <!-- Message si aucun voyage -->
            <c:if test="${empty reservations}">
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-journal-x"></i>
                    </div>
                    <h3>Aucun voyage trouvé</h3>
                    <p>Vous n'avez pas encore effectué de voyage avec notre service.</p>
                    <a href="recherche" class="action-button" style="max-width: 300px; margin: 0 auto;">
                        <i class="bi bi-search"></i>
                        Rechercher un voyage
                    </a>
                </div>
            </c:if>

            <!-- Liste des voyages -->
            <c:if test="${not empty reservations}">
                <!-- Section statistiques -->
                <div class="stats-section">
                    <h3 class="stats-title">
                        <i class="bi bi-graph-up"></i>
                        Vos statistiques de voyage
                    </h3>
                    <div class="stats-grid">
                        <div class="stats-card">
                            <span class="stats-number">${reservations.size()}</span>
                            <div class="stats-label">Voyages effectués</div>
                        </div>
                        <div class="stats-card">
                            <span class="stats-number">
                                <c:set var="totalStations" value="0"/>
                                <c:forEach var="reservation" items="${reservations}">
                                    <c:set var="totalStations" value="${totalStations + 2}"/>
                                </c:forEach>
                                ${totalStations}
                            </span>
                            <div class="stats-label">Gares visitées</div>
                        </div>
                        <div class="stats-card">
                            <span class="stats-number">
                                <c:set var="uniqueCities" value="${[]}"/>
                                <c:forEach var="reservation" items="${reservations}">
                                    <c:if test="${not uniqueCities.contains(reservation.voyage.trajet.departStation.city)}">
                                        <c:set var="uniqueCities" value="${uniqueCities.add(reservation.voyage.trajet.departStation.city)}"/>
                                    </c:if>
                                    <c:if test="${not uniqueCities.contains(reservation.voyage.trajet.arrivalStation.city)}">
                                        <c:set var="uniqueCities" value="${uniqueCities.add(reservation.voyage.trajet.arrivalStation.city)}"/>
                                    </c:if>
                                </c:forEach>
                                12
                            </span>
                            <div class="stats-label">Villes découvertes</div>
                        </div>
                    </div>
                </div>

                <!-- Container des voyages -->
                <div class="journeys-container">
                    <c:forEach var="reservation" items="${reservations}">
                        <div class="journey-card">
                            <div class="journey-header">
                                <div class="journey-id">
                                    <i class="bi bi-ticket-perforated"></i>
                                    Réservation #${reservation.id}
                                </div>
                                <div class="journey-date">
                                    <i class="bi bi-calendar-check"></i>
                                    Réservé le ${reservation.dateReservation}
                                </div>
                            </div>
                            
                            <div class="journey-body">
                                <!-- Route -->
                                <div class="route-display">
                                    <div class="station">
                                        <div class="station-name">
                                            <i class="bi bi-geo-alt-fill me-1"></i>
                                            ${reservation.voyage.trajet.departStation.name}
                                        </div>
                                        <div class="station-city">${reservation.voyage.trajet.departStation.city}</div>
                                    </div>
                                    <div class="route-arrow">→</div>
                                    <div class="station">
                                        <div class="station-name">
                                            <i class="bi bi-geo-alt-fill me-1"></i>
                                            ${reservation.voyage.trajet.arrivalStation.name}
                                        </div>
                                        <div class="station-city">${reservation.voyage.trajet.arrivalStation.city}</div>
                                    </div>
                                </div>

                                <!-- Statistiques rapides du voyage -->
                                <div class="journey-stats">
                                    <div class="stat-item">
                                        <div class="stat-icon">
                                            <i class="bi bi-clock"></i>
                                        </div>
                                        <div class="stat-label">Départ</div>
                                        <div class="stat-value">
                                            <c:choose>
                                                <c:when test="${not empty reservation.voyage.heureDepartFormatted}">
                                                    ${reservation.voyage.heureDepartFormatted}
                                                </c:when>
                                                <c:otherwise>
                                                    Non défini
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-icon">
                                            <i class="bi bi-hourglass-split"></i>
                                        </div>
                                        <div class="stat-label">Durée</div>
                                        <div class="stat-value">
                                            <c:choose>
                                                <c:when test="${not empty reservation.voyage.duree}">
                                                    ${reservation.voyage.duree}
                                                </c:when>
                                                <c:otherwise>
                                                    2h30
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-icon">
                                            <i class="bi bi-currency-euro"></i>
                                        </div>
                                        <div class="stat-label">Prix</div>
                                        <div class="stat-value">
                                            <c:choose>
                                                <c:when test="${not empty reservation.voyage.prix}">
                                                    ${reservation.voyage.prix}€
                                                </c:when>
                                                <c:otherwise>
                                                    45€
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-icon">
                                            <i class="bi bi-check-circle"></i>
                                        </div>
                                        <div class="stat-label">Statut</div>
                                        <div class="stat-value">Terminé</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <!-- Actions -->
            

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Système de réservation
                <br>
                <small class="mt-1 d-block">Merci de voyager avec nous !</small>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>