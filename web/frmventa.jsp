<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" >
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

        <title>SIGECO</title>
    </head>
    <body>
        <div class="container">
            <h1> <i class="fas fa-inbox"></i> Formulario de Entrada de documentos</h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="ventas" />
            </jsp:include>
            <br>
            <form action="VentaControlador" method="post" >
                <input type="hidden" name="id" value="${venta.id}">
                <div class="form-group">
                    <label for="" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="${venta.nombre}" placeholder="Escriba el nombre quien deja el documento">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Usuario Destino</label>
                    <select name="cliente_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_clientes}">
                            <option value="${item.id}" 
                                    <c:if test="${venta.cliente_id == item.id}">
                                        selected
                                    </c:if>
                                        >${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Areas Destino</label>
                    <select name="producto_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_productos}">
                            <option value="${item.id}" <c:if test="${venta.producto_id == item.id}">
                                        selected
                                    </c:if>>${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>     
                <div class="form-group">
                    <label for="" class="form-label">Tipo de Documento</label>
                    <input type="text" class="form-control" name="tipo" value="${venta.tipo}" placeholder="Escriba el tipo documento">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Fecha Entrega</label>
                    <input type="text" class="form-control" name="fecha" value="${venta.fecha}" placeholder="Escriba la fecha">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

    </body>
</html>
