<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation de la Réservation</title>
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
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 1.5rem 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
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

        /* Messages de confirmation et d'erreur */
        .alert {
            border: none;
            border-radius: 1rem;
            padding: 1.5rem 2rem;
            font-weight: 500;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
            border-left: 5px solid #28a745;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border-left: 5px solid #dc3545;
        }

        .alert-icon {
            font-size: 2rem;
            opacity: 0.8;
        }

        .alert-content {
            flex: 1;
        }

        .reservation-id {
            background: rgba(255, 255, 255, 0.7);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 700;
            margin-top: 0.5rem;
            display: inline-block;
        }

        /* Ticket de réservation */
        .ticket-container {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            border: 2px dashed #dee2e6;
            position: relative;
        }

        .ticket-header {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            color: white;
            padding: 1.5rem 2rem;
            text-align: center;
            position: relative;
        }

        .ticket-header::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid #357abd;
        }

        .ticket-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .ticket-body {
            padding: 2rem;
        }

        /* Route display dans le ticket */
        .route-display {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1.5rem;
            padding: 1.5rem;
            background: rgba(74, 144, 226, 0.1);
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .station {
            background: #4a90e2;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 2rem;
            font-weight: 600;
            text-align: center;
            min-width: 150px;
        }

        .station-city {
            font-size: 0.85rem;
            opacity: 0.9;
            display: block;
            margin-top: 0.25rem;
        }

        .route-arrow {
            color: #4a90e2;
            font-size: 2rem;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        /* Détails du voyage dans le ticket */
        .ticket-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .detail-card {
            background: rgba(74, 144, 226, 0.05);
            border-radius: 0.75rem;
            padding: 1.25rem;
            border-left: 4px solid #4a90e2;
            transition: all 0.3s ease;
        }

        .detail-card:hover {
            background: rgba(74, 144, 226, 0.1);
            transform: translateY(-2px);
        }

        .detail-label {
            font-weight: 600;
            color: #495057;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .detail-value {
            font-weight: 700;
            color: #212529;
            font-size: 1.1rem;
        }

        .price-value {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            display: inline-block;
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 600;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .status-confirmed {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
        }

        .status-pending {
            background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%);
            color: white;
        }

        .preferences-list {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .preference-badge {
            background: linear-gradient(135deg, #6f42c1 0%, #e83e8c 100%);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        /* Section fidélité */
        .loyalty-section {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border-radius: 1rem;
            padding: 1.5rem;
            margin: 1.5rem 0;
            border-left: 4px solid #ffc107;
            text-align: center;
        }

        .loyalty-points {
            font-size: 2rem;
            font-weight: 700;
            color: #856404;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        /* Section trajet suivant */
        .next-journey {
            background: linear-gradient(135deg, #d1ecf1 0%, #bee5eb 100%);
            border-radius: 1rem;
            padding: 1.5rem;
            margin: 1.5rem 0;
            border-left: 4px solid #17a2b8;
        }

        .search-link {
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
            margin-top: 1rem;
        }

        .search-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(23, 162, 184, 0.4);
            color: white;
            text-decoration: none;
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

        /* Actions buttons */
        .actions-container {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .action-button {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
            flex: 1;
            justify-content: center;
            min-width: 200px;
        }

        .action-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
            color: white;
            text-decoration: none;
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
                gap: 1rem;
            }

            .route-arrow {
                transform: rotate(90deg);
            }

            .ticket-details {
                grid-template-columns: 1fr;
            }

            .actions-container {
                flex-direction: column;
            }

            .action-button {
                min-width: auto;
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

        .ticket-container {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        /* Animation de succès */
        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .alert-success {
            animation: bounceIn 0.8s ease-out;
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
                <div class="d-flex justify-content-between align-items-center">
                    <h2><i class="bi bi-check-circle-fill me-2"></i>Confirmation de réservation</h2>
                    <div class="text-end">
                        <small>Réservation validée</small>
                    </div>
                </div>
            </div>

            <!-- Messages de confirmation/erreur -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <div class="alert-icon">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <div class="alert-content">
                        <strong>Réservation confirmée !</strong>
                        <div>${success}</div>
                        <div class="reservation-id">
                            <i class="bi bi-ticket-perforated me-1"></i>
                            ID de réservation : ${reservationId}
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <div class="alert-icon">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                    </div>
                    <div class="alert-content">
                        <strong>Erreur de réservation</strong>
                        <div>${error}</div>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty voyage}">
                <!-- Ticket de réservation -->
                <div class="ticket-container">
                    <div class="ticket-header">
                        <h3 class="ticket-title">
                            <i class="bi bi-train-front-fill"></i>
                            Billet de Train
                        </h3>
                    </div>

                    <div class="ticket-body">
                        <!-- Route -->
                        <div class="route-display">
                            <div class="station">
                                <i class="bi bi-geo-alt-fill"></i>
                                ${voyage.trajet.departStation.name}
                                <span class="station-city">${voyage.trajet.departStation.city}</span>
                            </div>
                            <div class="route-arrow">→</div>
                            <div class="station">
                                <i class="bi bi-geo-alt-fill"></i>
                                ${voyage.trajet.arrivalStation.name}
                                <span class="station-city">${voyage.trajet.arrivalStation.city}</span>
                            </div>
                        </div>

                        <!-- Détails du voyage -->
                        <div class="ticket-details">
                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-clock-fill"></i>
                                    Heure de départ
                                </div>
                                <div class="detail-value">${voyage.heureDepartFormatted}</div>
                            </div>

                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-clock-history"></i>
                                    Heure d'arrivée
                                </div>
                                <div class="detail-value">${voyage.heureArriveeFormatted}</div>
                            </div>

                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-hourglass-split"></i>
                                    Durée du trajet
                                </div>
                                <div class="detail-value">${voyage.duree}</div>
                            </div>

                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-currency-euro"></i>
                                    Prix du billet
                                </div>
                                <div class="detail-value">
                                    <span class="price-value">${voyage.prix} €</span>
                                </div>
                            </div>

                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-star-fill"></i>
                                    Classe
                                </div>
                                <div class="detail-value">${classe}</div>
                            </div>

                            <div class="detail-card">
                                <div class="detail-label">
                                    <i class="bi bi-info-circle-fill"></i>
                                    État de la réservation
                                </div>
                                <div class="detail-value">
                                    <span class="status-badge status-confirmed">
                                        <i class="bi bi-check-circle-fill me-1"></i>
                                        ${etat}
                                    </span>
                                </div>
                            </div>
                        </div>

                        <!-- Préférences -->
                        <div class="detail-card" style="margin-top: 1.5rem;">
                            <div class="detail-label">
                                <i class="bi bi-heart-fill"></i>
                                Préférences sélectionnées
                            </div>
                            <div class="detail-value">
                                <c:if test="${not empty preferences}">
                                    <div class="preferences-list">
                                        <c:forEach var="pref" items="${preferences}">
                                            <span class="preference-badge">
                                                <i class="bi bi-check me-1"></i>${pref}
                                            </span>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${empty preferences}">
                                    <span class="text-muted">Aucune préférence spécifiée</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Section fidélité -->
                <div class="loyalty-section">
                    <h4><i class="bi bi-award-fill me-2"></i>Programme de Fidélité</h4>
                    <div class="loyalty-points">
                        <i class="bi bi-star-fill"></i>
                        ${loyaltyPoints}
                        <small>points</small>
                    </div>
                    <p class="mb-0 mt-2">Continuez à voyager pour gagner plus de points !</p>
                </div>

                <!-- Trajet suivant -->
                <div class="next-journey">
                    <h4><i class="bi bi-plus-circle-fill me-2"></i>Trajet suivant</h4>
                    <c:choose>
                        <c:when test="${not empty nextTrajetId}">
                            <p class="mb-2">
                                <i class="bi bi-info-circle-fill me-1"></i>
                                Trajet sélectionné (ID: ${nextTrajetId})
                            </p>
                            <a href="recherche?villeDepart=${voyage.trajet.arrivalStation.city}" class="search-link">
                                <i class="bi bi-search"></i>
                                Rechercher un voyage depuis ${voyage.trajet.arrivalStation.city}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p class="mb-2">
                                <i class="bi bi-x-circle me-1"></i>
                                Aucun trajet supplémentaire sélectionné
                            </p>
                            <a href="recherche?villeDepart=${voyage.trajet.arrivalStation.city}" class="search-link">
                                <i class="bi bi-search"></i>
                                Rechercher un voyage depuis ${voyage.trajet.arrivalStation.city}
                            </a>
                        </c:otherwise>
                    </c:choose>
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