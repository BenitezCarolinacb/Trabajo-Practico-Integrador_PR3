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
    public partial class ListadoDePacientes : System.Web.UI.Page
    {
        Negocio_Paciente paciente = new Negocio_Paciente();

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

        protected void cargarGv()
        {
            DataTable dt = paciente.ObtenerPacientes();
            gv_pacientes.DataSource = dt;
            gv_pacientes.DataBind();
        }

        protected void cargarGv(DataTable dt)
        {
            gv_pacientes.DataSource = dt;
            gv_pacientes.DataBind();
        }

        protected void gv_pacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gv_pacientes.Rows[e.RowIndex];

            string dni = ((Label)row.FindControl("lbl_DNI")).Text;
            string nombre = ((TextBox)row.FindControl("txt_edit_nombrePaciente")).Text;
            string apellido = ((TextBox)row.FindControl("txt_edit_ApellidoPaciente")).Text;
            string direccion = ((TextBox)row.FindControl("txt_edit_Direccion")).Text;
            string telefono = ((TextBox)row.FindControl("txt_edit_Telefono")).Text;
            string email = ((TextBox)row.FindControl("txt_edit_Email")).Text;
            DateTime fechaNacimiento = DateTime.Parse(((TextBox)row.FindControl("txt_edit_fecha")).Text);
            string genero = ((TextBox)row.FindControl("txt_edit_Genero")).Text;
            bool estado = bool.Parse(((TextBox)row.FindControl("txt_edit_estado")).Text);

            Paciente paciente = new Paciente(dni, nombre, apellido, direccion, telefono, email, genero, fechaNacimiento, estado);

            Negocio_Paciente negocio = new Negocio_Paciente();
            bool actualizado = negocio.ActualizarPaciente(paciente);

            gv_pacientes.EditIndex = -1;
            cargarGv();

            if (actualizado)
            {
                lbMensaje.Text = "Paciente actualizado correctamente.";
                lbMensaje.ForeColor = System.Drawing.Color.Green;


            }
            else
            {
                lbMensaje.Text = "Paciente no se pudo actualizar correctamente.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;

            }
        }    

        protected void gv_pacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_pacientes.EditIndex = e.NewEditIndex;
            cargarGv();
        }
       
        protected void gv_pacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_pacientes.PageIndex = e.NewPageIndex;
            cargarGv();
        }

        protected void gv_pacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
                gv_pacientes.EditIndex = -1; 
                cargarGv();
        }

        protected void gv_pacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gv_pacientes.Rows[e.RowIndex];

            string dniPaciente = ((Label)row.FindControl("lbl_DNI")).Text;

            Negocio_Paciente negocioPaciente = new Negocio_Paciente();
            bool eliminado = negocioPaciente.EliminarPaciente(dniPaciente);

            if (eliminado)
            {
                lbMensaje.Text = "Paciente eliminado correctamente de la base de datos.";
                lbMensaje.ForeColor = System.Drawing.Color.Green;
                cargarGv();
            }
            else
            {
                lbMensaje.Text = "Error al eliminar el paciente de la base de datos.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string filtro = txtFiltrar.Text.Trim();

            Negocio_Paciente negocioPaciente = new Negocio_Paciente();
            DataTable dataTable = negocioPaciente.NegocioPacientesFiltradosDNI(filtro);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lbMensaje.Text = string.Empty;
            }
            else
            {
                gv_pacientes.DataSource = null;
                gv_pacientes.DataBind();
                lbMensaje.Text = "No se encontraron pacientes con ese DNI.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltrar.Text = string.Empty;
        }

        protected void btnFiltrarNombre_Click(object sender, EventArgs e)
        {
            string nombre = txtFiltrarNombre.Text.Trim();

            Negocio_Paciente negocioPaciente = new Negocio_Paciente();
            DataTable dataTable = negocioPaciente.NegocioPacientesFiltradosNombre(nombre);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lbMensaje.Text = string.Empty;
            }
            else
            {
                gv_pacientes.DataSource = null;
                gv_pacientes.DataBind();
                lbMensaje.Text = "No se encontraron pacientes con ese nombre.";
                lbMensaje.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltrarNombre.Text = string.Empty;
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarGv();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Medico.aspx");
        }

       

    }
}