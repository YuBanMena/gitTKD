<!DOCTYPE html>
<html style="height: auto; min-height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle /></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <asset:stylesheet src="bootstrap.min.css" />
    <!-- Font Awesome -->
    <asset:stylesheet src="font-awesome.min.css" />
    <!-- Ionicons -->
    <asset:stylesheet src="ionicons.min.css" />
    <!-- Theme style -->
    <asset:stylesheet src="AdminLTE.min.css" />
    <asset:stylesheet src="select.css" />

    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <asset:stylesheet src="admin-lte/skins/_all-skins.min.css" />
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <g:layoutHead />
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="layout-top-nav skin-red-light" style="height: auto; min-height: 100%;">

<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils" %>
<g:set var="springSecurityService" bean="springSecurityService" />
<div class="wrapper" style="height: auto; min-height: 100%;">
    <header class="main-header">

<sec:access expression="hasRole('ROLE_ADMIN')">
        <nav class="navbar navbar-static-top" style="background-color:#B40404">
</sec:access>

<sec:access expression="hasRole('ROLE_ALUMNO')">
        <nav class="navbar navbar-static-top" style="background-color:#00b3b3">
</sec:access>

<sec:access expression="hasRole('ROLE_DOCENTE')">
        <nav class="navbar navbar-static-top" style="background-color:#5c5cd6">
</sec:access>
 <div class="container">
                <div class="navbar-header">
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <a href="${createLink(uri: '/menuAdmin/index')}" class="navbar-brand">
                        <b>Mugung Do</b>
                    </a>
                    </sec:access>
                    
                    <sec:access expression="hasRole('ROLE_ALUMNO')">
                    <a href="${createLink(uri: '/menuAdmin/index3')}" class="navbar-brand">
                        <b>Mugung Do</b>
                    </a>
                    </sec:access>
                    <sec:access expression="hasRole('ROLE_DOCENTE')">
                    <a href="${createLink(uri: '/menuAdmin/index2')}" class="navbar-brand">
                        <b>Mugung Do</b>
                    </a>
                    </sec:access>

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <g:pageProperty name="page.nav" />
                        </ul>
                    </div>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                <i class="fa fa-user-circle" aria-hidden="true"></i>
                                Mi Perfil
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header" style="background-color:#f2f2f2">
                                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                                        <p>
                                            <small><strong>Usuario Online</strong>
                                            </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        

                                        <div class="${SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_DOCENTE,ROLE_ALUMNO') ? "pull-right" : ''} ">
                                            <g:form controller="logout">
                                                <button type="submit" name="logout" class="btn btn-default btn-flat ${SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_DOCENTE,ROLE_ALUMNO') ? '' : 'btn-block'}">
                                                    Cerrar sesión
                                                </button>
                                            </g:form>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-custom-menu -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>
    <!-- Full Width Column -->
    <div class="content-wrapper" style="min-height: 595px;">
        <div class="container">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <g:pageProperty name="page.header" />
            </section>

            <!-- Main content -->
            <section class="content">
                <g:layoutBody />
            </section>
            <!-- /.content -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="container">
            <div class="pull-right hidden-xs">
                <b>Powered by </b> <strong><a href="https://adminlte.io">ULSA OAXACA</a>.</strong>
            </div>
            <strong>Copyright &copy; ${Calendar.getInstance().get(Calendar.YEAR)} <span class="text-primary">Yu Ban Mena Zabala</span>.</strong>
            Todos los derechos reservados
        </div>
        <!-- /.container -->
    </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
<!-- SlimScroll -->
<asset:javascript src="jquery.slimscroll.min.js" />
<!-- FastClick -->
<asset:javascript src="fastclick.js" />
<!-- AdminLTE App -->
<asset:javascript src="adminlte.min.js" />
<asset:javascript src="select.js" />
<g:pageProperty name="page.scripts" />
</body>
</html>