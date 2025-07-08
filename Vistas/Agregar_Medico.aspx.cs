using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vistas
{
    public partial class Agregar_Medico : System.Web.UI.Page
    {
        Negocio_Nacionalidad negocioNacionalidad = new Negocio_Nacionalidad();
        Negocio_Localidad negocioLocalidad = new Negocio_Localidad();
        Negocio_Provincia negocioProvincia = new Negocio_Provincia();
        Negocio_Especialidad negocio_Especialidad = new Negocio_Especialidad();
        Negocio_Usuario nUsuario = new Negocio_Usuario();
        Negocio_Medico negocio = new Negocio_Medico();
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

                CargarNacionalidadMedico();
                CargarEspecialidades();
                CargarProvincia(ddlProvincia);
            }
        }

        private void CargarNacionalidadMedico()
        {
            DataTable tablaMedico = negocioNacionalidad.ObtenerNacionalidades();

            ddlNacionalidad.DataSource = tablaMedico;
            ddlNacionalidad.DataTextField = "Cod_Nacionalidad_NA";
            ddlNacionalidad.DataValueField = "IDNacionalidad_NA";
            ddlNacionalidad.DataBind();

            ddlNacionalidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        private void CargarProvincia(DropDownList dllProvincias)
        {
            DataTable tablaMedico = negocioProvincia.ObtenerProvincias();

            dllProvincias.DataSource = tablaMedico;
            dllProvincias.DataTextField = "NombreProvincia_P";
            dllProvincias.DataValueField = "ID_Provincia_P";
            dllProvincias.DataBind();

            dllProvincias.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        private void CargarLocalidadesMedico(int idProvincia)
        {
            DataTable tablaLocalidades = negocioLocalidad.ObtenerLocalidad(idProvincia);

            ddlLocalidad.DataSource = tablaLocalidades;
            ddlLocalidad.DataTextField = "Nombre_Localidad_L";
            ddlLocalidad.DataValueField = "IDLocalidad_L";
            ddlLocalidad.DataBind();

            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        private void CargarEspecialidades()
        {
            DataTable tablaEspecialidad = negocio_Especialidad.ObtenerEspecialidades();

            ddlEspecialidad.DataSource = tablaEspecialidad;
            ddlEspecialidad.DataTextField = "DescripcionEspecialidad_ES";
            ddlEspecialidad.DataValueField = "IDEspecialidades_ES";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            CargarLocalidadesMedico(idProvincia);
        }

        protected void btnMenu_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Administrador.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (!Page.IsValid)
            {
                return;
            }

            if (Session["UsuarioValidado"] == null)
            {
                if (nUsuario.existeUsuario(txt_Usuario.Text) && nUsuario.ExisteUnMail(txt_mail.Text))
                {
                    lblMensaje.Text = "El nombre de usuario y el mail ya están en uso. Por favor, elegí otro.";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                Usuario user = new Usuario();
                
                user.Nombre = txt_Usuario.Text;
                user.Contraseña = txt_Contraseña.Text;
                user.Mail = txt_mail.Text + "@gmail.com";
                user.TipoUsuario = 2;
                

                if (!nUsuario.AgregarUsuario(user))
                {
                    lblMensaje.Text = "Hubo un error al agregar el usuario.";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                Session["UsuarioValidado"] = true;
            }

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

            // Validaciones de existencia
            if (negocio.ExisteLegajo(txt_Legajo.Text))
            {
                lblMensaje.Text = "El legajo ya existe en la base de datos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (negocio.existeDNI(txt_DNI.Text))
            {
                lblMensaje.Text = "El DNI ya existe en la base de datos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            //int idEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);

            //if (negocio.ExisteMedicoConEspecialidad(idEspecialidad))
            //{
            //    lblMensaje.Text = "Ya existe un médico con esa especialidad.";
            //    lblMensaje.ForeColor = System.Drawing.Color.Red;
            //    return;
            //}

            //if (negocio.ExisteNombreMedico(txt_Nombre.Text))
            //{
            //    lblMensaje.Text = "Ya existe este nombre en la base de datos";
            //    lblMensaje.ForeColor = System.Drawing.Color.Red;
            //    return;
            //}

            //if (negocio.ExisteApellidoMedico(txt_Apellido.Text))
            //{
            //    lblMensaje.Text = "Ya existe este apellido en la base de datos";
            //    lblMensaje.ForeColor = System.Drawing.Color.Red;
            //    return;
            //}

            if (txt_mail.Text.Contains("@"))
            {
                lblMensaje.Text = "No ingrese el dominio, solo el nombre";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
                        

            Medico agregar = new Medico();
            agregar.Legajo = "M" + txt_Legajo.Text.PadLeft(3, '0');
            agregar.DNI = txt_DNI.Text;
            agregar.Nombre = txt_Nombre.Text;
            agregar.Apellido = txt_Apellido.Text;
            agregar.Genero = txt_Genero.Text;
            agregar.FechaNacimiento = DateTime.Parse(txt_FechaNacimiento.Text);
            agregar.Direccion = txt_Direccion.Text;
            agregar.Telefono = txt_Telefono.Text;
            agregar.Usuario = txt_Usuario.Text;
            agregar.IDNacionalidad = int.Parse(ddlNacionalidad.SelectedValue);
            agregar.IDProvincia = int.Parse(ddlProvincia.SelectedValue);
            agregar.IDLocalidad = int.Parse(ddlLocalidad.SelectedValue);
            agregar.IDEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);
            agregar.Estado = true;


            negocio.AltaMedico(agregar);

            lblMensaje.ForeColor = System.Drawing.Color.Green;
            lblMensaje.Text = "Médico agregado correctamente a la base de datos.";

            Recarga();
        }

        public void Recarga()
        {
            txt_Legajo.Text = string.Empty;
            txt_Direccion.Text = string.Empty;
            txt_Apellido.Text = string.Empty;
            txt_Contraseña.Text = string.Empty;
            txt_Direccion.Text = string.Empty;
            txt_DNI.Text = string.Empty;
            txt_FechaNacimiento.Text = string.Empty;
            txt_Genero.Text = string.Empty;
            txt_mail.Text = string.Empty;
            txt_Nombre.Text = string.Empty;
            txt_Telefono.Text = string.Empty;
            txt_Usuario.Text = string.Empty;

            ddlEspecialidad.Items.Clear();
            ddlLocalidad.Items.Clear();
            ddlNacionalidad.Items.Clear();
            ddlProvincia.Items.Clear();

            CargarNacionalidadMedico();
            CargarEspecialidades();
            CargarProvincia(ddlProvincia);
        }
    }

}

