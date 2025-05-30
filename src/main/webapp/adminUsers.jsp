<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des utilisateurs</title>
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

        .bg-danger {
            background: linear-gradient(135deg, #dc3545 0%, #e83e8c 100%) !important;
        }

        /* Boutons d'action modernes */
        .btn-sm {
            padding: 0.5rem 1rem;
            border-radius: 0.75rem;
            font-weight: 500;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc3545 0%, #e83e8c 100%);
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
        }

        /* Message d'action impossible */
        .text-muted {
            font-style: italic;
            font-size: 0.9rem;
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
                    <h2><i class="bi bi-people-fill me-2"></i>Gestion des utilisateurs</h2>
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

            <!-- Tableau utilisateurs -->
            <c:if test="${not empty users}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-person me-1"></i>Nom d'utilisateur</th>
                                    <th><i class="bi bi-envelope me-1"></i>Email</th>
                                    <th><i class="bi bi-shield me-1"></i>Rôle</th>
                                    <th><i class="bi bi-activity me-1"></i>État</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td><strong>#${user.id}</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-person-circle me-2 text-primary"></i>
                                                ${user.username}
                                            </div>
                                        </td>
                                        <td>${user.email}</td>
                                        <td>
                                            <span class="badge bg-primary">
                                                <i class="bi bi-shield-check me-1"></i>${user.role}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-${user.blocked ? 'danger' : 'success'}">
                                                <i class="bi bi-${user.blocked ? 'x-circle' : 'check-circle'} me-1"></i>
                                                ${user.blocked ? 'Bloqué' : 'Actif'}
                                            </span>
                                        </td>
                                        <td>
                                            <c:if test="${user.id != currentUser.id}">
                                                <c:choose>
                                                    <c:when test="${user.blocked}">
                                                        <form action="${pageContext.request.contextPath}/admin/users" method="post" class="d-inline">
                                                            <input type="hidden" name="id" value="${user.id}">
                                                            <input type="hidden" name="action" value="unblock">
                                                            <button type="submit" class="btn btn-success btn-sm">
                                                                <i class="bi bi-unlock me-1"></i>Débloquer
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="${pageContext.request.contextPath}/admin/users" method="post" class="d-inline">
                                                            <input type="hidden" name="id" value="${user.id}">
                                                            <input type="hidden" name="action" value="block">
                                                            <button type="submit" class="btn btn-danger btn-sm">
                                                                <i class="bi bi-lock me-1"></i>Bloquer
                                                            </button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${user.id == currentUser.id}">
                                                <span class="text-muted">
                                                    <i class="bi bi-info-circle me-1"></i>Action impossible
                                                </span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty users}">
                <div class="empty-state">
                    <i class="bi bi-people"></i>
                    <h4>Aucun utilisateur trouvé</h4>
                    <p>Il n'y a actuellement aucun utilisateur dans le système.</p>
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