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
    public partial class Agregar_Paciente : System.Web.UI.Page
    {

        Negocio_Nacionalidad negocioNacionalidad = new Negocio_Nacionalidad();
        Negocio_Provincia negocioProvincia = new Negocio_Provincia();
        Negocio_Localidad negocioLocalidad = new Negocio_Localidad();
        Negocio_Paciente neoPaciente = new Negocio_Paciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    lblUsuarioMedico.Text = "Usuario: " + Session["NombreUsuario"].ToString();
                }
                else
                {

                    Response.Redirect("Login_Usuario.aspx");
                }
                CargarNacionalidad();
                CargarProvincia(ddlProvincia);


            }
        }

        private void CargarNacionalidad()
        {
            DataTable tablaPaciente = negocioNacionalidad.ObtenerNacionalidades();

            ddlNacionalidad.DataSource = tablaPaciente;
            ddlNacionalidad.DataTextField = "Cod_Nacionalidad_NA";
            ddlNacionalidad.DataValueField = "IDNacionalidad_NA";
            ddlNacionalidad.DataBind();

            ddlNacionalidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        private void CargarProvincia(DropDownList dllProvincias)
        {
            DataTable tablaPaciente = negocioProvincia.ObtenerProvincias();

            dllProvincias.DataSource = tablaPaciente;
            dllProvincias.DataTextField = "NombreProvincia_P";
            dllProvincias.DataValueField = "ID_Provincia_P";
            dllProvincias.DataBind();

            dllProvincias.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        private void CargarLocalidades(int idProvincia)
        {
            DataTable tablaLocalidades = negocioLocalidad.ObtenerLocalidad(idProvincia);

            ddlLocalidad.DataSource = tablaLocalidades;
            ddlLocalidad.DataTextField = "Nombre_Localidad_L";
            ddlLocalidad.DataValueField = "IDLocalidad_L";
            ddlLocalidad.DataBind();

            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {

            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            CargarLocalidades(idProvincia);
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {


            // Validaciones de selección
            if (ddlNacionalidad.SelectedValue == "0")
            {
                lblMensaje.Text = "Por favor, seleccioná una nacionalidad válida.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (ddlProvincia.SelectedValue == "0")
            {
                lblMensaje.Text = "Por favor, seleccioná una provincia válida.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (ddlLocalidad.SelectedValue == "0")
            {
                lblMensaje.Text = "Por favor, seleccioná una localidad válida.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (neoPaciente.ExisteUnMailPaciente(txtMail.Text))
            {
                lblMensaje.Text = "El mail ya existe en la base de datos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (neoPaciente.existeDNIPaciente(txtDNI.Text))
            {
                lblMensaje.Text = "El DNI ya existe en la base de datos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (neoPaciente.ExisteNombreMedico(txtNombre.Text))
            {
                lblMensaje.Text = "Ya existe este nombre en la base de datos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (neoPaciente.ExisteApellidoMedico(txtApellido.Text))
            {
                lblMensaje.Text = "Ya existe este apellido en la base de datos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }


            Paciente nuevo = new Paciente();

                nuevo.DNI = txtDNI.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Apellido = txtApellido.Text;
                nuevo.Genero = txtGenero.Text;
                nuevo.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                nuevo.Direccion = txtDireccion.Text;
                nuevo.Telefono = txtTelefono.Text;
                nuevo.Email = txtMail.Text;
                nuevo.IDNacionalidad = int.Parse(ddlNacionalidad.SelectedValue);
                nuevo.IdProvincia = int.Parse(ddlProvincia.SelectedValue);
                nuevo.IDLocalidad = int.Parse(ddlLocalidad.SelectedValue);
                nuevo.Estado = true;
                neoPaciente.AltaPaciente(nuevo);

                lblMensaje.Text = "Paciente agregado correctamente a la base de datos.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
        }
        
    }







  

}
