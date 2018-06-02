
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="bootstrap.min.css"/>
    <!-- Custom styles for this template -->
    <asset:stylesheet src="cover.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:stylesheet src="footer-distributed-with-address-and-phones.css"/>
    <title></title>
    <g:layoutHead/>
  </head>

  <style>

  body{
    background:#000;
    color:#D4AF37;
  }
  .thumbnail {
    background: #000;
    border-color: #000;
}
.well{
    background: #000;
    border-color: #000;
    font-family: Lucida Handwriting
    font-size:40px;
}
p{
   color:white;
}
h1{
     font-family: Lucida Handwriting
}
h3{
  color:white;
}
  </style>
    <body class="text-center">
<header>
      <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="/sistemaEDD">Mugung Do</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/sistemaEDD">Inicio</a></li>
        <li><a href="/sistemaEDD">Filosofía</a></li>
        <li><a href="/sistemaEDD">Instalaciones</a></li> 
        <li><a href="/sistemaEDD">Programas Académicos</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <form class="btn btn-outline-success my-2 my-sm-0">
              <li><a class="btn btn-primary" href="${request.getContextPath()}/inicio/index">
              <span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          </form>
      </ul>

    </div>
  </div>
</nav>
</header>
    <g:layoutBody/>
    </body>
  <footer class="footer-distributed">

      <div class="footer-left">
      <asset:image src="logo2.jpg" style="display: inline-block; height: 60px; margin-top: -5px" />
        <h3>WMA<span>TAEKWONDO</span></h3>

        <p class="footer-links">
          <a href="#">Inicio</a>
          ·
          <a href="#">¿Quiénes Somos?</a>
          ·
          <a href="#">Instalaciones</a>
          ·
          <a href="#">Interesante</a>
        </p>

        <p class="footer-company-name">Desarrollado por Yu Ban Mena Zabala &copy; 2018</p>
      </div>

      <div class="footer-center">

        <div>
          <i class="fa fa-map-marker"></i>
          <p><span>Sucursal Matriz Mugung Do Reforma</span> Calle Luis Moya 123 Colonia Reforma</p>
        </div>

        <div>
          <i class="fa fa-phone"></i>
          <p>+1 555 123456</p>
        </div>

        <div>
          <i class="fa fa-envelope"></i>
          <p><a href="mailto:support@company.com">support@company.com</a></p>
        </div>

      </div>

      <div class="footer-right">

        <p class="footer-company-about">
          <span>Acerca de la Companía</span>
          Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
        </p>

        <div class="footer-icons">

          <a href="#"><i class="fa fa-facebook"></i></a>
          <a href="#"><i class="fa fa-twitter"></i></a>
          <a href="#"><i class="fa fa-linkedin"></i></a>
          <a href="#"><i class="fa fa-github"></i></a>
        </div>
      </div>
    </footer>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <asset:javascript src="jquery-3.min.js"/>
    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>

</html>