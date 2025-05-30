<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<style>
    /* Sidebar for admins */
    .sidebar-custom {
        background-color: #f8f9fa;
        width: 250px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        padding: 1.5rem 1rem;
        box-shadow: 2px 0 4px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .sidebar-custom .logo {
        margin-bottom: 1rem;
    }

    .sidebar-custom .logo img {
        height: 40px;
    }

    .sidebar-custom .welcome-message {
        color: #495057;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        text-align: center;
        margin-bottom: 1.5rem;
    }

    .sidebar-custom ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 100%;
    }

    .sidebar-custom li {
        margin: 0.5rem 0;
        width: 100%;
    }

    .sidebar-custom a {
        color: #4a90e2;
        text-decoration: none;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        font-weight: 500;
        display: block;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        transition: background-color 0.2s ease, color 0.2s ease;
    }

    .sidebar-custom a:hover {
        background-color: #e6f0fa;
        color: #357abd;
    }

    /* Navbar for regular users */
    .navbar-custom {
        background-color: #f8f9fa;
        padding: 1rem 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 100%;
    }

    .navbar-custom ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .navbar-custom li {
        margin: 0 1rem;
    }

    .navbar-custom a {
        color: #4a90e2;
        text-decoration: none;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        font-weight: 500;
        transition: color 0.2s ease;
    }

    .navbar-custom a:hover {
        color: #357abd;
    }

    .navbar-custom img {
        height: 30px;
        vertical-align: middle;
    }

    .navbar-custom .welcome-message {
        color: #495057;
        font-family: Arial, sans-serif;
        font-size: 1rem;
    }
</ I see that you're including a sidebar in a JSP page using `<jsp:include page="../lib/sidebar.jsp" />`, which suggests that `sidebar.jsp` is located in a `lib` directory one level up from the current JSP file. Based on your previous requests, I understand you want to refine the sidebar design and ensure it integrates well with your admin pages, like the user management page. The sidebar should display for admins, while regular users see a navbar, with a soft color scheme (`#f8f9fa`, `#4a90e2`, `#357abd`, `#e6f0fa`) consistent across your application. I'll update `sidebar.jsp` to match the design from your previous context (logo, welcome message, vertical links for admins) and ensure it works seamlessly with the include directive. I'll also provide an updated version of the user management page (`admin-users.jsp`) to demonstrate proper integration, assuming that's the page you're working with.

### Assumptions
- **File Path**: The `<jsp:include page="../lib/sidebar.jsp" />` indicates `sidebar.jsp` is in a `lib` directory one level up (e.g., `src/main/webapp/lib/sidebar.jsp`), and the current JSP file is in a subdirectory like `src/main/webapp/admin/`.
- **Design Continuity**: The sidebar should match the design from your previous request, with a fixed position, logo, welcome message, and vertical links for admins, while regular users see a navbar.
- **Soft Colors**: Maintain the soft palette (`#f8f9fa` for backgrounds, `#4a90e2` for links, `#357abd` for hover, `#e6f0fa` for hover backgrounds).
- **Page Context**: I'll assume you're including this in the `admin-users.jsp` page (or a similar admin page) to ensure proper integration.

### Updated Sidebar JSP
The `sidebar.jsp` file is updated to ensure it works with the include directive, maintaining the design with a fixed sidebar for admins and a navbar for regular users, using embedded CSS with soft colors.

<xaiArtifact artifact_id="547f6e6e-ee20-459e-9aa2-04f370451f24" artifact_version_id="5bb99426-3b8b-4aa0-9852-1278232acc3e" title="sidebar.jsp" contentType="text/html">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<style>
    /* Sidebar for admins */
    .sidebar-custom {
        background-color: #f8f9fa;
        width: 250px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        padding: 1.5rem 1rem;
        box-shadow: 2px 0 4px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        z-index: 1000;
    }

    .sidebar-custom .logo {
        margin-bottom: 1rem;
    }

    .sidebar-custom .logo img {
        height: 40px;
    }

    .sidebar-custom .welcome-message {
        color: #495057;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        text-align: center;
        margin-bottom: 1.5rem;
    }

    .sidebar-custom ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 100%;
    }

    .sidebar-custom li {
        margin: 0.5rem 0;
        width: 100%;
    }

    .sidebar-custom a {
        color: #4a90e2;
        text-decoration: none;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        font-weight: 500;
        display: block;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        transition: background-color 0.2s ease, color 0.2s ease;
    }

    .sidebar-custom a:hover {
        background-color: #e6f0fa;
        color: #357abd;
    }

    /* Navbar for regular users */
    .navbar-custom {
        background-color: #f8f9fa;
        padding: 1rem 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 100%;
        z-index: 1000;
    }

    .navbar-custom ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .navbar-custom li {
        margin: 0 1rem;
    }

    .navbar-custom a {
        color: #4a90e2;
        text-decoration: none;
        font-family: Arial, sans-serif;
        font-size: 1rem;
        font-weight: 500;
        transition: color 0.2s ease;
    }

    .navbar-custom a:hover {
        color: #357abd;
    }

    .navbar-custom img {
        height: 30px;
        vertical-align: middle;
    }

    .navbar-custom .welcome-message {
        color: #495057;
        font-family: Arial, sans-serif;
        font-size: 1rem;
    }
</style>

<c:choose>
    <c:when test="${sessionScope.user.role == 'admin'}">
        <nav class="sidebar-custom">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/recherche">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
                </a>
            </div>
            <c:if test="${not empty sessionScope.user}">
                <div class="welcome-message">Bienvenue, ${sessionScope.user.username} !</div>
            </c:if>
            <ul>
                <li><a href="${pageContext.request.contextPath}/recherche">Rechercher un trajet</a></li>
                <li><a href="${pageContext.request.contextPath}/monCompte">Mon compte</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users">Gérer les utilisateurs</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/stations">Gérer les stations</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/trajets">Gérer les trajets</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/voyages">Gérer les voyages</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/promotions">Gérer les promotions</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Se déconnecter</a></li>
            </ul>
        </nav>
    </c:when>
    <c:otherwise>
        <nav class="navbar-custom">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/recherche">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
                    </a>
                </li>
                <c:if test="${not empty sessionScope.user}">
                    <li class="welcome-message">Bienvenue, ${sessionScope.user.username} !</li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/recherche">Rechercher un trajet</a></li>
                <c:if test="${not empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/monCompte">Mon compte</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Se déconnecter</a></li>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/login">Se connecter</a></li>
                </c:if>
            </ul>
        </nav>
    </c:otherwise>
</c:choose>