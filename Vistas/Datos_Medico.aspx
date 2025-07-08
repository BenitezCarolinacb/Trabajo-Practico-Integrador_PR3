<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datos_Medico.aspx.cs" Inherits="Vistas.Datos_Medico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <style type="text/css">
  body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
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
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .barra-superior .btn {
        margin-right: 20px;
    }

    .contenedor {
        max-width: 800px;
        margin: 120px auto 30px auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        text-align: center;
    }

    input[type=text], input[type=password] {
        padding: 8px;
        width: 200px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 0.95rem;
        margin: 8px 0;
    }

    .btn {
        background-color: #2a6db0;
        color: #fff;
        font-weight: bold;
        padding: 10px 16px;
        border: none;
        border-radius: 5px;
        font-size: 0.95rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 10px;
    }

    .gridview-style {
        margin: 20px auto;
    }

    .mensaje-error {
        color: red;
        font-size: 0.9rem;
    }

     .auto-style1 {
         max-width: 800px;
         margin: 120px auto 30px auto;
         background-color: #ffffff;
         padding: 30px;
         border-radius: 12px;
         box-shadow: 0 8px 16px rgba(0,0,0,0.1);
         text-align: center;
         height: 1005px;
     }

     .auto-style2 {
         border-style: none;
         border-color: inherit;
         border-width: medium;
         background-color: #2a6db0;
         color: #fff;
         font-weight: bold;
         padding: 10px 16px;
         border-radius: 5px;
         font-size: 0.95rem;
         cursor: pointer;
         transition: background-color 0.3s ease;
         margin-top: 10px;
         margin-right: 0px;
     }
     
 </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <asp:Button ID="btnMenu" runat="server" CssClass="btn" Text="Volver al menu" OnClick="btnCerrarSesion_Click" BackColor="#003399" ForeColor="White" />
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        </div>
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="MIS DATOS"></asp:Label>

            <asp:GridView ID="gvModificarMedicos" runat="server" CssClass="gridview-style" Width="525px"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>

            <h3>Modificar contraseña y usuario</h3>

            <br />

            <label>Ingrese usuario:</label><br />
            <asp:TextBox ID="txt_nombre_usuario_actual" runat="server" /><br />

            <asp:RequiredFieldValidator ID="revNombre" runat="server" ControlToValidate="txt_nombre_usuario"
                ErrorMessage="Ingrese nombre" CssClass="mensaje-error" ValidationGroup="grupo1" /><br />
            <asp:Label ID="lblNombreCoin" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />

            <label>Ingrese nuevo usuario:</label><br />
            <asp:TextBox ID="txt_nombre_usuario" runat="server" /><br />
            <asp:RequiredFieldValidator ID="revNombreAModificar" runat="server" ControlToValidate="txt_nombre_usuario_actual"
                ErrorMessage="Ingrese nombre a modificar" CssClass="mensaje-error" ValidationGroup="grupo1" /><br />
            <br />

            <label>Ingrese nueva contraseña para modificar:</label><br />
            <asp:TextBox ID="txt_contraseña" runat="server" TextMode="Password" /><br />
            <asp:RequiredFieldValidator ID="rvContraseña" runat="server" ControlToValidate="txt_contraseña"
                ErrorMessage="Ingrese contraseña" CssClass="mensaje-error" ValidationGroup="grupo1" /><br />

            <br />

            <label>Repita contraseña:</label><br />
            <asp:TextBox ID="txt_repcontraseña" runat="server" TextMode="Password" />
            <br />
            <asp:RequiredFieldValidator ID="rvContraseñaRep" runat="server" ControlToValidate="txt_repcontraseña"
                ErrorMessage="Ingrese contraseña" CssClass="mensaje-error" ValidationGroup="grupo1" />
            <br />
            <br />
            <asp:Label ID="lblMensajeRepe" runat="server" />
            <br />
            <br />

            <asp:Button ID="Button2" runat="server" CssClass="btn" OnClick="btnAgregar_Click" Text="Agregar" ValidationGroup="grupo1" />
            <br />
            <br />
            <asp:Label ID="lblMensaje" runat="server" />
            <br />
            <br />

            <br />
            <br />

        </div>

    </form>
</body>
</html>
