<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu_Administrador.aspx.cs" Inherits="Vistas.Menu_Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>

   body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding-top: 70px;
        }

        .barra-superior {
            width: 100%;
            background-color: #1f578a;
            padding: 15px;
            color: white;
            font-weight: bold;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .contenedor-principal {
            max-width: 600px;
            margin: auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 13px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align:center;
        }

        h2 {
            color: #1f578a;
        }

        p {
            font-size: 0.95rem;
            color: #333;
        }

        .btn-link {
            display: inline-block;
            margin-top: 10px;
            font-weight: bold;
            color: #0099ff;
            text-decoration: none;
        }

        .btn-link:hover {
            text-decoration: underline;
        }

        img {
            width: 100%;
            border-radius: 8px;
            margin-top: 10px;
        }
        .contenedor-flex {
    display: flex;
    align-items: center;
    gap: 20px;
    margin-bottom: 30px;
}


.texto-costado {
    flex: 30;
}
        .auto-style1 {
            margin-left: 1246px;
        }
         .auto-style1 {
        background-color: #2a6db0;
        color: white;
        font-weight: bold;
        border: none;
        padding: 10px 16px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 0.95rem;
        transition: background-color 0.3s ease;
    }

    </style>
</head>
<body>

    <form id="form1" runat="server" >

    <div class="barra-superior">
        &nbsp;<asp:Label ID="lblUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnCerrarSesion" runat="server" CssClass="auto-style1" Text="Cerrar sesión" Width="201px" OnClick="btnCerrarSesion_Click" />
    </div>

    <div class="contenedor-principal">
         
        <p>

            <asp:Image ID="Image1" runat="server" Height="90px" ImageUrl="~/Imagenes/Imagen_1.png" Width="108px"  />
           
        </p>
        <h2>Consulta de médicos</h2>
        <p>Accedé al listado de medicos.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ListadoMedicos.aspx">Listado de médicos</asp:HyperLink>
        </a>&nbsp;<p>

            <asp:Image ID="Image4" runat="server" Height="109px" ImageUrl="~/Imagenes/imagen_7.png" Width="144px" />

        </p>
        <h2>Turnos </h2>
        <p>Ingresá para ver los turnos de los médicos.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ListadoDeTurnosMedicos.aspx">Ver turnos</asp:HyperLink>
        </a>&nbsp;<p>

            <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="~/Imagenes/Imagen_3.png" Width="104px" />

        </p>
        <h2>Agregar médico </h2>
        <p>Accedé para cargar especialialistas en el sistema.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Agregar_Medico.aspx">Agregar médico</asp:HyperLink>
        </a>&nbsp;<br />
        <br />
        <p>
              <asp:Image ID="Image2" runat="server" Height="109px" ImageUrl="~/Imagenes/imagen_8.png" Width="133px" />
        </p>

            <h2>Asignar Horarios </h2>
         <p>Ingresá para asignar horarios de los médicos.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Asignar_Horarios.aspx">Asignar horarios</asp:HyperLink>
        </a>&nbsp;

        <h2>

              <asp:Image ID="Image5" runat="server" Height="109px" ImageUrl="~/Imagenes/imagen_8.png" Width="133px" />

        </h2>
        <h2>
            Asignar Turnos
        </h2>
        <p>Ingresá para asignar turnos de los médicos.</p>
         <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AsignarTurnos.aspx">Asignar turnos</asp:HyperLink>
        <br />
        <br />


        </div>

    </form>

</body>
</html>
