<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_Paciente.aspx.cs" Inherits="Vistas.Agregar_Paciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="barra-superior">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblUsuarioMedico" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AGREGAR PACIENTE</div>
        <div class="auto-style2" style="height: 480px; width: 1007px; margin-top: 47px">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style15">Nombre:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

                        <br />
                        <asp:RequiredFieldValidator ID="rvfNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingresa un nombre." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style16">Teléfono:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rvfTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresa un teléfono." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ErrorMessage="Ingresa solo números." Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtTelefono" ValidationExpression="^\d+$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Apellido:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtApellido" runat="server">

                        </asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rvfApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingresa un apellido." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">Dirección:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="revDireccion" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingresa una dirección." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">DNI:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDNI" runat="server" Width="170px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingresa un DNI." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
&nbsp;<br />
                    </td>
                    <td class="auto-style11">Localidad:</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="ddlLocalidad" runat="server">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Fecha Nacimiento:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="DateTime"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rvfFecha" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="Ingresa una fecha de nacimiento." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td class="auto-style7">Provincia:</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Email:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rvfMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Ingresa un mail." Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">Nacionalidad:</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="ddlNacionalidad" runat="server">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">Género:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtGenero" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="txtGenero" ErrorMessage="Ingresa un género. " Font-Size="X-Small" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu_Medico.aspx">Menú</asp:HyperLink>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" Width="129px" CssClass="btn" OnClick="BtnAgregar_Click" ValidationGroup="grupo1"/>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style10"></td>
                </tr>
            </table>
        </div>
    </form>
</body></html>
   <style>
       
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }

        .usuario-label {
            font-weight: 600;
            color: #333;
        }


        .menu-container {
            max-width: 500px;
            margin: auto auto auto 9px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 200px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align: center;
        }


         .barra-superior {
            width: 100%;
            background-color: #1f578a;
            padding: 15px;
            color: white;
            font-weight: bold;
            position: fixed;
            top: -1px;
            left: -11px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 1000;
           height: 23px;
           margin-bottom: 3px;
       }

        .auto-style1 {
           width: 87%;
           height: 351px;
       }
       .auto-style2 {
           height: 25px;
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
 }

        .auto-style3 {
           width: 353px;
       }

        .auto-style5 {
           height: 25px;
           width: 194px;
       }
       .auto-style6 {
           height: 25px;
           width: 197px;
       }
       .auto-style7 {
           height: 25px;
           width: 199px;
       }
       .auto-style8 {
           height: 25px;
           width: 203px;
       }
       .auto-style9 {
           height: 25px;
           width: 205px;
       }
       .auto-style10 {
           height: 25px;
           width: 390px;
       }
       .auto-style11 {
           width: 354px;
       }
       .auto-style12 {
           width: 390px;
       }
       .auto-style15 {
           width: 194px;
       }
       .auto-style16 {
           width: 199px;
       }

        </style>