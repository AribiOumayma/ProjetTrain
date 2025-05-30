<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des voyages</title>
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
            background: linear-gradient(135deg, #6f42c1 0%, #5a3699 100%);
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

        /* Alerts modernes */
        .alert {
            border: none;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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

        /* Formulaire moderne */
        .form-container {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            border: 1px solid rgba(111, 66, 193, 0.1);
        }

        .form-container h3 {
            color: #6f42c1;
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
            font-weight: 500;
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
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: #6f42c1;
            box-shadow: 0 0 0 0.2rem rgba(111, 66, 193, 0.25);
        }

        .btn-primary {
            background: linear-gradient(135deg, #6f42c1 0%, #5a3699 100%);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(111, 66, 193, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(111, 66, 193, 0.4);
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
            background: linear-gradient(90deg, #6f42c1 0%, #5a3699 100%);
        }

        .table tbody tr {
            transition: all 0.3s ease;
            border: none;
        }

        .table tbody tr:hover {
            background-color: rgba(111, 66, 193, 0.05);
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

        .bg-info {
            background: linear-gradient(135deg, #17a2b8 0%, #138496 100%) !important;
        }

        .bg-warning {
            background: linear-gradient(135deg, #ffc107 0%, #e0a800 100%) !important;
            color: #212529 !important;
        }

        /* Boutons d'action modernes */
        .btn-sm {
            padding: 0.5rem 1rem;
            border-radius: 0.75rem;
            font-weight: 500;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
            margin-right: 0.5rem;
        }

        .btn-warning {
            background: linear-gradient(135deg, #ffc107 0%, #e0a800 100%);
            color: #212529;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.4);
            color: #212529;
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
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

            .form-container {
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
                    <h2><i class="bi bi-train-front-fill me-2"></i>Gestion des voyages</h2>
                    <div class="text-end">
                        <small>Administration système</small>
                    </div>
                </div>
            </div>

            <!-- Bouton retour -->
            <div class="mb-4">
                <a href="${pageContext.request.contextPath}/admin" class="back-button">
                    <i class="bi bi-arrow-left"></i> Retour à l'espace admin
                </a>
            </div>

            <!-- Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <i class="bi bi-check-circle-fill me-2"></i>${success}
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                </div>
            </c:if>

            <!-- Formulaire d'ajout/modification -->
            <div class="form-container">
                <h3>
                    <i class="bi bi-plus-circle-fill"></i>
                    <c:choose>
                        <c:when test="${not empty voyage}">Modifier un voyage</c:when>
                        <c:otherwise>Ajouter un voyage</c:otherwise>
                    </c:choose>
                </h3>
                
                <form action="voyages" method="post">
                    <c:choose>
                        <c:when test="${not empty voyage}">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${voyage.id}">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="action" value="add">
                        </c:otherwise>
                    </c:choose>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="trajetId" class="form-label">
                                    <i class="bi bi-signpost-2"></i>Trajet
                                </label>
                                <select id="trajetId" name="trajetId" class="form-select" required>
                                    <option value="">Sélectionner un trajet</option>
                                    <c:forEach var="trajet" items="${trajets}">
                                        <option value="${trajet.id}" ${trajet.id == voyage.trajet.id ? 'selected' : ''}>
                                            ${trajet.departStation.name} → ${trajet.arrivalStation.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="prix" class="form-label">
                                    <i class="bi bi-currency-euro"></i>Prix
                                </label>
                                <input type="number" id="prix" name="prix" class="form-control" 
                                       step="0.01" value="${voyage.prix}" required placeholder="0.00">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="heureDepart" class="form-label">
                                    <i class="bi bi-clock"></i>Heure de départ
                                </label>
                                <input type="datetime-local" id="heureDepart" name="heureDepart" 
                                       class="form-control" value="${voyage.heureDepart}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="heureArrivee" class="form-label">
                                    <i class="bi bi-clock-fill"></i>Heure d'arrivée
                                </label>
                                <input type="datetime-local" id="heureArrivee" name="heureArrivee" 
                                       class="form-control" value="${voyage.heureArrivee}" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="placesDisponibles" class="form-label">
                                    <i class="bi bi-people"></i>Places disponibles
                                </label>
                                <input type="number" id="placesDisponibles" name="placesDisponibles" 
                                       class="form-control" value="${voyage.placesDisponibles}" required placeholder="0">
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-${not empty voyage ? 'pencil' : 'plus'}-square me-1"></i>
                            <c:choose>
                                <c:when test="${not empty voyage}">Mettre à jour</c:when>
                                <c:otherwise>Ajouter le voyage</c:otherwise>
                            </c:choose>
                        </button>
                    </div>
                </form>
            </div>

            <!-- Tableau des voyages -->
            <c:if test="${not empty voyages}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-signpost-2 me-1"></i>Trajet</th>
                                    <th><i class="bi bi-clock me-1"></i>Départ</th>
                                    <th><i class="bi bi-clock-fill me-1"></i>Arrivée</th>
                                    <th><i class="bi bi-currency-euro me-1"></i>Prix</th>
                                    <th><i class="bi bi-people me-1"></i>Places</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="voyage" items="${voyages}">
                                    <tr>
                                        <td><strong>#${voyage.id}</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-arrow-right-circle me-2 text-primary"></i>
                                                <span class="text-truncate">
                                                    ${voyage.trajet.departStation.name} → ${voyage.trajet.arrivalStation.name}
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-info">
                                                <i class="bi bi-calendar-event me-1"></i>
                                                ${voyage.heureDepartFormatted}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-warning">
                                                <i class="bi bi-calendar-check me-1"></i>
                                                ${voyage.heureArriveeFormatted}
                                            </span>
                                        </td>
                                        <td>
                                            <strong class="text-success">${voyage.prix} €</strong>
                                        </td>
                                        <td>
                                            <span class="badge bg-secondary">
                                                <i class="bi bi-person-check me-1"></i>
                                                ${voyage.placesDisponibles}
                                            </span>
                                        </td>
                                        <td>
                                            <a href="voyages?action=edit&id=${voyage.id}" class="btn btn-warning btn-sm">
                                                <i class="bi bi-pencil me-1"></i>Modifier
                                            </a>
                                            <a href="voyages?action=delete&id=${voyage.id}" 
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce voyage ?')">
                                                <i class="bi bi-trash me-1"></i>Supprimer
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty voyages}">
                <div class="empty-state">
                    <i class="bi bi-train-front"></i>
                    <h4>Aucun voyage trouvé</h4>
                    <p>Il n'y a actuellement aucun voyage programmé dans le système.</p>
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