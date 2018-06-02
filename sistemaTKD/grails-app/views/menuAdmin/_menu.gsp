
<sec:access expression="hasRole('ROLE_ADMIN')">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Profesores <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/profesor/index')}"><span class="fa fa-eye"></span> Ver Profesores</a></li>
            <li><a href="${createLink(uri: '/profesor/create')}"><span class="fa fa-user-plus"></span> Registrar administrador</a></li>
        </ul>
    </li>
     <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Sucursales<span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/sucursal')}"><span class="fa fa-eye"></span> Ver Sucursales</a></li>
            <li><a href="${createLink(uri: '/sucursal/create')}"><span class="fa fa-user-plus"></span> Registrar sucursal</a></li>
        </ul>
    </li>
       <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Alumnos<span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/alumno')}"><span class="fa fa-eye"></span> Ver Alumnos</a></li>
            <li><a href="${createLink(uri: '/alumno/create')}"><span class="fa fa-user-plus"></span> Registrar alumno</a></li>
        </ul>
    </li>

</sec:access>

<sec:access expression="hasRole('ROLE_DOCENTE')">
       <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Mis Sucursales<span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/sucursal/sucursalesProfesor')}"><span class="fa fa-eye"></span> Ver Sucursales</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span>Evaluación Docente<span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/evaluacion/evaluacionProfes')}"><span class="fa fa-eye"></span> Ver Evaluación</a></li>
           
        </ul>
    </li>
</sec:access>

<sec:access expression="hasRole('ROLE_ALUMNO')">
</sec:access>
