using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using Entidades;

namespace Vistas
{
   
        public partial class Datos_Medico : System.Web.UI.Page
        {
            Negocio_Medico medico = new Negocio_Medico();
            Negocio_Usuario neoUsuario = new Negocio_Usuario();
            protected void Page_Load(object sender, EventArgs e)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                if (!IsPostBack)
                {
                    if (Session["NombreUsuario"] != null)
                    {
                        lblUsuario.Text = "Usuario: " + Session["NombreUsuario"].ToString();
                    }
                    else
                    {

                        Response.Redirect("Login_Usuario.aspx");
                    }
                CargarGv();
                }
            }


            protected void CargarGv()
            {
                if (Session["NombreUsuario"] != null)
                {
                    string nombre = Session["NombreUsuario"].ToString();
                    DataTable dt = medico.ObtenerTablaDatosPersonales(nombre);
                    gvModificarMedicos.DataSource = dt;
                    gvModificarMedicos.DataBind();
                }
                else
                {

                    Response.Redirect("Login_Usuario.aspx");
                }
            }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string usuarioActual = txt_nombre_usuario_actual.Text.Trim(); 
            string usuarioNuevo = txt_nombre_usuario.Text.Trim();       
            string nuevaClave = txt_repcontraseña.Text.Trim();
           
            if (string.IsNullOrEmpty(usuarioNuevo) || string.IsNullOrEmpty(nuevaClave))
            {
                lblMensaje.Text = "Debe completar todos los campos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

           
            if (!neoUsuario.existeNombreUsuario(usuarioActual))
            {
                lblMensaje.Text = "El usuario actual no existe.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

          
            if (usuarioActual != usuarioNuevo && neoUsuario.existeNombreUsuario(usuarioNuevo))
            {
                lblMensaje.Text = "El nuevo nombre de usuario ya está en uso.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            Usuario user = new Usuario()
            {
                Nombre = usuarioNuevo,
                Contraseña = nuevaClave
               
            };

            bool exito;

            if (txt_nombre_usuario_actual.Text == Session["NombreUsuario"].ToString())
            {
                if (txt_contraseña.Text == txt_repcontraseña.Text)
                {
                    exito = neoUsuario.ModificarUsuarioPorNombre(usuarioActual, user);
                }else
                {
                    exito = false;
                    lblMensajeRepe.Text = "Las contraseñas no coinciden";
                    lblMensajeRepe.ForeColor = System.Drawing.Color.Red;
                }


            }
            else
            {
                exito = false;
                lblNombreCoin.Text = "Debe ingresar el nombre de usuario que tiene actualmente";
            }

            if (exito)
            {
                lblMensaje.Text = "Usuario modificado correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                txt_nombre_usuario_actual.Text = "";
                txt_nombre_usuario.Text = "";
                txt_repcontraseña.Text = "";
                lblMensajeRepe.Text = "";
            }
            else
            {
                lblMensaje.Text = "Error al modificar el usuario.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }



        protected void btnCerrarSesion_Click(object sender, EventArgs e)
            {
                Response.Redirect("Menu_Medico.aspx");
            }
                
    }
}
