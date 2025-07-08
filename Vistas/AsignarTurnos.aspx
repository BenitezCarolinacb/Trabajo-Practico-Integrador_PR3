<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignarTurnos.aspx.cs" Inherits="Vistas.Turnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
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
      .auto-style1 {
          margin-top: 80px;
          font-size: 20px;
      }
      .auto-style2 {
          height: 28px;
         
      }
      .auto-style3 {
          margin-bottom: 0px;
          
      }
      .auto-style4 {
          width: 334px;
      }
      .auto-style5 {
          height: 28px;
          width: 334px;
      }
      .auto-style6 {
          width: 238px;
      }
      .auto-style7 {
          
          height: 28px;
          width: 238px;
      }

    .auto-style8 {
        height: 42px;
    }
    .auto-style9 {
        width: 238px;
        height: 42px;
    }
    .auto-style10 {
        width: 334px;
        height: 42px;
    }

        .auto-style11 {
            width: 1245px;
        }

  </style>
    </head>
    <body>
        <form id="form1" runat="server">
    <div class="barra-superior">
        <p style="text-align:center;" class="auto-style11">ASIGNAR UN NUEVO TURNO
            <asp:Label ID="lbUsuario" runat="server"></asp:Label>
        </p>
    </div>

    <table class="auto-style1">
        <tr>
            <td class="auto-style8">Especialidad:</td>
            <td class="auto-style9">
                <asp:DropDownList ID="ddlEspe" AutoPostBack="true" runat="server" CssClass="auto-style3"  Height="28px" Width="129px" ClassClass="texto-grande" Font-Size="Large" OnSelectedIndexChanged="ddlEspe_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlMedico" ErrorMessage="*Seleccione una opcion" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style8">
                </td>
        </tr>
        <tr>
            <td>Médico:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlMedico" runat="server" Height="29px" Width="131px" AutoPostBack="true" Font-Size="Large" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico" ErrorMessage="*Seleccione una opcion" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Paciente:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlPaciente" runat="server" AutoPostBack="true"  Height="28px" Width="125px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="ddlPaciente" ErrorMessage="*Seleccione una opcion" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Día de atención:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlDia" runat="server" AutoPostBack="true" Height="39px" Width="121px" Font-Size="Large" OnSelectedIndexChanged="ddlDia_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="ddlDia" ErrorMessage="*Seleccione una opcion" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Hora de atención:</td>
            <td class="auto-style7">
                <asp:DropDownList ID="ddlHora" runat="server" AutoPostBack="true" Height="39px" Width="127px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHora" ErrorMessage="*Seleccione una opcion" ForeColor="Red" InitialValue="0" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="BtnMenu" runat="server" Text="Volver al menú" Width="177px" CssClass="btn" Height="45px" OnClick="BtnMenu_Click" />
            </td>
            <td class="auto-style6">

                &nbsp;</td>
            <td class="auto-style4">

                <asp:Button ID="BtnAsignar" runat="server" Text="Asignar turno" Width="177px" CssClass="btn" OnClick="BtnAsignar_Click" ValidationGroup="grupo1" />
                <asp:Label ID="lblAviso" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
    </table>
</form>
    </body>
    </html>