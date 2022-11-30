<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Mercado UCC| Usuarios</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
     
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
 
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

          
            <header class="main-header">
                <a href="#" class="logo">
                  
                    <span class="logo-mini"><b>U</b>CC</span>
               
                    <span class="logo-lg"><b>Mercado </b>UCC</span>
                </a>

        
                <nav class="navbar navbar-static-top" role="navigation">
               
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                   
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                          
                            <li class="dropdown user user-menu">
                            
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                 
                                    <img src="dist/img/usuarioImagen.png" class="user-image" alt="User Image">
                                 
                                    <span class="hidden-xs"> ${usuario.nombreUsuario}</span>
                                </a>
                                <ul class="dropdown-menu">
                                   
                                    <li class="user-header">
                                        <img src="dist/img/usuarioImagen.png" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido ${usuario.nombreUsuario}
                                            <small>Usted es  ${usuario.cargo.nombreCargo} </small>
                                        </p>
                                    </li>
                                  
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Sesión</a>
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
                            <input type="text" name="q" class="form-control" placeholder="Buscar...">
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
                    <h1>Página Usuarios</h1>
                </section>
           
                <section class="content-header">
                    <a href="srvUsuario?accion=nuevo" class="btn btn-success">
                        <i class="fa fa-plus"></i> Nuevo Usuario </a>

                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Usuarios</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="box">    
                        <div class="box-header with-border">             
                            <h3 class="box-title">Listado de Usuarios</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive" >                                 
                                <table class="table table-bordered table-striped dataTable table-hover" id="tablaUsuarios" class="display">
                                    <thead>
                                        <tr>
                                            <th>IDUsuario</th>
                                            <th>Usuario</th>
                                            <th>Clave</th>
                                            <th>Estado</th>
                                            <th>Cargo</th>
                                            <th>Acciones</th> 
                                        </tr>
                                    </thead>
                                    
                                    
                                    <c:forEach var="user" items="${usuarios}" varStatus="iteracion">                                                    
                                        <tr>
                                            <td>${iteracion.index + 1}</td>
                                            <td>${user.nombreUsuario}</td>
                                            <td>${user.clave}</td>
                                            <c:if test="${user.estado == true}">
                                                <td><span class="badge bg-green active">Usuario Activo</span></td> 
                                            </c:if>
                                            <c:if test="${user.estado == false}">
                                                <td><span class="badge bg-red active">Usuario Inactivo</span></td> 
                                            </c:if>
                                            <td>${user.cargo.nombreCargo}</td>
                                            <td><a href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="leerUsuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-warning" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                        <i class="fa fa-pencil"></i></button></a>
                                               
                                                <c:choose>
                                                    <c:when test="${user.estado == true}">
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="desactivarUsuario" href="srvUsuario?cambiar=desactivar&cod=${user.id_usuario}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                            <i class="fa fa-remove"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="activarUsuario" href="srvUsuario?cambiar=activar&cod=${user.id_usuario}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                            <i class="glyphicon glyphicon-eye-open"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                               
                                                <input type="hidden" id="codigo" value="${user.id_usuario}">
                                                <a id="deleteUser" href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="eliminarUsuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-danger" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar">
                                                        <i class="fa fa-trash"></i></button></a>

                                            </td>
                                        </tr>                                                    
                                    </c:forEach>                                               
                                </table>
                            </div>
                        </div>
   
                        <div class="box-footer">
                  
                        </div>
                       
                    </div>
                </section>
           
            </div>
       


            <footer class="main-footer">
  
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>
     
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
   
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        
 
        <script src="dist/js/adminlte.min.js"></script>
        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#tablaUsuarios').DataTable();
            });
        </script>

    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>