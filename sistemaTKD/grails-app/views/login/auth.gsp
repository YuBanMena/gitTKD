<!DOCTYPE html>
<html>
<head>
  <title></title>
  <asset:stylesheet src="estiloLogin.css"/>
</head>
<body>
  <div class="login">
    <div class="login-screen">
      <div class="app-title">
        <h1>Bienvenido a tu Portal</h1>
      </div>

      <div class="login-form">
        <div class="control-group">
          <form action="/sistemaEDD/login/authenticate" method="POST" id="loginForm" class="cssform" autocomplete="off">
      <p>
        <label for="username">Nombre de usuario:</label>
        <input type="text" class="text_" name="username" id="username"/>
      </p>

      <p>
        <label for="password">Contraseña:</label>
        <input type="password" class="text_" name="password" id="password"/>
      </p>

      <p id="remember_me_holder">
        <input type="checkbox" class="chk" name="remember-me" id="remember_me" />
        <label for="remember_me">Recuérdame</label>
      </p>

      <p>
        <input type="submit" id="submit" value="Identifícate"/>
      </p>
    </form>       
      </div>
    </div>
  </div>
</body>
</body>
</html>