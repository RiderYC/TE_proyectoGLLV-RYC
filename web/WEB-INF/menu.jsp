<%
    String opcion =  request.getParameter("opcion");
%>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("productos") ?  "active" : "") %>" href="productos.jsp">Areas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("clientes") ?  "active" : "") %>" href="ClienteControlador">Nomina</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("ventas") ?  "active" : "") %>" href="VentaControlador">Entrada</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("salidas") ?  "active" : "") %>" href="SalidaControlador">Salida</a>
                </li>
            </ul>