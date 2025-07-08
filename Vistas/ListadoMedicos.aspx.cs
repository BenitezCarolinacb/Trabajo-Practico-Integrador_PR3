using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoMedicos : System.Web.UI.Page
    {
        Negocio_Medico medico = new Negocio_Medico();
        Negocio_Nacionalidad nacionalidad = new Negocio_Nacionalidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    lblNombreUsuario.Text = "Usuario: " + Session["NombreUsuario"].ToString();
                }
                else
                {

                    Response.Redirect("Login_Usuario.aspx");
                }
                cargarGv();
            }
            lbMensaje.Text = string.Empty;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }

        public void cargarGv()
        {
            DataTable dt = medico.ObtenerTablaMedicoActivos();            
            gvListadoMedicos.DataSource = dt;
            gvListadoMedicos.DataBind();

        }

        protected void gvListadoMedicosRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvListadoMedicos.Rows[e.RowIndex];

            string legajo = ((Label)row.FindControl("lbl_Legajo")).Text;
            string dni = ((Label)row.FindControl("lbl_DNI")).Text;
            string nombre = ((TextBox)row.FindControl("txt_edit_Nombre")).Text;
            string apellido = ((TextBox)row.FindControl("txt_edit_Apellido")).Text;
            string direccion = ((TextBox)row.FindControl("txt_edit_Direccion")).Text;
            string telefono = ((TextBox)row.FindControl("txt_edit_Telefono")).Text;
            string genero = ((TextBox)row.FindControl("txt_edit_Genero")).Text;
            DateTime fechaNacimiento = DateTime.Parse(((TextBox)row.FindControl("txt_edit_FechaNacimiento")).Text);
    
            // Crear objeto Medico con todos los datos
            Medico medico = new Medico(legajo, dni, nombre, apellido, genero, fechaNacimiento, direccion, telefono);

            Negocio_Medico negocio = new Negocio_Medico();
            bool actualizado = negocio.ActualizarMedico(medico);

            gvListadoMedicos.EditIndex = -1;
            cargarGv();

            if (actualizado)
            {
                lbMensaje.Text = "Médico actualizado correctamente.";
                lbMensaje.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                lbMensaje.Text = "No se pudo actualizar el médico.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void gvListadoMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListadoMedicos.EditIndex = -1;
            cargarGv();
        }

        protected void cargarGv(DataTable dt)
        {
            gvListadoMedicos.DataSource = dt;
            gvListadoMedicos.DataBind();
        }

        protected void gvListadoMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListadoMedicos.EditIndex = e.NewEditIndex;
            cargarGv();
        }

        protected void gvListadoMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListadoMedicos.PageIndex = e.NewPageIndex;
            cargarGv();
        }



        protected void btnFiltar_Click(object sender, EventArgs e)
        {
            string filtro = txtFiltro.Text.Trim();

            Negocio_Medico negocioMed = new Negocio_Medico();
            DataTable dataTable = negocioMed.ObtenerMedicoFiltrados(filtro);

            cargarGv(dataTable);

            txtFiltro.Text = string.Empty;
        }

        protected void btnMostarMedicosActivos_Click(object sender, EventArgs e)
        {
            ViewState["FiltroMedicos"] = "activos";
            cargarGv();
            txtFiltro.Text += string.Empty;
        }

        protected void gvListadoMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                GridViewRow row = gvListadoMedicos.Rows[e.RowIndex];
                string legajo = ((Label)row.FindControl("lbl_legajo")).Text;

                Negocio_Medico negocio = new Negocio_Medico();
                bool eliminar = negocio.EliminarMedico(legajo);

                if (eliminar)
                {
                    lbMensaje.Text = "Medico eliminado correctamente de la base de datos.";
                    gvListadoMedicos.DataSource = negocio.ObtenerTablaMedicoActivos();
                    gvListadoMedicos.DataBind();
                    lbMensaje.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbMensaje.Text = "Error en la eliminacion del Medico seleccionado";
                    lbMensaje.ForeColor = System.Drawing.Color.Red;

                }
            
        }

        protected void btnMostarTodo_Click(object sender, EventArgs e)
        {
            
            Negocio_Medico negocio = new Negocio_Medico();
            cargarGv(negocio.ObtenerTablaMedico());
        }

        protected void btnFiltrarDNI_Click(object sender, EventArgs e)
        {
            string dni = txtFiltroDNI.Text.Trim();

            Negocio_Medico negoMedico = new Negocio_Medico();
            DataTable dataTable = negoMedico.NegocioMedicosFiltrados(dni);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lbMensaje.Text = string.Empty;
            }
            else
            {
                gvListadoMedicos.DataSource = null;
                gvListadoMedicos.DataBind();
                lbMensaje.Text = "No se encontraron pacientes con ese DNI.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltroDNI.Text = string.Empty;
        }
    }
}