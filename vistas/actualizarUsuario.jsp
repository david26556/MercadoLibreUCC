<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Actualizacion del usuario</title>
       
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
    
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
       
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

     
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

           
            <header class="main-header">
                <a href="#" class="logo">
              
                    <span class="logo-mini"><b> U</b>CC</span>
                  
                    <span class="logo-lg"><b>MercadoUCC </b></span>
                </a>

             
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

                            <li class="dropdown user user-menu">
                                <!-- Menu  -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                  
                                    <img src="dist/img/usuarioImagen.png" class="user-image" alt="User Image">
                                 
                                    <span class="hidden-xs"> ${usuario.nombreUsuario}</span>
                                </a>
                                <ul class="dropdown-menu">
                                  
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - ${usuario.nombreUsuario}
                                            <small>Usted es  ${usuario.cargo.nombreCargo} </small>
                                        </p>
                                    </li>
                               
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Session</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            
            <aside class="main-sidebar">

               
                <section class="sidebar">

                  
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/usuarioImagen.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido,  ${usuario.nombreUsuario} </p>
                            
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                 
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
               

                
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                       
                        <li><a href="#"><i class="fa fa-link"></i> <span>Panel Administrativo</span></a></li>
                        <li class="treeview active">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Registros</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               
                                <li class="active"><a href="srvUsuario?accion=listarUsuarios"><i class="fa fa-address-card"></i>Usuarios</a></li>
                            </ul>
                        </li>
                        
                        <li class="treeview">
                            <a href="#"><i class="fa fa-area-chart"></i> <span>Reportes</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-bar-chart"></i>Reportes Ventas</a></li>
                            </ul>
                        </li>
                    </ul>
                   
                </section>
              
            </aside>

        
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12 col-md-3">
                        </div>
                        <div class="col-md-3 hidden-xs"></div>
                        <div class="col-xs-2 col-md-1">
                        </div>
                        <div class="col-xs-10 col-md-5 ">
                            <div class="btn-group pull-right">
                                <a href="srvUsuario?accion=listarUsuarios" class="btn btn-default">
                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <i class="fa fa-edit"></i> <h3 class="box-title">Actualizar Datos Usuario</h3>  
                        </div>
                        <form class="form-horizontal" action="srvUsuario?accion=actualizarUsuario" method="post">
                            <input type="hidden" name="hCodigo" value="${usuario.id_usuario}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nombre Usuario</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ejem: Alexander" name="txtNombre" maxlength="10"
                                               value="${usuario.nombreUsuario}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Clave</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input id="nombre" type="password" class="form-control" placeholder="Ejem: $%Ale!**" name="txtClave" maxlength="10"
                                               value="${usuario.clave}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Cargo</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-tags"></i></span>
                                        <select class="form-control"  name="cboCargo" autofocus=""  required="">
                                            <option value="0">Seleccione un cargo</option>
                                            <c:forEach items="${cargos}" var="car">
                                                <option value="${car.codigo}"  
                                                        <c:if test="${car.codigo == 
                                                                      usuario.cargo.codigo}">
                                                              selected
                                                        </c:if>
                                                        >${car.nombreCargo}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                  
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="chkEstado" 
                                                       <c:out value="${usuario.estado == false ?
                                                                       'unchecked' : 'checked'}"
                                                              default="" />>Activo
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                <button type="submit" id="" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-refresh"></i> Actualizar Usuario</button>

                            </div>
                           
                        </form>
                    </div>
                </section> 

            </div>
           

        
            <footer class="main-footer">
                
               
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>
              <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>

        
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>

