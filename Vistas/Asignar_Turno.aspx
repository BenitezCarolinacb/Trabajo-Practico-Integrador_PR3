<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignar_Turno.aspx.cs" Inherits="Vistas.Asignar_Horarios" %>

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

   
}

  </style>
    </head>
    <body>
        <form id="form1" runat="server">
    <div class="barra-superior">
        <p style="text-align:center;">ASIGNAR UN NUEVO HORARIO</p>
    </div>

    <table class="auto-style1">
        <tr>
            <td>Especialidad:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style3" DataSourceID="SqlDataSourceEspecialidades" DataTextField="DescripcionEspecialidad_ES" DataValueField="IDEspecialidades_ES" Height="28px" Width="129px" ClassClass="texto-grande" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSourceEspecialidades" runat="server" ConnectionString="<%$ ConnectionStrings:CLINICA_TPI_PROGRA3ConnectionString2 %>" SelectCommand="SELECT * FROM [Especialidades]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Médico:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceMedicos" DataTextField="Nombre_MED" DataValueField="Legajo_MED" Height="29px" Width="131px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSourceMedicos" runat="server" ConnectionString="<%$ ConnectionStrings:CLINICA_TPI_PROGRA3ConnectionString3 %>" SelectCommand="SELECT [Nombre_MED], [Apellido_MED], [Legajo_MED] FROM [Medicos]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Paciente:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourcePacientes" DataTextField="DNI_PA" DataValueField="DNI_PA" Height="28px" Width="125px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSourcePacientes" runat="server" ConnectionString="<%$ ConnectionStrings:CLINICA_TPI_PROGRA3ConnectionString4 %>" SelectCommand="SELECT [DNI_PA] FROM [Pacientes]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Día de atención:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSourceDias" DataTextField="DiasAtencion_H" DataValueField="LegajoMedico_H" Height="39px" Width="121px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSourceDias" runat="server" ConnectionString="<%$ ConnectionStrings:CLINICA_TPI_PROGRA3ConnectionString7 %>" SelectCommand="SELECT * FROM [Horarios_Medicos]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Hora de atención:</td>
            <td class="auto-style7">
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSourceHorario" DataTextField="HorarioAtencion_H" DataValueField="LegajoMedico_H" Height="39px" Width="127px" Font-Size="Large">
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                <asp:SqlDataSource ID="SqlDataSourceHorario" runat="server" ConnectionString="<%$ ConnectionStrings:CLINICA_TPI_PROGRA3ConnectionString8 %>" OnSelecting="SqlDataSourceHorario_Selecting" SelectCommand="SELECT * FROM [Horarios_Medicos]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="Button2" runat="server" Text="Volver al menú" Width="177px" CssClass="btn" />
            </td>
            <td class="auto-style6">

                &nbsp;</td>
            <td class="auto-style4">

                <asp:Button ID="Button1" runat="server" Text="Asignar turno" Width="177px" CssClass="btn" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</form>
    </body>
    </html>