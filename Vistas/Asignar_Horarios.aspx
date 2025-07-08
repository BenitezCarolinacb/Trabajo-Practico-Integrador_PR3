<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignar_Horarios.aspx.cs" Inherits="Vistas.Asignar_Horarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

         .barra-superior {
            width: 100%;
            background-color: #1f578a;
            padding: 15px;
            color: white;
            font-weight: bold;
            position: fixed;
            top: -9px;
            left: -3px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 1000;
            margin-bottom: 4px;
        }

        .auto-style1 {
            width: 100%;
            height: 169px;
            margin-left: 0px;
        }
        .auto-style2 {
            width: 107px;
        }
        .auto-style3 {
            width: 126px;
        }

        .btn {}

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

                  
             <div class="barra-superior">
        
                 <p style="margin-left: 520px">
                     ASIGNE UN NUEVO HORARIO
                 </p>
        
    </div>
                    

             <br />
                    

        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="ddlLegajo" ErrorMessage="*Ingrese un legajo" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3">Legajo del Medico: </td>
                <td>
                   <asp:DropDownList ID="ddlLegajo" runat="server" AutoPostBack="true" Height="24px" Width="196px">
</asp:DropDownList>


                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHorAtencion" ErrorMessage="*Ingrese un horario" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3">Hora de atención: </td>
                <td>
                    <asp:DropDownList ID="ddlHorAtencion" runat="server" Height="20px" Width="195px">
                        <asp:ListItem Value="0">--- Seleccionar ---</asp:ListItem>
                        <asp:ListItem Value="08:00">08:00</asp:ListItem>
                        <asp:ListItem Value="09:00">09:00</asp:ListItem>
                        <asp:ListItem Value="10:00">10:00</asp:ListItem>
                        <asp:ListItem>11:00</asp:ListItem>
                        <asp:ListItem>12:00</asp:ListItem>
                        <asp:ListItem>13:00</asp:ListItem>
                        <asp:ListItem>14:00</asp:ListItem>
                        <asp:ListItem>15:00</asp:ListItem>
                        <asp:ListItem>16:00</asp:ListItem>
                        <asp:ListItem>17:00</asp:ListItem>
                        <asp:ListItem>18:00</asp:ListItem>
                        <asp:ListItem>19:00</asp:ListItem>
                        <asp:ListItem>20:00</asp:ListItem>
                        <asp:ListItem>21:00</asp:ListItem>
                        <asp:ListItem>22:00</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="ddlDiaAtencion" ErrorMessage="*Ingrese un dia" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style6">Dia de atención:</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlDiaAtencion" runat="server" AutoPostBack="true" Height="29px" Width="197px">
                        <asp:ListItem Value="0">--- Seleccionar ---</asp:ListItem>
                        <asp:ListItem Value="Lunes">Lunes</asp:ListItem>
                        <asp:ListItem Value="Martes">Martes</asp:ListItem>
                        <asp:ListItem Value="Miercoles">Miercoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:Button ID="btnMenu" runat="server" Text="Volver al menú" BackColor="#0066FF" BorderStyle="None" CssClass="auto-style4" ForeColor="White" Width="183px" OnClick="btnMenu_Click" CausesValidation="False" />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblUsuarioAdmin" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnAsignar" runat="server" CssClass="btn" Text="Asignar" OnClick="btnAsignar_Click" />
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<style>
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
    .auto-style4 {
        color: #fff;
        font-weight: bold;
        border-radius: 5px;
        font-size: 0.95rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
        border-style: none;
        border-color: inherit;
        border-width: medium;
        padding: 10px 16px;
        background-color: #2a6db0;
    }
    .auto-style5 {
        width: 107px;
        height: 28px;
    }
    .auto-style6 {
        width: 126px;
        height: 28px;
    }
    .auto-style7 {
        height: 28px;
    }
    </style>
