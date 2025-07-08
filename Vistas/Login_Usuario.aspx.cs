using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Login_Usuario : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }

            protected void btnLogin_Click(object sender, EventArgs e)
            {
                Negocio_Usuario negocioUsuario = new Negocio_Usuario();
                Negocio_Turno nego = new Negocio_Turno();

                string nombre = txtUsuario.Text.Trim();
                string contra = txtContra.Text;

                Usuario usuario = negocioUsuario.NegocioObtenerUsuario(nombre, contra);

                if (usuario != null)
                {
                    Session["IDUsuario"] = usuario.ID;
                    Session["NombreUsuario"] = usuario.Nombre;
                    Session["IdTipoUsuario"] = usuario.TipoUsuario;

                    if (usuario.TipoUsuario == 1) // ADMIN
                    {
                        Session["Admin"] = usuario.ID;
                        Response.Redirect("Menu_Administrador.aspx");
                    }
                    else if (usuario.TipoUsuario == 2) // MEDICO
                    {
                        string legajo = nego.ObtenerLegajo(nombre, contra);
                        Session["LegajoMedico"] = legajo;
                        Response.Redirect("Menu_Medico.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Usuario y/o contraseña incorrectos o el usuario no está registrado.";
                    lblError.ForeColor = System.Drawing.Color.Red;
                    txtContra.Text = "";
                    txtUsuario.Text = "";
                }
            }
        }
}