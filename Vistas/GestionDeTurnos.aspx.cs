using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas
{
    public partial class GestionDeTurnos : System.Web.UI.Page
    {

        Negocio_Turno turno = new Negocio_Turno();
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
            if (Session["LegajoMedico"] != null)
            {
                string legajo = Session["LegajoMedico"].ToString();
                DataTable dt = turno.ObtenerTurno(legajo);
                gvListadoTurnos.DataSource = dt;
                gvListadoTurnos.DataBind();
            }
            else
            {

                lblMensaje.Text = "Debe iniciar sesión.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
    }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Medico.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListadoTurnos.PageIndex = e.NewPageIndex;
            CargarGv();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListadoTurnos.EditIndex = e.NewEditIndex;
            CargarGv();
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvListadoTurnos.Rows[e.RowIndex];

            int idTurno = int.Parse(((Label)row.FindControl("lblid")).Text);
            string nuevaObs = ((TextBox)row.FindControl("txt_edit_observaciones")).Text;

            string nuevoEstado = ((TextBox)row.FindControl("txt_edit_estado")).Text;

            Negocio_Turno negocio = new Negocio_Turno();
            bool actualizado = negocio.ActualizarObservacionEstado(idTurno, nuevaObs, nuevoEstado);

            gvListadoTurnos.EditIndex = -1;
            CargarGv();

            if (actualizado)
            {
                lblMensaje.Text = "Turno actualizado correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMensaje.Text = "No se pudo actualizar el turno.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }

        }


        protected void cargarGv(DataTable dt)
        {
            gvListadoTurnos.DataSource = dt;
            gvListadoTurnos.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListadoTurnos.EditIndex = -1;
            CargarGv();
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            string filtro = txtFiltro.Text.Trim();
            string legajo = Session["LegajoMedico"].ToString();
            Negocio_Paciente negocioPaciente = new Negocio_Paciente();
            DataTable dataTable = negocioPaciente.NegocioPacientesFiltrados(filtro,legajo);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lblMensaje.Text = string.Empty;
            }
            else
            {
                gvListadoTurnos.DataSource = null;
                gvListadoTurnos.DataBind();
                lblMensaje.Text = "No se encontraron pacientes con ese DNI.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltro.Text = string.Empty;
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            CargarGv();
        }
    }
}