using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Negocio;

namespace Vistas
{
    public partial class Asignar_Horarios : System.Web.UI.Page
    {
        Negocio_Medico neoMedico = new Negocio_Medico();
        Negocio_HorarioMedico neoHorario = new Negocio_HorarioMedico();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {

                if (Session["NombreUsuario"] != null)
                {
                    lblUsuarioAdmin.Text = "Usuario: " + Session["NombreUsuario"].ToString();
                }
                else
                {

                    Response.Redirect("Login_Usuario.aspx");
                }

                CargarLegajos();
               
            }
        }


        public void CargarLegajos()
        {
            ddlLegajo.Items.Clear();

            SqlDataReader legajos = neoMedico.ObtenerLegajos(); 
            ddlLegajo.DataSource = legajos;
            ddlLegajo.DataTextField = "Legajo_MED"; 
            ddlLegajo.DataValueField = "Legajo_MED";
            ddlLegajo.DataBind();
            ddlLegajo.Items.Insert(0, new ListItem("--- Seleccionar ---", "0"));
        }

        protected void CargarHorariosYDias()
        {
            
            ddlHorAtencion.Items.Clear();
            ddlDiaAtencion.Items.Clear();

            ddlHorAtencion.Items.Add(new ListItem("--- Seleccionar ---", "0"));
            ddlDiaAtencion.Items.Add(new ListItem("--- Seleccionar ---", "0"));
                        
            for (int hora = 8; hora <= 22; hora++)
            {
                
                string horaTexto = hora.ToString("D2") + ":00";
                ddlHorAtencion.Items.Add(new ListItem(horaTexto, horaTexto));
            }

            string[] dias = { "Lunes", "Martes", "Miércoles", "Jueves", "Viernes" };
            foreach (string dia in dias)
            {
                ddlDiaAtencion.Items.Add(new ListItem(dia, dia));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            string legajoMed = ddlLegajo.SelectedValue;
            string dia = ddlDiaAtencion.SelectedValue;
            string hora = ddlHorAtencion.SelectedValue;
           
            bool resultado = neoHorario.AsignarHorario(legajoMed, dia, hora);

            if (resultado)
            {
                lblMensaje.Text = "Se asignó el horario correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMensaje.Text = "No se pudo asignar el horario. Horario ocupado.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }

            
            CargarLegajos();
            CargarHorariosYDias();
        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }
    }
}
