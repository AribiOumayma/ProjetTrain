<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Recherche de Trajets</title>
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

        /* Info d'authentification */
        .auth-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 1.5rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            border-left: 4px solid #4a90e2;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .auth-info a {
            color: #4a90e2;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .auth-info a:hover {
            color: #357abd;
            text-decoration: underline;
        }

        /* Formulaire de recherche */
        .search-form {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
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

        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .form-control:focus, .form-select:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
        }

        /* Bouton de recherche */
        .btn-search {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            border: none;
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(74, 144, 226, 0.3);
        }

        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
            color: white;
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

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        .alert-warning {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            color: #856404;
            border-left: 4px solid #ffc107;
        }

        /* Section des résultats */
        .results-section {
            margin-top: 2rem;
        }

        .results-header {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 1rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.3);
        }

        .results-header h3 {
            margin: 0;
            font-weight: 600;
            font-size: 1.4rem;
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
            font-size: 0.9rem;
        }

        .table thead th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #495057;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            padding: 1rem 0.75rem;
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
            transform: scale(1.005);
        }

        .table tbody td {
            padding: 1rem 0.75rem;
            vertical-align: middle;
            border-top: 1px solid #e9ecef;
        }

        /* Badges et prix */
        .price-original {
            text-decoration: line-through;
            color: #6c757d;
            font-size: 0.9rem;
        }

        .price-promo {
            color: #28a745;
            font-weight: 700;
            font-size: 1.1rem;
        }

        .badge {
            font-size: 0.75rem;
            padding: 0.4rem 0.8rem;
            border-radius: 2rem;
            font-weight: 500;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        }

        .bg-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%) !important;
        }

        .bg-warning {
            background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%) !important;
        }

        .bg-primary {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%) !important;
        }

        /* Boutons d'action */
        .btn-select {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.75rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(40, 167, 69, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-select:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
            color: white;
            text-decoration: none;
        }

        /* Promotions */
        .promotions-list {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .promotions-list li {
            background: linear-gradient(135deg, #e7f3ff 0%, #cce7ff 100%);
            padding: 0.3rem 0.6rem;
            border-radius: 0.5rem;
            margin-bottom: 0.3rem;
            font-size: 0.8rem;
            color: #004085;
            border-left: 3px solid #4a90e2;
        }

        /* Message admin */
        .admin-message {
            color: #6c757d;
            font-style: italic;
            font-weight: 500;
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

            .search-form {
                padding: 1.5rem;
            }

            .table-responsive {
                border-radius: 1rem;
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

        /* Effets de transition */
        .search-form, .table-container, .auth-info {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .search-form:hover, .table-container:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15);
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
                    <h2><i class="bi bi-search me-2"></i>Recherche de Trajets</h2>
                    <div class="text-end">
                        <small>Système de réservation</small>
                    </div>
                </div>
            </div>

            <!-- Informations d'authentification -->
            <div class="auth-info">
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <div class="d-flex align-items-center justify-content-between">
                            <div>
                                <i class="bi bi-person-check me-2 text-success"></i>
                                Bonjour <strong>${sessionScope.user.email}</strong> !
                            </div>
                            <div>
                                <a href="logout" class="me-3">
                                    <i class="bi bi-box-arrow-right me-1"></i>Se déconnecter
                                </a>
                                <c:if test="${sessionScope.user.admin}">
                                    <a href="${pageContext.request.contextPath}/dashboard" class="me-2">
                                        <i class="bi bi-speedometer2 me-1"></i>Dashboard Admin
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/promotions">
                                        <i class="bi bi-percent me-1"></i>Gérer les promotions
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <i class="bi bi-info-circle me-2"></i>
                            Vous pouvez rechercher des trajets sans vous connecter.
                            
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Messages d'erreur -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                </div>
            </c:if>

            <!-- Formulaire de recherche -->
            <div class="search-form">
                <form action="recherche" method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="villeDepart" class="form-label">
                                    <i class="bi bi-geo-alt"></i>Ville de départ
                                </label>
                                <select id="villeDepart" name="villeDepart" class="form-select" required>
                                    <option value="">Sélectionnez une ville</option>
                                    <c:forEach var="city" items="${cities}">
                                        <option value="${city}" ${city == villeDepart ? 'selected' : ''}>${city}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="villeDestination" class="form-label">
                                    <i class="bi bi-geo-alt-fill"></i>Ville de destination
                                </label>
                                <select id="villeDestination" name="villeDestination" class="form-select" required>
                                    <option value="">Sélectionnez une ville</option>
                                    <c:forEach var="city" items="${cities}">
                                        <option value="${city}" ${city == villeDestination ? 'selected' : ''}>${city}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="date" class="form-label">
                                    <i class="bi bi-calendar-event"></i>Date de départ
                                </label>
                                <input type="date" id="date" name="date" value="${date}" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn-search">
                            <i class="bi bi-search me-2"></i>Rechercher des trajets
                        </button>
                    </div>
                </form>
            </div>

            <!-- Résultats de recherche -->
            <c:if test="${not empty voyages}">
                <div class="results-section">
                    <div class="results-header">
                        <h3><i class="bi bi-list-check me-2"></i>Résultats de la recherche</h3>
                    </div>

                    <c:if test="${sessionScope.user == null}">
                        <div class="alert alert-warning">
                            <i class="bi bi-info-circle me-2"></i>
                            Vous devez vous connecter pour sélectionner un trajet et procéder à la réservation.
                        </div>
                    </c:if>

                    <div class="table-container">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead>
                                    <tr>
                                        <th><i class="bi bi-geo-alt me-1"></i>Départ</th>
                                        <th><i class="bi bi-geo-alt-fill me-1"></i>Arrivée</th>
                                        <th><i class="bi bi-clock me-1"></i>Départ</th>
                                        <th><i class="bi bi-clock-fill me-1"></i>Arrivée</th>
                                        <th><i class="bi bi-hourglass me-1"></i>Durée</th>
                                        <th><i class="bi bi-currency-euro me-1"></i>Prix</th>
                                        <th><i class="bi bi-people me-1"></i>Places</th>
                                        <th><i class="bi bi-percent me-1"></i>Promotions</th>
                                        <th><i class="bi bi-check-circle me-1"></i>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="voyage" items="${voyages}">
                                        <tr>
                                            <td>
                                                <div>
                                                    <strong>${voyage.trajet.departStation.name}</strong>
                                                    <br><small class="text-muted">${voyage.trajet.departStation.city}</small>
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                    <strong>${voyage.trajet.arrivalStation.name}</strong>
                                                    <br><small class="text-muted">${voyage.trajet.arrivalStation.city}</small>
                                                </div>
                                            </td>
                                            <td><strong>${voyage.heureDepartFormatted}</strong></td>
                                            <td><strong>${voyage.heureArriveeFormatted}</strong></td>
                                            <td>
                                                <span class="badge bg-primary">
                                                    <i class="bi bi-clock me-1"></i>${voyage.duree}
                                                </span>
                                            </td>
                                            <td>
                                                <c:set var="originalPrice" value="${voyage.prix}"/>
                                                <c:set var="bestDiscount" value="0"/>
                                                <c:forEach var="promo" items="${voyagePromotions[voyage.id]}">
                                                    <c:if test="${promo.discountPercentage > bestDiscount}">
                                                        <c:set var="bestDiscount" value="${promo.discountPercentage}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${bestDiscount > 0}">
                                                        <div class="price-original">${originalPrice} €</div>
                                                        <div class="price-promo">${originalPrice * (1 - bestDiscount / 100)} €</div>
                                                        <small class="text-success">-${bestDiscount}%</small>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="price-promo">${originalPrice} €</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <span class="badge bg-${voyage.placesDisponibles > 10 ? 'success' : 'warning'}">
                                                    <i class="bi bi-people me-1"></i>${voyage.placesDisponibles}
                                                </span>
                                            </td>
                                            <td>
                                                <c:if test="${not empty voyagePromotions[voyage.id]}">
                                                    <ul class="promotions-list">
                                                        <c:forEach var="promo" items="${voyagePromotions[voyage.id]}">
                                                            <li>
                                                                <strong>${promo.code}</strong>: ${promo.description} (-${promo.discountPercentage}%)
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${sessionScope.user != null && sessionScope.user.admin}">
                                                        <span class="admin-message">
                                                            <i class="bi bi-shield-check me-1"></i>Admin - Accès au dashboard
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${sessionScope.user != null}">
                                                        <a href="selection?voyageId=${voyage.id}" class="btn-select">
                                                            <i class="bi bi-check-circle"></i>Sélectionner
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="login?voyageId=${voyage.id}" class="btn-select">
                                                            <i class="bi bi-check-circle"></i>Sélectionner
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty voyages && not empty villeDepart}">
                <div class="empty-state">
                    <i class="bi bi-search"></i>
                    <h4>Aucun trajet trouvé</h4>
                    <p>Aucun trajet disponible pour les critères sélectionnés. Essayez avec d'autres dates ou destinations.</p>
                </div>
            </c:if>

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Système de réservation de trajets
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>