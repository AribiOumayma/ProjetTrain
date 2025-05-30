<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des trajets</title>
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

        /* Section de formulaire moderne */
        .form-section {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .form-section h3 {
            color: #4a90e2;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Formulaires stylés */
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-select, .form-control {
            border: 2px solid #e9ecef;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .form-select:focus, .form-control:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
            background-color: white;
        }

        /* Boutons modernes */
        .btn-primary {
            background: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
            background: linear-gradient(135deg, #357abd 0%, #2c6aa0 100%);
        }

        .btn-warning {
            background: linear-gradient(135deg, #ffc107 0%, #e0a800 100%);
            border: none;
            color: #212529;
            font-weight: 500;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.4);
            color: #212529;
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            border: none;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
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

            .form-section {
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

        /* Style pour les boutons dans le tableau */
        .btn-sm {
            padding: 0.4rem 0.8rem;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            margin: 0 0.2rem;
        }

        /* Style pour les formulaires inline dans le tableau */
        .table form {
            display: inline-block;
            margin: 0;
        }

        /* Card pour le formulaire d'édition */
        .edit-form-card {
            background: linear-gradient(135deg, #fff8e1 0%, #fff3c4 100%);
            border: 2px solid #ffc107;
            border-radius: 1rem;
            padding: 2rem;
            margin-top: 2rem;
            box-shadow: 0 8px 25px rgba(255, 193, 7, 0.2);
        }

        .edit-form-card h3 {
            color: #856404;
            display: flex;
            align-items: center;
            gap: 0.5rem;
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
                    <h2><i class="bi bi-geo-alt-fill me-2"></i>Gestion des trajets</h2>
                    <div class="text-end">
                        <small>Administration système</small>
                    </div>
                </div>
            </div>

            <!-- Bouton retour -->
            <div class="mb-4">
                <a href="${pageContext.request.contextPath}/monCompte" class="back-button">
                    <i class="bi bi-arrow-left"></i> Retour au compte
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

            <!-- Section d'ajout de trajet -->
            <div class="form-section">
                <h3><i class="bi bi-plus-circle-fill"></i>Ajouter un trajet</h3>
                <form action="${pageContext.request.contextPath}/admin/trajets" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="row">
                        <div class="col-md-5">
                            <label for="departStationId" class="form-label">
                                <i class="bi bi-geo-alt me-1"></i>Gare de départ
                            </label>
                            <select name="departStationId" id="departStationId" class="form-select" required>
                                <option value="">Sélectionnez une gare de départ</option>
                                <c:forEach var="station" items="${stations}">
                                    <option value="${station.id}">${station.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <label for="arrivalStationId" class="form-label">
                                <i class="bi bi-geo me-1"></i>Gare d'arrivée
                            </label>
                            <select name="arrivalStationId" id="arrivalStationId" class="form-select" required>
                                <option value="">Sélectionnez une gare d'arrivée</option>
                                <c:forEach var="station" items="${stations}">
                                    <option value="${station.id}">${station.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="bi bi-plus-lg me-1"></i>Ajouter
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Tableau des trajets -->
            <c:if test="${not empty trajets}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-geo-alt me-1"></i>Gare Départ</th>
                                    <th><i class="bi bi-geo me-1"></i>Gare Arrivée</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="trajet" items="${trajets}">
                                    <tr>
                                        <td><strong>#${trajet.id}</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-geo-alt-fill me-2 text-primary"></i>
                                                ${trajet.departStation.name}
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-geo-fill me-2 text-success"></i>
                                                ${trajet.arrivalStation.name}
                                            </div>
                                        </td>
                                        <td>
                                            <!-- Bouton Modifier -->
                                            <form action="${pageContext.request.contextPath}/admin/trajets" method="get" class="d-inline">
                                                <input type="hidden" name="action" value="edit">
                                                <input type="hidden" name="id" value="${trajet.id}">
                                                <button type="submit" class="btn btn-warning btn-sm">
                                                    <i class="bi bi-pencil me-1"></i>Modifier
                                                </button>
                                            </form>
                                            <!-- Bouton Supprimer -->
                                            <form action="${pageContext.request.contextPath}/admin/trajets" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="${trajet.id}">
                                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce trajet ?')">
                                                    <i class="bi bi-trash me-1"></i>Supprimer
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Formulaire de modification (si un trajet est sélectionné pour édition) -->
                <c:if test="${not empty trajet}">
                    <div class="edit-form-card">
                        <h3><i class="bi bi-pencil-square"></i>Modifier le trajet #${trajet.id}</h3>
                        <form action="${pageContext.request.contextPath}/admin/trajets" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${trajet.id}">
                            <div class="row">
                                <div class="col-md-5">
                                    <label for="editDepartStationId" class="form-label">
                                        <i class="bi bi-geo-alt me-1"></i>Gare de départ
                                    </label>
                                    <select name="departStationId" id="editDepartStationId" class="form-select" required>
                                        <c:forEach var="station" items="${stations}">
                                            <option value="${station.id}" ${station.id == trajet.departStation.id ? 'selected' : ''}>
                                                ${station.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label for="editArrivalStationId" class="form-label">
                                        <i class="bi bi-geo me-1"></i>Gare d'arrivée
                                    </label>
                                    <select name="arrivalStationId" id="editArrivalStationId" class="form-select" required>
                                        <c:forEach var="station" items="${stations}">
                                            <option value="${station.id}" ${station.id == trajet.arrivalStation.id ? 'selected' : ''}>
                                                ${station.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-warning w-100">
                                        <i class="bi bi-check-lg me-1"></i>Mettre à jour
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </c:if>

            <c:if test="${empty trajets}">
                <div class="empty-state">
                    <i class="bi bi-geo-alt"></i>
                    <h4>Aucun trajet trouvé</h4>
                    <p>Il n'y a actuellement aucun trajet configuré dans le système.</p>
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

    <script>
        // Validation côté client pour éviter de sélectionner la même gare
        document.addEventListener('DOMContentLoaded', function() {
            const departSelect = document.getElementById('departStationId');
            const arrivalSelect = document.getElementById('arrivalStationId');
           
            function validateStations() {
                if (departSelect.value && arrivalSelect.value && departSelect.value === arrivalSelect.value) {
                    alert('La gare de départ et d\'arrivée ne peuvent pas être identiques !');
                    arrivalSelect.value = '';
                }
            }
           
            if (departSelect && arrivalSelect) {
                departSelect.addEventListener('change', validateStations);
                arrivalSelect.addEventListener('change', validateStations);
            }
           
            // Même validation pour le formulaire de modification
            const editDepartSelect = document.getElementById('editDepartStationId');
            const editArrivalSelect = document.getElementById('editArrivalStationId');
           
            if (editDepartSelect && editArrivalSelect) {
                editDepartSelect.addEventListener('change', function() {
                    if (editDepartSelect.value && editArrivalSelect.value && editDepartSelect.value === editArrivalSelect.value) {
                        alert('La gare de départ et d\'arrivée ne peuvent pas être identiques !');
                        editArrivalSelect.value = '';
                    }
                });
               
                editArrivalSelect.addEventListener('change', function() {
                    if (editDepartSelect.value && editArrivalSelect.value && editDepartSelect.value === editArrivalSelect.value) {
                        alert('La gare de départ et d\'arrivée ne peuvent pas être identiques !');
                        editArrivalSelect.value = '';
                    }
                });
            }
        });
    </script>

</body>
</html>