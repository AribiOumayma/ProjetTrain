<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Promotions</title>
   
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
   
    <style>
        /* Variables CSS cohérentes avec navbar.jsp */
        :root {
            --primary-gradient: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
            --light-gradient: linear-gradient(180deg, #f8f9fa 0%, #e6f0fa 100%);
            --shadow-light: 0 4px 15px rgba(0, 0, 0, 0.1);
            --shadow-medium: 0 8px 25px rgba(0, 0, 0, 0.15);
            --shadow-strong: 0 15px 35px rgba(0, 0, 0, 0.2);
            --border-radius: 1rem;
            --transition: all 0.3s ease;
            --success-gradient: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            --danger-gradient: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            --warning-gradient: linear-gradient(135deg, #ffc107 0%, #ff8c00 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding-top: 0; /* Sera ajusté par le navbar */
        }

        /* Conteneur principal avec marge pour sidebar si admin */
        .main-container {
            margin-left: 0;
            padding: 2rem;
            min-height: calc(100vh - 120px);
            transition: var(--transition);
        }

        /* Ajustement pour admin avec sidebar */
        .admin-layout .main-container {
            margin-left: 270px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 2rem;
            box-shadow: var(--shadow-strong);
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        /* En-tête de page */
        .page-header {
            background: var(--primary-gradient);
            color: white;
            padding: 2.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
        }

        .page-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .page-header .subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Breadcrumb */
        .breadcrumb-section {
            background: var(--light-gradient);
            padding: 1.5rem 2rem;
            border-bottom: 1px solid rgba(74, 144, 226, 0.1);
        }

        .breadcrumb-link {
            color: #4a90e2;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            background: rgba(74, 144, 226, 0.05);
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .breadcrumb-link:hover {
            color: white;
            background: var(--primary-gradient);
            transform: translateX(-5px);
            box-shadow: var(--shadow-light);
            border-color: transparent;
        }

        /* Content wrapper */
        .content-wrapper {
            padding: 2.5rem;
        }

        /* Messages d'état */
        .alert {
            padding: 1.25rem 1.5rem;
            border-radius: var(--border-radius);
            margin-bottom: 2rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 1rem;
            animation: slideIn 0.5s ease;
            border-left: 4px solid;
        }

        .alert-success {
            background: linear-gradient(135deg, rgba(40, 167, 69, 0.1) 0%, rgba(32, 201, 151, 0.1) 100%);
            color: #155724;
            border-left-color: #28a745;
            border: 1px solid rgba(40, 167, 69, 0.2);
        }

        .alert-error {
            background: linear-gradient(135deg, rgba(220, 53, 69, 0.1) 0%, rgba(200, 35, 51, 0.1) 100%);
            color: #721c24;
            border-left-color: #dc3545;
            border: 1px solid rgba(220, 53, 69, 0.2);
        }

        .alert::before {
            font-size: 1.5rem;
        }

        .alert-success::before {
            content: '✅';
        }

        .alert-error::before {
            content: '❌';
        }

        /* Sections de formulaire */
        .form-section {
            background: #ffffff;
            border-radius: 1.5rem;
            padding: 2.5rem;
            margin-bottom: 2.5rem;
            box-shadow: var(--shadow-light);
            border: 1px solid rgba(74, 144, 226, 0.1);
            position: relative;
            overflow: hidden;
        }

        .form-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .section-title {
            color: #1e293b;
            font-size: 1.75rem;
            margin-bottom: 2rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .section-title::before {
            font-size: 1.5rem;
        }

        .section-title.add::before {
            content: '➕';
        }

        .section-title.edit::before {
            content: '✏️';
        }

        .section-title.list::before {
            content: '📋';
        }

        /* Grille de formulaire */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .form-group label {
            color: #374151;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 1rem 1.25rem;
            border: 2px solid #e2e8f0;
            border-radius: var(--border-radius);
            font-size: 0.95rem;
            font-family: inherit;
            transition: var(--transition);
            background: #ffffff;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
            transform: translateY(-2px);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* Description en pleine largeur */
        .form-group.full-width {
            grid-column: 1 / -1;
        }

        /* Boutons */
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: var(--border-radius);
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-family: inherit;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: var(--primary-gradient);
            color: white;
            box-shadow: var(--shadow-light);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
        }

        .btn-secondary {
            background: #f8f9fa;
            color: #6c757d;
            border: 2px solid #dee2e6;
        }

        .btn-secondary:hover {
            background: #e9ecef;
            transform: translateY(-2px);
            box-shadow: var(--shadow-light);
        }

        .btn-success {
            background: var(--success-gradient);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.3);
        }

        .btn-danger {
            background: var(--danger-gradient);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(220, 53, 69, 0.3);
        }

        .btn-sm {
            padding: 0.75rem 1.5rem;
            font-size: 0.85rem;
        }

        /* Tableau */
        .table-section {
            background: #ffffff;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: var(--shadow-light);
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .table-header {
            background: var(--light-gradient);
            padding: 2rem 2.5rem;
            border-bottom: 1px solid rgba(74, 144, 226, 0.1);
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: var(--primary-gradient);
            color: white;
            padding: 1.25rem 1.5rem;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        td {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid #f1f5f9;
            color: #374151;
            vertical-align: middle;
        }

        tr:hover {
            background: #f8fafc;
        }

        .table-code {
            font-weight: 600;
            color: #4a90e2;
        }

        .table-discount {
            font-weight: 600;
            color: #28a745;
        }

        .table-dates {
            font-size: 0.85rem;
            color: #6c757d;
            line-height: 1.4;
        }

        /* Badges de statut */
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-align: center;
            display: inline-block;
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

        .status-general {
            background: linear-gradient(135deg, #8b5cf6 0%, #a855f7 100%);
            color: white;
        }

        .status-specific {
            background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%);
            color: white;
        }

        /* Actions dans le tableau */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        /* État vide */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #6b7280;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            opacity: 0.5;
            color: #4a90e2;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #374151;
        }

        .empty-state p {
            font-size: 1rem;
            opacity: 0.8;
        }

        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .fade-in {
            animation: fadeIn 0.6s ease;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .admin-layout .main-container {
                margin-left: 0;
            }

            .main-container {
                padding: 1rem;
            }

            .page-header {
                padding: 2rem 1.5rem;
            }

            .page-header h2 {
                font-size: 2rem;
            }

            .content-wrapper {
                padding: 1.5rem;
            }

            .form-section {
                padding: 1.5rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .table-header {
                padding: 1.5rem;
            }

            th, td {
                padding: 1rem 0.75rem;
                font-size: 0.85rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-buttons .btn {
                width: 100%;
            }
        }

        @media (max-width: 576px) {
            .page-header h2 {
                font-size: 1.75rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            .form-section {
                padding: 1.25rem;
            }

            .content-wrapper {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
   
    <div class="main-container">
        <div class="container fade-in">
            <!-- En-tête de page -->
            <div class="page-header">
                <h2>🎁 Gestion des Promotions</h2>
                <p class="subtitle">Créez et gérez vos offres promotionnelles</p>
            </div>

            <!-- Breadcrumb -->
            <div class="breadcrumb-section">
                <a href="${pageContext.request.contextPath}/recherche" class="breadcrumb-link">
                    <i class="bi bi-arrow-left"></i>
                    Retour à la recherche
                </a>
            </div>

            <div class="content-wrapper">
                <!-- Messages d'état -->
                <c:if test="${not empty error}">
                    <div class="alert alert-error" aria-live="polite">
                        <div>
                            <strong>Erreur :</strong> ${error}
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty message}">
                    <div class="alert alert-success" aria-live="polite">
                        <div>
                            <strong>Succès :</strong> ${message}
                        </div>
                    </div>
                </c:if>

                <!-- Formulaire d'ajout/modification -->
                <div class="form-section">
                    <h3 class="section-title ${editPromotion != null ? 'edit' : 'add'}">
                        ${editPromotion != null ? 'Modifier une promotion' : 'Ajouter une promotion'}
                    </h3>
                   
                    <form action="${pageContext.request.contextPath}/admin/promotions" method="post">
                        <input type="hidden" name="action" value="${editPromotion != null ? 'update' : 'add'}">
                        <c:if test="${editPromotion != null}">
                            <input type="hidden" name="promotionId" value="${editPromotion.id}">
                        </c:if>

                        <div class="form-grid">
                            <div class="form-group">
                                <label for="code">
                                    <i class="bi bi-tag"></i>
                                    Code de la promotion
                                </label>
                                <input type="text" id="code" name="code"
                                       value="${editPromotion != null ? editPromotion.code : ''}"
                                       placeholder="Ex: SUMMER2024" required>
                            </div>

                            <div class="form-group">
                                <label for="discountPercentage">
                                    <i class="bi bi-percent"></i>
                                    Pourcentage de réduction
                                </label>
                                <input type="number" id="discountPercentage" name="discountPercentage"
                                       step="0.1" min="0" max="100"
                                       value="${editPromotion != null ? editPromotion.discountPercentage : ''}"
                                       placeholder="Ex: 15.5" required>
                            </div>

                            <div class="form-group">
                                <label for="startDate">
                                    <i class="bi bi-calendar-check"></i>
                                    Date de début
                                </label>
                                <input type="date" id="startDate" name="startDate"
                                       value="${editPromotion != null ? editPromotion.startDate : ''}" required>
                            </div>

                            <div class="form-group">
                                <label for="endDate">
                                    <i class="bi bi-calendar-x"></i>
                                    Date de fin
                                </label>
                                <input type="date" id="endDate" name="endDate"
                                       value="${editPromotion != null ? editPromotion.endDate : ''}" required>
                            </div>

                            <div class="form-group">
                                <label for="trajetId">
                                    <i class="bi bi-geo-alt"></i>
                                    Trajet concerné
                                </label>
                                <select id="trajetId" name="trajetId">
                                    <option value="">Aucun (promotion générale)</option>
                                    <c:forEach var="trajet" items="${trajets}">
                                        <option value="${trajet.id}"
                                                ${editPromotion != null && editPromotion.trajet != null && editPromotion.trajet.id == trajet.id ? 'selected' : ''}>
                                            ${trajet.departStation.city} → ${trajet.arrivalStation.city}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="minLoyaltyPoints">
                                    <i class="bi bi-star"></i>
                                    Points de fidélité minimum
                                </label>
                                <input type="number" id="minLoyaltyPoints" name="minLoyaltyPoints" min="0"
                                       value="${editPromotion != null && editPromotion.minLoyaltyPoints != null ? editPromotion.minLoyaltyPoints : ''}"
                                       placeholder="Laisser vide si aucun requis">
                            </div>

                            <div class="form-group full-width">
                                <label for="description">
                                    <i class="bi bi-file-text"></i>
                                    Description
                                </label>
                                <textarea id="description" name="description"
                                          placeholder="Description détaillée de la promotion...">${editPromotion != null ? editPromotion.description : ''}</textarea>
                            </div>
                        </div>

                        <div class="button-group">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-${editPromotion != null ? 'check-lg' : 'plus-lg'}"></i>
                                ${editPromotion != null ? 'Modifier la promotion' : 'Ajouter la promotion'}
                            </button>
                            <c:if test="${editPromotion != null}">
                                <button type="button" class="btn btn-secondary"
                                        onclick="window.location.href='${pageContext.request.contextPath}/admin/promotions'">
                                    <i class="bi bi-x-lg"></i>
                                    Annuler les modifications
                                </button>
                            </c:if>
                        </div>
                    </form>
                </div>

                <!-- Liste des promotions -->
                <div class="table-section">
                    <div class="table-header">
                        <h3 class="section-title list">Promotions existantes</h3>
                    </div>
                   
                    <c:choose>
                        <c:when test="${not empty promotions}">
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th><i class="bi bi-tag"></i> Code</th>
                                            <th><i class="bi bi-file-text"></i> Description</th>
                                            <th><i class="bi bi-percent"></i> Réduction</th>
                                            <th><i class="bi bi-calendar"></i> Période</th>
                                            <th><i class="bi bi-geo-alt"></i> Trajet</th>
                                            <th><i class="bi bi-star"></i> Points min.</th>
                                            <th><i class="bi bi-gear"></i> Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="promotion" items="${promotions}">
                                            <tr>
                                                <td class="table-code">${promotion.code}</td>
                                                <td>${promotion.description}</td>
                                                <td class="table-discount">${promotion.discountPercentage}%</td>
                                                <td class="table-dates">
                                                    <div>📅 ${promotion.startDate}</div>
                                                    <div>📅 ${promotion.endDate}</div>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${promotion.trajet != null}">
                                                            <span class="status-badge status-specific">
                                                                ${promotion.trajet.departStation.city} → ${promotion.trajet.arrivalStation.city}
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="status-badge status-general">Générale</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${promotion.minLoyaltyPoints != null}">
                                                            <i class="bi bi-star-fill" style="color: #ffc107;"></i> ${promotion.minLoyaltyPoints}
                                                        </c:when>
                                                        <c:otherwise>—</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <div class="action-buttons">
                                                        <form action="${pageContext.request.contextPath}/admin/promotions" method="post" style="display:inline;">
                                                            <input type="hidden" name="action" value="edit">
                                                            <input type="hidden" name="promotionId" value="${promotion.id}">
                                                            <button type="submit" class="btn btn-success btn-sm">
                                                                <i class="bi bi-pencil"></i>
                                                                Modifier
                                                            </button>
                                                        </form>
                                                        <form action="${pageContext.request.contextPath}/admin/promotions" method="post" style="display:inline;">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="promotionId" value="${promotion.id}">
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                    onclick="return confirm('🗑️ Êtes-vous sûr de vouloir supprimer la promotion « ${promotion.code} » ?\n\nCette action est irréversible.');">
                                                                <i class="bi bi-trash"></i>
                                                                Supprimer
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="bi bi-gift"></i>
                                <h3>Aucune promotion trouvée</h3>
                                <p>Commencez par créer votre première promotion pour attirer plus de clients !</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                   
                </div>
                 <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Interface d'administration
            </div>
            </div>
              
        </div>
    </div>

    <script>
        // Script pour détecter si c'est un admin et ajuster le layout
        document.addEventListener('DOMContentLoaded', function() {
            // Si la sidebar existe, on est en mode admin
            const sidebar = document.querySelector('.sidebar-custom');
            if (sidebar) {
                document.body.classList.add('admin-layout');
            }
        });
    </script>
</body>
</html>