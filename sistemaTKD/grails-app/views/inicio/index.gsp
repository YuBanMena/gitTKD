<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title></title>
        <%@ page import ="org.springframework.security.core.Authentication" %>
        <%@ page import ="org.springframework.security.core.context.SecurityContextHolder" %>
        <%@ page import ="org.springframework.stereotype.Controller" %>
        <%@ page import ="org.springframework.ui.ModelMap" %>
        <%@ page import ="org.springframework.web.bind.annotation.RequestMapping" %>
        <%@ page import ="org.springframework.web.bind.annotation.RequestMethod" %>
    </head>
    <body>
        <%
        String rolOnline=SecurityContextHolder.getContext().getAuthentication().getAuthorities()%>
        <h1><%=rolOnline%></h1>

<g:set var="online1" value="${rolOnline}"/>
<g:if test="${online1 == '[ROLE_ADMIN]'}">
       <g:redirectMainPage/>
</g:if>
<g:if test="${online1 == '[ROLE_DOCENTE]'}">
    <g:redirectMainPage2/>
</g:if>
<g:if test="${online1 == '[ROLE_ALUMNO]'}">
    <g:redirectMainPage3/>
</g:if>
<g:if test="${online1 == '[ROLE_EVALUADOR]'}">
    <g:redirectMainPage4/>
</g:if>
        Esta clase analiza al usuario que se loguea. Espere un momento.
            <a id="elSalir" href="${request.getContextPath()}/logoff">Salir</a>
    </body>
</html>