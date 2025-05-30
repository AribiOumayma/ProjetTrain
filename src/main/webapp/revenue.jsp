<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Revenus générés</title>
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

        /* Formulaire moderne */
        .form-container {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.75rem;
        }

        .form-control {
            border-radius: 0.75rem;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
        }

        /* Boutons modernes */
        .btn {
            border-radius: 0.75rem;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-primary {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(40, 167, 69, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
        }

        /* Container des résultats */
        .results-container {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            border-left: 4px solid #28a745;
        }

        /* Carte de résultat des revenus */
        .revenue-card {
            background: linear-gradient(135deg, #e8f5e8 0%, #d4edda 100%);
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(40, 167, 69, 0.2);
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.1);
        }

        .revenue-amount {
            font-size: 2.5rem;
            font-weight: 700;
            color: #155724;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .revenue-currency {
            font-size: 1.5rem;
            color: #28a745;
            font-weight: 600;
        }

        .revenue-label {
            font-size: 1.1rem;
            color: #6c757d;
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .revenue-icon {
            font-size: 3rem;
            color: #28a745;
            margin-bottom: 1rem;
        }

        /* Info période */
        .period-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 0.75rem;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid #6c757d;
            font-weight: 500;
            color: #495057;
        }

        /* Stats additionnelles */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .stat-card {
            background: white;
            border-radius: 0.75rem;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .stat-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.9rem;
            color: #6c757d;
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

            .form-container {
                padding: 1.5rem;
            }

            .results-container {
                padding: 1.5rem;
            }

            .revenue-amount {
                font-size: 2rem;
            }

            .revenue-currency {
                font-size: 1.2rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
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

        /* Animation pour les cartes de stats */
        @keyframes scaleIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .revenue-card {
            animation: scaleIn 0.8s ease-out;
        }

        .stat-card {
            animation: fadeInUp 0.6s ease-out;
        }

        .stat-card:nth-child(1) { animation-delay: 0.1s; }
        .stat-card:nth-child(2) { animation-delay: 0.2s; }
        .stat-card:nth-child(3) { animation-delay: 0.3s; }
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
                    <h2><i class="bi bi-currency-euro me-2"></i>Revenus générés</h2>
                    <div class="text-end">
                        <small>Analytics Financiers</small>
                    </div>
                </div>
            </div>

            <!-- Bouton retour -->
            <div class="mb-4">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-button">
                    <i class="bi bi-arrow-left"></i> Retour au tableau de bord
                </a>
            </div>

            <!-- Formulaire de sélection -->
            <div class="form-container">
                <h4 class="mb-4"><i class="bi bi-calendar-date me-2"></i>Période d'analyse</h4>
                <form method="post" action="${pageContext.request.contextPath}/admin/revenue">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="startDate" class="form-label">
                                <i class="bi bi-calendar-event me-1"></i>Date de début
                            </label>
                            <input type="datetime-local" class="form-control" id="startDate" name="startDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="endDate" class="form-label">
                                <i class="bi bi-calendar-event me-1"></i>Date de fin
                            </label>
                            <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
                        </div>
                    </div>
                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-calculator me-2"></i>Calculer les revenus
                        </button>
                    </div>
                </form>
            </div>

            <!-- Affichage des résultats -->
            <c:if test="${not empty totalRevenue}">
                <div class="results-container">
                    <!-- Information sur la période -->
                    <div class="period-info">
                        <i class="bi bi-calendar-range me-2"></i>
                        <strong>Période analysée :</strong> ${startDate} à ${endDate}
                    </div>

                    <!-- Carte principale des revenus -->
                    <div class="revenue-card">
                        <div class="revenue-icon">
                            <i class="bi bi-cash-stack"></i>
                        </div>
                        <div class="revenue-label">Revenus totaux générés</div>
                        <div class="revenue-amount">
                            <fmt:formatNumber value="${totalRevenue}" pattern="#,##0.00"/>
                            <span class="revenue-currency">€</span>
                        </div>
                    </div>

                    <!-- Statistiques additionnelles -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-icon text-info">
                                <i class="bi bi-graph-up-arrow"></i>
                            </div>
                            <div class="stat-value text-info">
                                <fmt:formatNumber value="${totalRevenue / 30}" pattern="#,##0.00"/>€
                            </div>
                            <div class="stat-label">Revenus moyens/jour</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon text-warning">
                                <i class="bi bi-calendar-week"></i>
                            </div>
                            <div class="stat-value text-warning">
                                <fmt:formatNumber value="${totalRevenue / 4}" pattern="#,##0.00"/>€
                            </div>
                            <div class="stat-label">Revenus moyens/semaine</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon text-success">
                                <i class="bi bi-calendar-month"></i>
                            </div>
                            <div class="stat-value text-success">
                                <fmt:formatNumber value="${totalRevenue}" pattern="#,##0.00"/>€
                            </div>
                            <div class="stat-label">Revenus de la période</div>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Mon Application JEE - Gestion financière
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>