class MyAppTagLib {
    def redirectMainPage = {
      response.sendRedirect("${request.contextPath}/menuAdmin/index/")
    }
  
   def redirectMainPage2 = {
      response.sendRedirect("${request.contextPath}/menuAdmin/index2/")
    }
  
  def redirectMainPage3 = {
      response.sendRedirect("${request.contextPath}/menuAdmin/index3/")
    }

    def redirectMainPage4 = {
      response.sendRedirect("${request.contextPath}/menuAdmin/index3/")
    }

  
  }