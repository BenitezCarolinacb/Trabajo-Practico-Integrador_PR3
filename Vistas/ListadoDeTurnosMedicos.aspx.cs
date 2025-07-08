using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class ListadoDeTurnosMedicos : System.Web.UI.Page
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

                cargarGv();
            }

        }

        protected void cargarGv()
        {
            DataTable dt = turno.ObtenerTurno();
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void cargarGv(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            string filtro = txtFiltro.Text.Trim();
            DataTable dataTable = turno.ObtenerTurnoFiltrados(filtro);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lblAviso.Text = "";
            }
            else
            {
                lblAviso.Text = "No se encontraron turnos para el legajo ingresado.";
                lblAviso.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltro.Text = string.Empty;
        }

        protected void btnFiltroDNI_Click(object sender, EventArgs e)
        {
            string dni = txtFiltroDNI.Text.Trim();
            DataTable dataTable = turno.ObtenerTurnoFiltradosDNI(dni);

            if (dataTable.Rows.Count > 0)
            {
                cargarGv(dataTable);
                lblAviso.Text = ""; 
            }
            else
            {
                lblAviso.Text = "No se encontraron turnos para el DNI ingresado.";
                lblAviso.ForeColor = System.Drawing.Color.Red;
            }

            txtFiltroDNI.Text = string.Empty;
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarGv();
        }

        protected void BtnCantidadAsistencias_Click(object sender, EventArgs e)
        {

            Limpiar();
            DataTable tablaPresente = turno.ObtenerPorcentajeTurnosPresentes();

            if (tablaPresente.Rows.Count > 0)
            {
                double porcentaje = Convert.ToDouble(tablaPresente.Rows[0]["Porcentaje"]);
                lblPresentes.Text = "Porcentaje de Presentes: " + porcentaje.ToString("N2") + " %";
            }

        }

        protected void BtnCantidadAusentismo_Click(object sender, EventArgs e)
        {
            Limpiar();
            DataTable tablaAusentee = turno.ObtenerPorcentajeTurnosAusentes();

            if (tablaAusentee.Rows.Count > 0)
            {
                double porcentajeAusente = Convert.ToDouble(tablaAusentee.Rows[0]["PorcentajeAusente"]);
                lblAusentes.Text = "Porcentaje de Ausentes: " + porcentajeAusente.ToString("N2") + " %";
            }
        }

        private void Limpiar()
        {
            lblAusentes.Text = "";
            lblPresentes.Text = "";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           GridView1.PageIndex = e.NewPageIndex;
           cargarGv();
            
        }
    }
}