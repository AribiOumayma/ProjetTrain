<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord administrateur</title>
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
            background: linear-gradient(135deg, #6f42c1 0%, #5a2d91 100%);
            color: white;
            padding: 2rem 2.5rem;
            border-radius: 1rem;
            margin-bottom: 2.5rem;
            box-shadow: 0 10px 30px rgba(111, 66, 193, 0.4);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="10" cy="60" r="0.5" fill="white" opacity="0.1"/><circle cx="90" cy="40" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .page-header h1 {
            margin: 0;
            font-weight: 700;
            font-size: 2.2rem;
            position: relative;
            z-index: 1;
        }

        .page-header .subtitle {
            margin-top: 0.5rem;
            opacity: 0.9;
            font-size: 1.1rem;
            position: relative;
            z-index: 1;
        }

        /* Dashboard grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        /* Cards de navigation moderne */
        .dashboard-card {
            background: white;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            text-decoration: none;
            color: inherit;
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--card-gradient);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover::before {
            transform: scaleX(1);
        }

        .dashboard-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            text-decoration: none;
            color: inherit;
        }

        .dashboard-card:active {
            transform: translateY(-4px) scale(1.01);
        }

        /* Card spécifiques avec couleurs */
        .card-popular {
            --card-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        }

        .card-popular .card-icon {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        }

        .card-revenue {
            --card-gradient: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
        }

        .card-revenue .card-icon {
            background: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
        }

        .card-evolution {
            --card-gradient: linear-gradient(135deg, #45b7d1 0%, #96c93d 100%);
        }

        .card-evolution .card-icon {
            background: linear-gradient(135deg, #45b7d1 0%, #96c93d 100%);
        }

        /* Icône de la card */
        .card-icon {
            width: 70px;
            height: 70px;
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            color: white;
            font-size: 2rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        /* Contenu de la card */
        .card-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.75rem;
            line-height: 1.4;
        }

        .card-description {
            color: #64748b;
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .card-arrow {
            display: flex;
            align-items: center;
            color: #6366f1;
            font-weight: 500;
            font-size: 0.95rem;
            margin-top: auto;
        }

        .card-arrow i {
            margin-left: 0.5rem;
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover .card-arrow i {
            transform: translateX(4px);
        }

        /* Stats rapides */
        .quick-stats {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 1.25rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

        .quick-stats h3 {
            font-weight: 600;
            margin-bottom: 1rem;
            opacity: 0.95;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1.5rem;
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 0.75rem;
            backdrop-filter: blur(10px);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Navigation de retour */
        .back-nav {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-top: 2rem;
            box-shadow: 0 8px 25px rgba(108, 117, 125, 0.3);
            text-align: center;
        }

        .back-nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            transition: all 0.3s ease;
        }

        .back-nav a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            transform: translateY(-2px);
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
                padding: 1.5rem;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .dashboard-card {
                padding: 1.5rem;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
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

        .dashboard-card {
            animation: fadeInUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        .dashboard-card:nth-child(1) { animation-delay: 0.1s; }
        .dashboard-card:nth-child(2) { animation-delay: 0.2s; }
        .dashboard-card:nth-child(3) { animation-delay: 0.3s; }

        /* Effet de brillance au survol */
        .dashboard-card::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.5s;
            opacity: 0;
        }

        .dashboard-card:hover::after {
            animation: shine 0.8s ease;
        }

        @keyframes shine {
            0% {
                opacity: 0;
                transform: rotate(45deg) translateX(-100%);
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                transform: rotate(45deg) translateX(100%);
            }
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
                <h1><i class="bi bi-speedometer2 me-3"></i>Tableau de bord administrateur</h1>
                <div class="subtitle">Centre de contrôle et d'analyse des données</div>
            </div>

            <!-- Stats rapides -->
            <div class="quick-stats">
                <h3><i class="bi bi-graph-up me-2"></i>Aperçu rapide</h3>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">24</div>
                        <div class="stat-label">Trajets actifs</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">156</div>
                        <div class="stat-label">Réservations</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">89%</div>
                        <div class="stat-label">Taux d'occupation</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">12.5k€</div>
                        <div class="stat-label">Revenus du mois</div>
                    </div>
                </div>
            </div>

            <!-- Grid des cartes de navigation -->
            <div class="dashboard-grid">
                
                <!-- Card Trajets populaires -->
                <a href="${pageContext.request.contextPath}/admin/popular-trajets" class="dashboard-card card-popular">
                    <div class="card-icon">
                        <i class="bi bi-trophy-fill"></i>
                    </div>
                    <div class="card-title">Trajets les plus populaires</div>
                    <div class="card-description">
                        Découvrez quels sont les trajets les plus demandés par vos clients et optimisez votre offre en conséquence.
                    </div>
                    <div class="card-arrow">
                        Analyser les trajets <i class="bi bi-arrow-right"></i>
                    </div>
                </a>

                <!-- Card Revenus -->
                <a href="${pageContext.request.contextPath}/admin/revenue" class="dashboard-card card-revenue">
                    <div class="card-icon">
                        <i class="bi bi-cash-stack"></i>
                    </div>
                    <div class="card-title">Revenus générés</div>
                    <div class="card-description">
                        Consultez les rapports financiers détaillés et suivez l'évolution des revenus de votre plateforme.
                    </div>
                    <div class="card-arrow">
                        Voir les revenus <i class="bi bi-arrow-right"></i>
                    </div>
                </a>

            </div>

            <!-- Navigation de retour -->
           

            <!-- Footer -->
            <div class="footer">
                <i class="bi bi-c-circle me-1"></i>2025 - Tableau de bord administrateur - Interface de gestion avancée
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>