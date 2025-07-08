<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_Medico.aspx.cs" Inherits="Vistas.Agregar_Medico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 154px;
            margin-bottom: 6px;
            height: 29px;
        }
              
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
            height: 500px;
            width: 1125px;
            justify-content: center;
            display: flex;           
            align-content: center;
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
            box-shadow: 0 2px 4px rgba(0,0,2,0.1);
            z-index: 1000;
           height: 23px;
           margin-bottom: 3px;
       }

        .btn {
     background-color: #2a6db0;
     color: #fff;
     font-weight: bold;
     padding: 10px 16px;
     border: none;
     border-radius: 15px;
     font-size: 0.95rem;
     cursor: pointer;
     transition: background-color 0.3s ease;      
 }
        .from {
            width: 1125px;
            height: 500px;            
        }

        .auto-style4 {
            width: 152px;
            height: 28px;
        }
        .auto-style6 {
            width: 152px;
            height: 29px;
        }
        .auto-style7 {
            width: 154px;
            height: 28px;
        }
        .auto-style9 {
            width: 953px;
            margin-bottom: 6px;
            height: 323px;
        }
        .auto-style18 {
            width: 129px;
            height: 28px;
        }
        .auto-style22 {
            width: 129px;
            height: 29px;
        }
        .auto-style25 {
            width: 113px;
            height: 29px;
        }
        .auto-style26 {
            height: 28px;
            width: 88px;
        }
        .auto-style27 {
            width: 154px;
            height: 29px;
        }
        .auto-style28 {
            height: 29px;
            width: 88px;
        }

        .auto-style30 {
            height: 55px;
        }
        .auto-style32 {
            height: 55px;
        }
        .auto-style34 {
            width: 129px;
            height: 55px;
        }

        #form1 {
            height: 540px;
            width: 1392px;
        }

        .auto-style36 {
            height: 28px;
            width: 113px;
        }
        .auto-style37 {
            width: 117px;
            height: 55px;
        }
        .auto-style38 {
            height: 28px;
            width: 117px;
        }
        .auto-style39 {
            width: 117px;
            height: 29px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="barra-superior">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblUsuarioAdmin" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AGREGAR MEDICO </div>
                <br />
        </div>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style9">
            <tr>
                <td class="auto-style7">Legajo:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_Legajo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txt_Legajo" ErrorMessage="Ingrese Legajo" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regLeg" runat="server" ControlToValidate="txt_Legajo" ErrorMessage="Ingrese solo numeros" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style26">Usuario:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txt_Usuario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txt_Usuario" ErrorMessage="Ingrese Usuario" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Nombre:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_Nombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txt_Nombre" ErrorMessage="Ingrese Nombre" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regNombre" runat="server" ControlToValidate="txt_Nombre" ErrorMessage="Ingrese solo letras" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style26">Especialidad:</td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" Height="16px" Width="126px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Apellido:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_Apellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txt_Apellido" ErrorMessage="Ingrese Apellido" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regApellido" runat="server" ControlToValidate="txt_Apellido" EnableTheming="True" ErrorMessage="Ingrese solo letras" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style26">Provincia:</td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlProvincia" runat="server" Height="16px" Width="128px" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">DNI:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_DNI" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txt_DNI" ErrorMessage="Ingrese DNI" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_DNI" ErrorMessage="Ingrese 8 numeros" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^[0-9]{8}$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style26">Localidad:</td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" Height="16px" Width="126px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Genero:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_Genero" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvGereno" runat="server" ControlToValidate="txt_Genero" ErrorMessage="Ingrese Genero" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style26">Dirección:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txt_Direccion" runat="server" Height="16px"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txt_Direccion" ErrorMessage="Ingrese Dirección" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style27">Nacionalidad:</td>
                <td class="auto-style25">
                    <asp:DropDownList ID="ddlNacionalidad" runat="server" Height="17px" Width="122px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style28">Telefono:</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_Telefono" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style39">
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese Telefono" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="regTelefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese 10 numeros" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Fecha de Nacimiento:</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txt_FechaNacimiento" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txt_FechaNacimiento" ErrorMessage="Ingrese Fecha de Nacimiento" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style28">Contraseña:</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_Contraseña" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style39">
                    <asp:RequiredFieldValidator ID="rfvTelefono0" runat="server" ControlToValidate="txt_Contraseña" ErrorMessage="Ingrese Contraseña" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style28">Email:&nbsp;</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style39">
                    <asp:Label ID="Label1" runat="server" Text="@gmail.com"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style30" colspan="2">
                    <asp:Button ID="btnMenu" runat="server" BorderStyle="None" CssClass="btn" Text="Volver al Menú" OnClick="btnMenu_Click1" ValidationGroup="grup0" />
                </td>
                <td class="auto-style32" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Agregar" Width="129px" CssClass="btn" OnClick="Button1_Click" />
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                <td class="auto-style34">&nbsp;</td>
                <td class="auto-style37">
                    <asp:RequiredFieldValidator ID="rfvTelefono1" runat="server" ControlToValidate="txt_mail" ErrorMessage="Ingrese Email" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    &nbsp;</form>
</body>
</html>
