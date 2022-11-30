<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sistema Integrado - Gran Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/bootstrap/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
        <link href="<c:url value='Public/Css/pagina.css'/>" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header class="bg-primary text-white">
          <div class="container text-center text-md-left">
                <!-- Footer links -->
                <div class="row text-center text-md-left mt pb">
                    <!-- Grid column -->
                    <div class="col-md-12 text-center">
                        <picture>
                            <source media="(min-width: 1200px)" srcset="imagenes/banner1.png">
                            <source media="(min-width: 500px)" srcset="imagenes/banner2.png">
                            <img src="imagenes/banner3.png" style="height:80px;">
                        </picture>

                    </div>
                </div>
                <!-- Grid row -->
            </div>
            
        </header >
        <div class="bg-danger text-white" height="50">
            <br> 
        </div>
        <div class="CuerpoLogin">
            <div class="preloader-background">
            <div class="loader">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
                
            </div>
            <iframe id="marco"  src="login.fautapo" id="marco" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen>

            </iframe>
        </div>
        <!-- Footer -->
        <footer  class="bg-primary text-white">

            <!-- Footer Links -->
            <div class="container">

                <!-- Footer links -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">UNIVERSIDAD AUTONOMA DEL BENI JOSE BALLIVIAN</h6>
                        <p>Descripcion de la universidad</p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Mision</h6>
                        <p>La formación de profesionales idóneos, competitivos, con calidad humana y excelencia científica, con conciencia crítica y capacidad de aplicar sus conocimientos...<a href="http://www.uabjb.edu.bo/uabjb/">Mas</a></p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Vision</h6>
                        <p>La Universidad Autónoma del Beni “José Ballivián” es una institución con liderazgo departamental, desarrolla una educación superior con calidad..<a href="#!">Mas</a></p>
                    </div>

                    <!-- Grid column -->
                    <hr class="w-100 clearfix d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Contactos</h6>
                        <p><i class="fa fa-home" aria-hidden="true"></i> Av. 6 de agosto</p>
                        <p><i class="fa fa-envelope mr-3"></i> dtic@uabjb.edu.bo</p>
                        <p><i class="fa fa-phone mr-3"></i> + 591 234 567 88</p>
                        <p><i class="fa fa-print mr-3"></i> + 591 234 567 89</p>
                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Footer links -->

                <hr>

                <!-- Grid row -->
                <div class="row d-flex align-items-center">

                    <!-- Grid column -->
                    <div class="col-md-8 col-lg-8">

                        <!--Copyright-->
                        <p class="text-center text-md-left">© 2018 Copyright: <a><strong> Direccion de Tecnologia y Comunicacion</strong></a></p>

                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-4 ml-lg-0">

                        <!-- Social buttons -->
                        <div class="text-center text-md-right">
                            <ul class="list-unstyled list-inline">
                                <li class="list-inline-item"><a class="btn btn-outline-primary rounded-circle"><i class="fab fa-facebook-square"></i></a></li>
                                <li class="list-inline-item"><a class="btn btn-outline-primary rounded-circle"><i class="fab fa-twitter-square"></i></a></li>
                                <li class="list-inline-item"><a class="btn btn-outline-primary rounded-circle"><i class="fab fa-google-plus-square"></i></a></li>
                                <li class="list-inline-item"><a class="btn btn-outline-primary rounded-circle"><i class="fab fa-linkedin"></i></a></li>
                            </ul>
                        </div>

                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->

            </div>
            <!-- Footer Links -->

        </footer>
        <!-- Footer -->
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.slim.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>"></script> 
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script>
        document.addEventListener("DOMContentLoaded", function(){
	$('.preloader-background').delay(1700).fadeOut('slow');
	$('.loader').delay(1700).fadeOut();});
        </script>
    </body>
</html>
