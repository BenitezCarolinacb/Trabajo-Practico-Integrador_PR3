<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionDeTurnos.aspx.cs" Inherits="Vistas.GestionDeTurnos" %>

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
        padding: 20px;
    }

    .auto-style2 {
        max-width: 1130px;
        margin: 0 auto;
        background-color: #ffffff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            width: 1265px;
             height: 712px;
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

    .auto-style1:hover {
        background-color: #1f578a;
    }

    .usuario-label {
        font-weight: 600;
        color: #333;
    }

    input[type="text"], select {
        padding: 8px;
        width: 200px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 0.95rem;
        margin-right: 10px;
    }

    .aspNet-GridView {
        margin-top: 20px;
    }

        .btn-link {
            display: inline-block;
            margin-top: 10px;
            font-weight: bold;
            color: #0099ff;
            text-decoration: none;
        }

         .auto-style3 {
             width: 79%;
         }
         .auto-style4 {
             width: 183px;
         }
         .auto-style7 {
             width: 360px;
         }
         .auto-style8 {
             width: 34px;
         }
         .auto-style9 {
             width: 44px;
         }
         .auto-style10 {
             margin-bottom: 0px;
         }

        .auto-style11 {
            margin-right: 2px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <asp:Button ID="btnMenu" runat="server" BorderStyle="Groove" CssClass="auto-style1" Height="50px" Text="Menú" Width="86px" OnClick="btnMenu_Click" />
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Listado de turnos:"></asp:Label>
            <br />
            <table class="auto-style3">
                <tr>
                    <td class="auto-style4">Buscar por DNI:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtFiltro" runat="server" CssClass="auto-style10" Height="16px" Width="217px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnFiltro" runat="server" BorderStyle="Groove" CssClass="auto-style1" Text="Filtrar" OnClick="btnFiltro_Click"/>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnMostrarTodo" runat="server" BorderStyle="Groove" CssClass="auto-style1" Text="Mostrar todo" OnClick="btnMostrarTodo_Click"/>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvListadoTurnos" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AutoPostBack="true" AutoGenerateColumns="False" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style11" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Text='<%# Bind("IDTurno_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LEGAJO MÉDICO">
                        <ItemTemplate>
                            <asp:Label ID="lbl_legajo" runat="server" Text='<%# Bind("LegajoMedico_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FECHA">
                        <ItemTemplate>
                            <asp:Label ID="lbl_fecha" runat="server" Text='<%# Bind("Fecha_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="HORA">
                        <ItemTemplate>
                            <asp:Label ID="lbl_hora" runat="server" Text='<%# Bind("Hora_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI PACIENTE">
                        <ItemTemplate>
                            <asp:Label ID="lbl_dni_paciente" runat="server" Text='<%# Bind("DNIPaciente_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OBSERVACION">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_observaciones" runat="server" Text='<%# Bind("Observaciones_TUR") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_observacion" runat="server" Text='<%# Bind("Observaciones_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_estado" runat="server" Text='<%# Bind("Estado_TUR") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_estado" runat="server" Text='<%# Bind("Estado_TUR") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>