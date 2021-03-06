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
            <h1><i class="fas fa-sign-out-alt"></i> Formulario de Envio o Salida de Documentos</h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="salidas" />
            </jsp:include>
            <br>
            <form action="SalidaControlador" method="post" >
                <input type="hidden" name="id" value="${salida.id}">
                <div class="form-group">
                    <label for="" class="form-label">Nombre Emisor</label>
                    <select name="cliente_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_clientes}">
                            <option value="${item.id}" 
                                    <c:if test="${salida.cliente_id == item.id}">
                                        selected
                                    </c:if>
                                        >${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Areas Emisor</label>
                    <select name="producto_id" class="form-control">
                        <option value="">-- Seleccione --</option>
                        <c:forEach var="item" items="${lista_productos}">
                            <option value="${item.id}" <c:if test="${salida.producto_id == item.id}">
                                        selected
                                    </c:if>>${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>   
                <div class="form-group">
                    <label for="" class="form-label">Destino</label>
                    <input type="text" class="form-control" name="destino" value="${salida.destino}" placeholder="Escriba el nombre quien deja el documento">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Nombre Reseptor</label>
                    <input type="text" class="form-control" name="nombre" value="${salida.nombre}" placeholder="Escriba el nombre quien deja el documento">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Tipo de Documento</label>
                    <input type="text" class="form-control" name="tipo" value="${salida.tipo}" placeholder="Escriba el tipo documento">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Fecha de Envio</label>
                    <input type="text" class="form-control" name="fecha" value="${salida.fecha}" placeholder="Escriba la fecha">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

    </body>
</html>
