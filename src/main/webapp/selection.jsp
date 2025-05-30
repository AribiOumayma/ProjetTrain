<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Sélection du Voyage</title>
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

        /* Carte de détails du voyage */
        .voyage-details {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 1rem;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .voyage-details h3 {
            color: #4a90e2;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e9ecef;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: #495057;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .detail-value {
            font-weight: 500;
            color: #212529;
        }

        .price-highlight {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
        }

        .places-badge {
            background: linear-gradient(135deg, #17a2b8 0%, #20c997 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(23, 162, 184, 0.3);
        }

        /* Formulaire de réservation */
        .reservation-form {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .reservation-form h3 {
            color: #4a90e2;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-select {
            border-radius: 0.75rem;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            background: white;
        }

        .form-select:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
        }

        /* Préférences avec style moderne */
        .preferences-container {
            background: #f8f9fa;
            border-radius: 0.75rem;
            padding: 1.5rem;
            border: 2px solid #e9ecef;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
            padding: 0.75rem;
            background: white;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            border: 1px solid #dee2e6;
        }

        .checkbox-item:hover {
            background: rgba(74, 144, 226, 0.05);
            border-color: #4a90e2;
        }

        .checkbox-item input[type="checkbox"] {
            width: 1.2rem;
            height: 1.2rem;
            accent-color: #4a90e2;
        }

        .checkbox-item label {
            margin: 0;
            font-weight: 500;
            color: #495057;
            cursor: pointer;
            flex: 1;
        }

        /* Bouton de confirmation */
        .confirm-button {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            color: white;
            padding: 1rem 2rem;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(40, 167, 69, 0.3);
            width: 100%;
        }

        .confirm-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.4);
        }

        /* Route display */
        .route-display {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: rgba(74, 144, 226, 0.1);
            border-radius: 0.75rem;
            margin: 1rem 0;
        }

        .station {
            background: #4a90e2;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .arrow {
            color: #4a90e2;
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Messages d'alerte */
        .alert {
            border: none;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .route-display {
                flex-direction: column;
                text-align: center;
            }

            .arrow {
                transform: rotate(90deg);
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

        .voyage-details, .reservation-form {
            animation: fadeInUp 0.6s ease-out 0.2s both;
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
                    <h2><i class="bi bi-train-front-fill me-2"></i>Sélection du voyage</h2>
                    <div class="text-end">
                        <small>Réservation de billets</small>
                    </div>
                </div>
            </div>

            <!-- Bouton retour -->
            <div class="mb-4">
                <a href="recherche" class="back-button">
                    <i class="bi bi-arrow-left"></i> Retour à la recherche
                </a>
            </div>

            <c:if test="${not empty voyage}">
                <!-- Détails du voyage -->
                <div class="voyage-details">
                    <h3><i class="bi bi-info-circle-fill"></i>Détails du voyage</h3>
                    
                    <div class="route-display">
                        <div class="station">
                            <i class="bi bi-geo-alt-fill me-1"></i>
                            ${voyage.trajet.departStation.name}
                            <small class="d-block">${voyage.trajet.departStation.city}</small>
                        </div>
                        <div class="arrow">→</div>
                        <div class="station">
                            <i class="bi bi-geo-alt-fill me-1"></i>
                            ${voyage.trajet.arrivalStation.name}
                            <small class="d-block">${voyage.trajet.arrivalStation.city}</small>
                        </div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="bi bi-clock-fill text-primary"></i>
                            Heure de départ
                        </div>
                        <div class="detail-value">${voyage.heureDepartFormatted}</div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="bi bi-clock-history text-primary"></i>
                            Heure d'arrivée
                        </div>
                        <div class="detail-value">${voyage.heureArriveeFormatted}</div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="bi bi-hourglass-split text-primary"></i>
                            Durée du trajet
                        </div>
                        <div class="detail-value">${voyage.duree}</div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="bi bi-currency-euro text-success"></i>
                            Prix du billet
                        </div>
                        <div class="detail-value">
                            <span class="price-highlight">${voyage.prix} €</span>
                        </div>
                    </div>

                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="bi bi-people-fill text-info"></i>
                            Places disponibles
                        </div>
                        <div class="detail-value">
                            <span class="places-badge">${voyage.placesDisponibles} places</span>
                        </div>
                    </div>
                </div>

                <!-- Formulaire de réservation -->
                <div class="reservation-form">
                    <h3><i class="bi bi-ticket-perforated-fill"></i>Options de réservation</h3>
                    
                    <form action="selection" method="post">
                        <!-- Sélection de classe -->
                        <div class="form-group">
                            <label for="classe" class="form-label">
                                <i class="bi bi-star-fill text-warning"></i>
                                Classe de voyage
                            </label>
                            <select id="classe" name="classe" class="form-select" required>
                                <option value="Economique">Économique</option>
                                <option value="Deuxieme">2ème classe</option>
                                <option value="Premiere">1ère classe</option>
                            </select>
                        </div>

                        <!-- Préférences -->
                        <div class="form-group">
                            <label class="form-label">
                                <i class="bi bi-heart-fill text-danger"></i>
                                Préférences de voyage
                            </label>
                            <div class="preferences-container">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="fenetre" name="preferences" value="Fenêtre">
                                    <label for="fenetre">
                                        <i class="bi bi-window me-1"></i>
                                        Place côté fenêtre
                                    </label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="famille" name="preferences" value="Espace famille">
                                    <label for="famille">
                                        <i class="bi bi-people me-1"></i>
                                        Espace famille
                                    </label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="nonfumeur" name="preferences" value="Non-fumeur">
                                    <label for="nonfumeur">
                                        <i class="bi bi-ban me-1"></i>
                                        Wagon non-fumeur
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Trajet suivant -->
                        <div class="form-group">
                            <label for="nextTrajetId" class="form-label">
                                <i class="bi bi-plus-circle-fill text-success"></i>
                                Réserver un trajet supplémentaire depuis ${voyage.trajet.arrivalStation.city} ?
                            </label>
                            <select id="nextTrajetId" name="nextTrajetId" class="form-select">
                                <option value="">Non, merci</option>
                                <c:forEach var="nextTrajet" items="${nextTrajets}">
                                    <option value="${nextTrajet.id}">
                                        ${nextTrajet.departStation.name} (${nextTrajet.departStation.city}) → 
                                        ${nextTrajet.arrivalStation.name} (${nextTrajet.arrivalStation.city})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Bouton de confirmation -->
                        <button type="submit" class="confirm-button">
                            <i class="bi bi-check-circle-fill me-2"></i>
                            Confirmer la réservation
                        </button>
                    </form>
                </div>
            </c:if>

            <c:if test="${empty voyage}">
                <div class="alert alert-warning">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    Aucun voyage sélectionné. Veuillez retourner à la recherche.
                </div>
            </c:if>

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Système de réservation
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>