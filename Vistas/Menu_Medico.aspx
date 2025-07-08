<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu_Medico.aspx.cs" Inherits="Vistas.Menu_Medciso" %>

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
        &nbsp;<asp:Button ID="btnCerrarSesion" runat="server" CssClass="auto-style1" Text="Cerrar sesión" Width="132px" Font-Size="Smaller" OnClick="btnCerrarSesion_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUsuarioMedico" runat="server" Text="Usuario: Médico/a"></asp:Label>
    </div>

    <div class="contenedor-principal">
         
        <p>

            <asp:Image ID="Image1" runat="server" Height="90px" ImageUrl="~/Imagenes/Imagen_1.png" Width="108px"  />
           
        </p>
        <h2>Consulta de pacientes</h2>
        <p>Accedé al listado de pacientes.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ListadoDePacientes.aspx">Listado de pacientes</asp:HyperLink>
        </a>&nbsp;<p>

            <asp:Image ID="Image4" runat="server" Height="109px" ImageUrl="~/Imagenes/Imagen_2.png" Width="96px" />

        </p>
        <h2>Registro de turnos</h2>
        <p>Ingresá para ver tus horarios con los turnos asignados</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/GestionDeTurnos.aspx">Gestion de turnos</asp:HyperLink>
        </a>&nbsp;<p>

            <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="~/Imagenes/Imagen_3.png" Width="104px" />

        </p>
        <h2>Mis datos</h2>
        <p>Accedé a tus datos como profesional.</p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Datos_Medico.aspx">Mis datos</asp:HyperLink>
        </a>
        <br />

            <asp:Image ID="Image5" runat="server" Height="109px" ImageUrl="~/Imagenes/imagen_7.png" Width="144px" />

        <br />
        &nbsp;<h2>Agregar paciente</h2><p>
            Accedé para cargar pacientes en el sistema.
                                       </p>
        <a href="#" class="btn-link">
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Agregar_Paciente.aspx">Agregar Paciente</asp:HyperLink>
    </div>
       

    </form>


</body>
   
</html>
