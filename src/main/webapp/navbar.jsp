<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* Variables CSS pour la cohérence */
    :root {
        --primary-gradient: linear-gradient(135deg, #4a90e2 0%, #357abd 100%);
        --light-gradient: linear-gradient(180deg, #f8f9fa 0%, #e6f0fa 100%);
        --shadow-light: 0 4px 15px rgba(0, 0, 0, 0.1);
        --shadow-medium: 0 8px 25px rgba(0, 0, 0, 0.15);
        --shadow-strong: 0 15px 35px rgba(0, 0, 0, 0.2);
        --border-radius: 1rem;
        --transition: all 0.3s ease;
        --sidebar-width: 270px;
    }

    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        margin: 0;
    }

    /* Sidebar pour les admins et utilisateurs connectés */
    .sidebar-custom {
        background: linear-gradient(180deg, rgba(255, 255, 255, 0.95) 0%, rgba(230, 240, 250, 0.95) 100%);
        width: var(--sidebar-width);
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        padding: 2rem 1.5rem;
        box-shadow: var(--shadow-strong);
        border-top-right-radius: 2rem;
        border-bottom-right-radius: 2rem;
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-y: auto;
        z-index: 1000;
        backdrop-filter: blur(20px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        scrollbar-width: thin;
        scrollbar-color: #4a90e2 transparent;
    }

    .sidebar-custom::-webkit-scrollbar {
        width: 8px;
    }

    .sidebar-custom::-webkit-scrollbar-thumb {
        background: var(--primary-gradient);
        border-radius: 1rem;
        box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .sidebar-custom::-webkit-scrollbar-track {
        background: transparent;
    }

    /* Logo section */
    .sidebar-custom .logo {
        margin-bottom: 1.5rem;
        position: relative;
    }

    .sidebar-custom .logo::after {
        content: '';
        position: absolute;
        bottom: -0.75rem;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 3px;
        background: var(--primary-gradient);
        border-radius: 1.5px;
    }

    .sidebar-custom .logo img {
        height: 50px;
        width: 50px;
        border-radius: 50%;
        transition: var(--transition);
        box-shadow: var(--shadow-light);
        border: 3px solid rgba(74, 144, 226, 0.1);
    }

    .sidebar-custom .logo img:hover {
        transform: scale(1.1) rotate(5deg);
        box-shadow: var(--shadow-medium);
        border-color: rgba(74, 144, 226, 0.3);
    }

    /* Message de bienvenue */
    .sidebar-custom .welcome-message {
        background: var(--primary-gradient);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-family: 'Roboto', sans-serif;
        font-size: 1.1rem;
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
        padding: 1rem;
        border-radius: var(--border-radius);
        background-color: rgba(74, 144, 226, 0.05);
        border: 1px solid rgba(74, 144, 226, 0.1);
        position: relative;
        overflow: hidden;
    }

    .sidebar-custom .welcome-message::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
        transition: left 0.5s;
    }

    .sidebar-custom .welcome-message:hover::before {
        left: 100%;
    }

    /* Navigation */
    .sidebar-custom ul {
        list-style: none;
        margin: 0;
        padding: 0;
        width: 100%;
    }

    .sidebar-custom li {
        margin: 0.75rem 0;
        width: 100%;
    }

    .sidebar-custom a {
        color: #4a90e2;
        text-decoration: none;
        font-family: 'Roboto', sans-serif;
        font-size: 1rem;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 1rem 1.25rem;
        border-radius: var(--border-radius);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        background: rgba(255, 255, 255, 0.5);
        border: 1px solid rgba(74, 144, 226, 0.1);
        backdrop-filter: blur(10px);
    }

    .sidebar-custom a::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: var(--primary-gradient);
        transition: left 0.3s ease;
        z-index: -1;
    }

    .sidebar-custom a:hover::before {
        left: 0;
    }

    .sidebar-custom a:hover {
        color: white;
        transform: translateX(8px);
        box-shadow: var(--shadow-medium);
        border-color: transparent;
    }

    .sidebar-custom a i {
        font-size: 1.3rem;
        transition: var(--transition);
    }

    .sidebar-custom a:hover i {
        transform: scale(1.2);
    }

    /* Navbar moderne pour tous les utilisateurs */
    .modern-navbar {
        background: rgba(255, 255, 255, 0.95) !important;
        backdrop-filter: blur(20px);
        box-shadow: var(--shadow-medium);
        border-bottom: 3px solid transparent;
        border-image: var(--primary-gradient) 1;
        position: sticky;
        top: 0;
        z-index: 999;
        padding: 0.75rem 0;
        transition: var(--transition);
        margin-left: var(--sidebar-width);
        width: calc(100% - var(--sidebar-width));
    }

    .modern-navbar::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: var(--primary-gradient);
    }

    .navbar-brand {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        font-weight: 700;
        font-size: 1.5rem;
        color: #4a90e2 !important;
        text-decoration: none;
        transition: var(--transition);
    }

    .navbar-brand:hover {
        transform: scale(1.05);
        color: #357abd !important;
    }

    .navbar-brand img {
        height: 45px;
        width: 45px;
        border-radius: 50%;
        border: 2px solid rgba(74, 144, 226, 0.2);
        transition: var(--transition);
        box-shadow: var(--shadow-light);
    }

    .navbar-brand:hover img {
        transform: rotate(10deg);
        border-color: rgba(74, 144, 226, 0.5);
        box-shadow: var(--shadow-medium);
    }

    .navbar-nav .nav-link {
        color: #4a90e2 !important;
        font-weight: 500;
        font-size: 1rem;
        padding: 0.75rem 1.25rem !important;
        margin: 0 0.25rem;
        border-radius: var(--border-radius);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        background: rgba(74, 144, 226, 0.05);
        border: 1px solid rgba(74, 144, 226, 0.1);
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .navbar-nav .nav-link::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: var(--primary-gradient);
        transition: left 0.3s ease;
        z-index: -1;
    }

    .navbar-nav .nav-link:hover::before {
        left: 0;
    }

    .navbar-nav .nav-link:hover {
        color: white !important;
        transform: translateY(-2px);
        box-shadow: var(--shadow-light);
        border-color: transparent;
    }

    .navbar-nav .nav-link i {
        font-size: 1.1rem;
        transition: var(--transition);
    }

    .navbar-nav .nav-link:hover i {
        transform: scale(1.2);
    }

    .welcome-badge {
        background: var(--primary-gradient);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 2rem;
        font-weight: 600;
        font-size: 0.9rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        box-shadow: var(--shadow-light);
        border: 2px solid rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
c    }

    .welcome-badge::before {
        content: '👋';
        animation: wave 1s ease-in-out infinite;
    }

    @keyframes wave {
        0%, 100% { transform: rotate(0deg); }
        25% { transform: rotate(20deg); }
        75% { transform: rotate(-10deg); }
    }

    .btn-primary-custom {
        background: var(--primary-gradient) !important;
        border: none !important;
        color: white !important;
        font-weight: 600 !important;
        padding: 0.75rem 1.5rem !important;
        border-radius: var(--border-radius) !important;
        transition: var(--transition) !important;
        box-shadow: var(--shadow-light) !important;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-primary-custom:hover {
        transform: translateY(-3px) !important;
        box-shadow: var(--shadow-medium) !important;
        color: white !important;
    }

    .btn-danger-custom {
        background: linear-gradient(135deg, #dc3545 0%, #c82333 100%) !important;
        border: none !important;
        color: white !important;
        font-weight: 600 !important;
        padding: 0.75rem 1.5rem !important;
        border-radius: var(--border-radius) !important;
        transition: var(--transition) !important;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-danger-custom:hover {
        transform: translateY(-3px) !important;
        box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4) !important;
        color: white !important;
    }

    /* Main content area */
    .main-content {
        margin-left: var(--sidebar-width);
        padding: 1rem;
        width: calc(100% - var(--sidebar-width));
    }

    /* Responsive adjustments */
    @media (max-width: 991px) {
        .navbar-collapse {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            margin-top: 1rem;
            padding: 1rem;
            box-shadow: var(--shadow-medium);
            border: 1px solid rgba(74, 144, 226, 0.1);
        }

        .navbar-nav {
            gap: 0.5rem;
        }

        .navbar-nav .nav-link {
            margin: 0.25rem 0;
            text-align: center;
        }

        .welcome-badge {
            margin: 0.5rem 0;
            justify-content: center;
        }
    }

    @media (max-width: 576px) {
        .navbar-brand {
            font-size: 1.2rem;
        }

        .navbar-brand img {
            height: 35px;
            width: 35px;
        }

        .navbar-nav .nav-link {
            font-size: 0.9rem;
            padding: 0.6rem 1rem !important;
        }

        .welcome-badge {
            font-size: 0.8rem;
            padding: 0.4rem 0.8rem;
        }
    }

    .mobile-menu-toggle {
        display: none;
        position: fixed;
        top: 1rem;
        left: 1rem;
        z-index: 1001;
        background: var(--primary-gradient);
        color: white;
        border: none;
        padding: 0.75rem;
        border-radius: 50%;
        box-shadow: var(--shadow-medium);
        transition: var(--transition);
    }

    .mobile-menu-toggle:hover {
        transform: scale(1.1);
        box-shadow: var(--shadow-strong);
    }

    @media (max-width: 768px) {
        .mobile-menu-toggle {
            display: block;
        }

        .modern-navbar {
            margin-left: 0;
            width: 100%;
        }

        .main-content {
            margin-left: 0;
            width: 100%;
        }
    }

    .sidebar-close-btn {
        position: absolute;
        top: 1rem;
        right: 1rem;
        background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        color: white;
        border: none;
        width: 35px;
        height: 35px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
        box-shadow: var(--shadow-light);
        transition: var(--transition);
        cursor: pointer;
        z-index: 1002;
    }

    .sidebar-close-btn:hover {
        transform: scale(1.1) rotate(90deg);
        box-shadow: var(--shadow-medium);
        background: linear-gradient(135deg, #e74c3c 0%, #dc3545 100%);
    }

    @media (min-width: 769px) {
        .sidebar-close-btn {
            opacity: 0.7;
        }

        .sidebar-close-btn:hover {
            opacity: 1;
        }
    }

    @keyframes slideInLeft {
        from {
            opacity: 0;
            transform: translateX(-50px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .sidebar-custom {
        animation: slideInLeft 0.6s ease-out;
    }

    .modern-navbar {
        animation: fadeInDown 0.6s ease-out;
    }

    @media (max-width: 768px) {
        .sidebar-custom {
            width: 250px;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
            padding: 1.5rem 1rem;
        }

        .sidebar-custom.active {
            transform: translateX(0);
        }
    }
</style>

<!-- Bouton menu mobile -->
<button class="mobile-menu-toggle d-md-none" onclick="toggleSidebar('userSidebar')" id="userSidebarToggle" style="display: none;">
    <i class="bi bi-list"></i>
</button>
<button class="mobile-menu-toggle d-md-none" onclick="toggleSidebar('adminSidebar')" id="adminSidebarToggle" style="display: none;">
    <i class="bi bi-list"></i>
</button>

<c:choose>
    <c:when test="${sessionScope.user.role == 'admin'}">
        <!-- Sidebar pour admin -->
        <nav class="sidebar-custom" id="adminSidebar">
            <button class="sidebar-close-btn" onclick="closeSidebar('adminSidebar')">
                <i class="bi bi-x"></i>
            </button>
            
            <c:if test="${not empty sessionScope.user}">
                <div class="welcome-message">
                    Bienvenue, ${sessionScope.user.username} !
                </div>
            </c:if>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/monCompte">
                        <i class="bi bi-person-circle"></i>
                        <span>Historique des réservations</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/users">
                        <i class="bi bi-people-fill"></i>
                        <span>Gérer les utilisateurs</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/stations">
                        <i class="bi bi-geo-alt-fill"></i>
                        <span>Gérer les stations</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/trajets">
                        <i class="bi bi-map-fill"></i>
                        <span>Gérer les trajets</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/voyages">
                        <i class="bi bi-briefcase-fill"></i>
                        <span>Gérer les voyages</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/promotions">
                        <i class="bi bi-tags-fill"></i>
                        <span>Gérer les promotions</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout" class="btn-logout">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Se déconnecter</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- Affichage du bouton mobile toggle pour admin -->
        <script>
            document.getElementById('adminSidebarToggle').style.display = 'block';
        </script>
    </c:when>
    <c:otherwise>
        <!-- Sidebar pour utilisateurs connectés (non-admin) -->
        <c:if test="${not empty sessionScope.user}">
            <nav class="sidebar-custom" id="userSidebar">
                <button class="sidebar-close-btn" onclick="closeSidebar('userSidebar')">
                    <i class="bi bi-x"></i>
                </button>
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/recherche">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
                    </a>
                </div>
                <div class="welcome-message">
                    Bienvenue, ${sessionScope.user.username} !
                </div>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/recherche">
                            <i class="bi bi-search"></i>
                            <span>Rechercher un trajet</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/travelHistory.jsp">
                            <i class="bi bi-person-circle"></i>
                            <span>Historique des voyages</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- Affichage du bouton mobile toggle pour utilisateur -->
            <script>
                document.getElementById('userSidebarToggle').style.display = 'block';
            </script>
        </c:if>
    </c:otherwise>
</c:choose>

<!-- Navbar pour tous les utilisateurs -->
<nav class="navbar navbar-expand-lg modern-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/recherche">
            <span class="d-none d-md-inline">Train</span>
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-list fs-4" style="color: #4a90e2;"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/recherche">
                            <i class="bi bi-search"></i>
                            Rechercher un trajet
                        </a>
                    </li>
                </c:if>
            </ul>
            <div class="d-flex flex-column flex-lg-row align-items-center gap-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger-custom">
                            <i class="bi bi-box-arrow-right"></i>
                            Se déconnecter
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary-custom">
                            <i class="bi bi-box-arrow-in-right"></i>
                            Se connecter
                        </a>
                        <a href="${pageContext.request.contextPath}/register" class="nav-link">
                            <i class="bi bi-person-plus"></i>
                            S'inscrire
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Fonction pour toggle la sidebar
    function toggleSidebar(sidebarId) {
        const sidebar = document.getElementById(sidebarId);
        if (sidebar) {
            sidebar.classList.toggle('active');
        }
    }

    // Fonction pour fermer la sidebar
    function closeSidebar(sidebarId) {
        const sidebar = document.getElementById(sidebarId);
        if (sidebar) {
            sidebar.classList.remove('active');
        }
    }

    // Fermer la sidebar quand on clique en dehors
    document.addEventListener('click', function(event) {
        const userSidebar = document.getElementById('userSidebar');
        const adminSidebar = document.getElementById('adminSidebar');
        const userToggleBtn = document.getElementById('userSidebarToggle');
        const adminToggleBtn = document.getElementById('adminSidebarToggle');
        const closeBtn = document.querySelector('.sidebar-close-btn');
        
        if (window.innerWidth <= 768) {
            if (userSidebar && userToggleBtn && !userSidebar.contains(event.target) && 
                !userToggleBtn.contains(event.target) && (!closeBtn || !closeBtn.contains(event.target))) {
                userSidebar.classList.remove('active');
            }
            if (adminSidebar && adminToggleBtn && !adminSidebar.contains(event.target) && 
                !adminToggleBtn.contains(event.target) && (!closeBtn || !closeBtn.contains(event.target))) {
                adminSidebar.classList.remove('active');
            }
        }
    });

    // Gérer le redimensionnement de la fenêtre
    window.addEventListener('resize', function() {
        const userSidebar = document.getElementById('userSidebar');
        const adminSidebar = document.getElementById('adminSidebar');
        if (window.innerWidth > 768) {
            if (userSidebar) userSidebar.classList.remove('active');
            if (adminSidebar) adminSidebar.classList.remove('active');
        }
    });

    // Fermer avec la touche Escape
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeSidebar('userSidebar');
            closeSidebar('adminSidebar');
        }
    });

    // Effet de scroll pour la navbar
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.modern-navbar');
        if (navbar) {
            if (window.scrollY > 50) {
                navbar.style.background = 'rgba(255, 255, 255, 0.98)';
                navbar.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.2)';
            } else {
                navbar.style.background = 'rgba(255, 255, 255, 0.95)';
                navbar.style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.15)';
            }
        }
    });
</script>