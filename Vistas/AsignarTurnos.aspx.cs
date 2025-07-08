using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using System.Data.SqlClient;

namespace Vistas
{
    public partial class Turnos : System.Web.UI.Page
    {
        Negocio_Especialidad neoEspecialidad = new Negocio_Especialidad();
        Negocio_Medico neoMedico = new Negocio_Medico();
        Negocio_Paciente neoPaciente = new Negocio_Paciente();
        Negocio_Turno neoTurno = new Negocio_Turno();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    lbUsuario.Text = "Usuario: " + Session["NombreUsuario"].ToString();
                }
                else
                {

                    Response.Redirect("Login_Usuario.aspx");
                }

                CargarEspecialidad();
                CargarPacientes();
            }
        }

        private void CargarEspecialidad()
        {
            ddlEspe.Items.Clear();

            DataTable tablaEspe = neoEspecialidad.ObtenerEspecialidades();

            ddlEspe.DataSource = tablaEspe;
            ddlEspe.DataTextField = "DescripcionEspecialidad_ES";
            ddlEspe.DataValueField = "IDEspecialidades_ES";
            ddlEspe.DataBind();

            ddlEspe.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }
        public void CargarMedicos()
        {
            int idEspecialidad = int.Parse(ddlEspe.SelectedValue);
            SqlDataReader Medicos = neoMedico.ObtenerMedicosPorEspecialidad(idEspecialidad);
            ddlMedico.DataSource = Medicos;
            ddlMedico.DataTextField = "Legajo_MED";
            ddlMedico.DataValueField = "Legajo_MED";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }


        public void CargarPacientes()
        {
            ddlPaciente.Items.Clear();

            DataTable TablaPaciente = neoPaciente.ObtenerPacientes();
            ddlPaciente.DataSource = TablaPaciente;
            ddlPaciente.DataTextField = "DNI_PA";
            ddlPaciente.DataValueField = "DNI_PA";
            ddlPaciente.DataBind();
            ddlPaciente.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        public void CargarHorarios()
        {
            string legajoMed = ddlMedico.SelectedValue;
            string diaSeleccionado = ddlDia.SelectedValue;
            SqlDataReader horarios = neoMedico.ObtenerHorarios(legajoMed, diaSeleccionado);
            ddlHora.DataSource = horarios;
            ddlHora.DataTextField = "Horario";
            ddlHora.DataBind();
            ddlHora.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        public void CargarDias()
        {
            string legajoMed = ddlMedico.SelectedValue;
            SqlDataReader dias = neoMedico.ObtenerDias(legajoMed);
            ddlDia.DataSource = dias;
            ddlDia.DataTextField = "Dias";
            ddlDia.DataBind();
            ddlDia.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        protected void BtnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }

        protected void ddlEspe_SelectedIndexChanged(object sender, EventArgs e)
        {
                CargarMedicos();
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDias();
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarHorarios();
        }

        protected void BtnAsignar_Click(object sender, EventArgs e)
        {
            string legajoMed = ddlMedico.SelectedValue;
            string dniPaciente = ddlPaciente.SelectedValue;
            string dia = ddlDia.SelectedValue;
            string hora = ddlHora.SelectedValue;
            int especialidad = int.Parse(ddlEspe.SelectedValue);

            bool resultado = neoTurno.AsignarTurno(legajoMed, dniPaciente, dia, hora, especialidad);

            if (resultado)
            {
                lblAviso.Text = "Se asignó el turno correctamente.";
                lblAviso.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblAviso.Text = "No se pudo asignar el turno. Horario y dia ocupado.";
                lblAviso.ForeColor = System.Drawing.Color.Red;
            }

            Recarga();
        }

        public void Recarga()
        {
            CargarEspecialidad();
            CargarPacientes();
             
            ddlMedico.Items.Clear();
            ddlDia.Items.Clear();
            ddlHora.Items.Clear();
        }
    }
}