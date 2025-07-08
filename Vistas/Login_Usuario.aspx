<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Usuario.aspx.cs" Inherits="Vistas.Login_Usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <<title>

     </title>
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

        input[type="text"], input[type="password"], select {
            padding: 8px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 0.95rem;
            margin-right: 10px;
        }

        .menu-container {
            max-width: 500px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 200px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align: center;
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

        .btn:hover {
            background-color: #1f578a;
        }

        .error {
            color: #cc0000;
            font-size: 0.9rem;
            margin-top: 10px;
            display: block;
        }
        .auto-style1 {
            max-width: 500px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align: center;
            height: 621px;
            margin-top:55px;
           margin-left: auto;
           margin-right: auto;
           margin-bottom: auto;
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

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
              <div class="abajo-bar">

                  
             <div class="barra-superior">
        
                 CLINICA MÉDICA
        
    </div>
                    

    <span class="top-bar-text"></span></div>
             &nbsp;<br />
                  <h2>


                      <asp:Image ID="Image1" runat="server" Height="91px" ImageUrl="~/Imagenes/Imagen_4.png" Width="117px" />


                  </h2>
            <h2>
                <asp:Label ID="Label3" runat="server" ForeColor="#003399" Text="LOGIN" Font-Bold="True" Font-Size="X-Large"></asp:Label>
             </h2>
              <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
             <br />
            <asp:Label ID="Label1" runat="server" Text="Usuario:"></asp:Label><br />
             <asp:TextBox ID="txtUsuario" runat="server" CssClass="auto-style3" Width="127px" AutoCompleteType="Disabled" ></asp:TextBox>
             <br />
              <asp:RequiredFieldValidator ID="RfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Ingrese  un usuario" ForeColor="Red"></asp:RequiredFieldValidator>
              <br />
            <asp:Label ID="Label2" runat="server" Text="Contraseña:"></asp:Label>
             <br />
             <asp:TextBox ID="txtContra" runat="server" Width="127px" TextMode="Password" AutoCompleteType="Disabled" ></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="RfvContraseña" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Ingrese una contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
              <br />
              <br />
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn" OnClick="btnLogin_Click" BorderStyle="Groove" />
           </div> 
            </form> 
             <footer style="text-align:center; margin-top: 20px; font-size: 0.85em; color: #555;">
             <p>&nbsp;</p>
             <p>&nbsp;</p>
                 
                 
    </footer>
</body>
    </html>