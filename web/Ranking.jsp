<%-- 
    Document   : resultado_busqueda
    Created on : Dec 5, 2021, 9:43:59 PM
    Author     : hamil
--%>


<%@page import="Entidades.EstudianteDashboard"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Estudiante"%>
<%@page import="Procesos.ConsultarEstudiante"%>
<%@page import="Procesos.ConsultarRanking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ConsultarDashboard"%>
<%@page import="Procesos.ConsultarEstudiante"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resúltado de Búsqueda</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/2f1b1cb395.js"
            crossorigin="anonymous"
            
            
            
            
            
            
        ></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar--primary navbar-expand-lg sticky-top navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" title="logo">
                    <img src="img/logoRP.png" alt="RP logo" style="width: 8rem"/>
                </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="contacto.html">Contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="about.html">Sobre el proyecto</a>
                  </li> 
                   <li class="nav-item text-uppercase">
                    <a class="nav-link" href="Ranking.jsp".jsp">Ranking</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="Reporte.jsp".jsp">Reporte</a>
                  </li>
                </ul>
                <form class="d-flex justify-content-end">
                    <a href="vistas/login/iniciar_sesion.jsp" class="nav-link link-dark me-4 fs-4 text-uppercase">Iniciar sesión</a>
                    <a href="vistas/login/registrarse.jsp" class="btn btn-warning fs-4 text-uppercase">Registrarse</a>
                </form> 
              </div>
            </div>
        </nav>
        </header>   
        
        <main class= "offset-sm-4">
            <h1 class="container search-container" padding="0px "   margin=" 78rem"> Ranking  </h1>
             <h1>         </h1>
            <%   
                
                  // CLASSSSS      OBJETO   = N
                ConsultarRanking  consultr = new ConsultarRanking();   //
                  List<Estudiante> listae =  consultr.ConsultarRANK(); // pide todos los correos 
                   
                ConsultarEstudiante consultarE = new ConsultarEstudiante(); //intancia de datos del estudiante
         
                
                
             
              
           
                for (int i = 0; i < listae.size(); i++) { // ciclo para imprimir todos los estudiantes
                    
                     String   correo =   listae.get(i).getCorreo();   // asigana el correo del estudiante
                          Estudiante e = new Estudiante();
                               e = consultarE.ConsultarEst(correo) ;  // datos del estudiante
               
                   
                                          int acumulador=0 ; 
           
            
                             Estudiante estud = new Estudiante();                   // consulta el puntaje de los estudiantes
                             ConsultarEstudiante er =  new ConsultarEstudiante();
                                                 estud = er.ConsultarEst(correo);       
                                                                                          // consulta el puntaje de los estudiantes por medio de correo
                            ConsultarDashboard consult = new ConsultarDashboard();
                            List<EstudianteDashboard> lista =  consult.ConsultarEst(correo);  // asigna puntaje a la lista
               
                             for(int q=0; q<lista.size(); q++){
                            
                                   acumulador=lista.get(q).getPuntos() +acumulador;             // suma los puntajes
                                                   }
                       
            %> <% %>
            <div class="cards">
                <div class="card-body">
               
                  <h5 class="card-title"><%=i+1 %> Estudiante:   <%=listae.get(i).getCorreo()   %>  <%=e.getApellido() %></h5>
                  <h6 class="card-subtitle mb-2 text-muted">Cedula    <%=e.getCedula()   %></h6>
                  <p class="card-text">Puntuacion   <%=acumulador%> </p>                 
                  
                
                </div>
                
            </div>
            <%
                }
            %>          
        </main>
        
        
        
        <footer class="footer-flex fixed-bottom">
            
        </footer>     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
