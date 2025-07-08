using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using System.Reflection;
using System.Diagnostics.Contracts;

namespace Datos
{
    public class DaoMedico
    {
       
        private Conexion cn = new Conexion();

        public DataTable ObtenerMedicos()
        {
            string consultaSQL = "SELECT " +
                "m.Legajo_MED, " +
                "m.DNI_MED, " +
                "m.Nombre_MED, " +
                "m.Apellido_MED, " +
                "m.Genero_MED, " +
                "N.DescripcionNacionalidad_NA AS Nacionalidad, " +
                "m.Fecha_Nacimiento_MED, " +
                "m.Direccion_MED, " +
                "m.Telefono_MED, " +
                "Espe.DescripcionEspecialidad_ES AS Especialidad, " +
                "L.Nombre_Localidad_L AS Localidad, " +
                "m.UsuarioMedico_MED, " +
                "P.NombreProvincia_P AS Provincia, " +
                "m.Estado_Med " +
                " FROM Medicos m " +
                "INNER JOIN Nacionalidad N ON m.IDNacionalidad_MED = N.IDNacionalidad_NA " +
                "INNER JOIN Especialidades Espe ON m.ID_Especialidad_MED = Espe.IDEspecialidades_ES " +
                "INNER JOIN Localidades L ON m.IDLocalidad_MED = L.IDLocalidad_L " +
                "INNER JOIN Provincias_P P ON m.IDProvincia_MED = P.ID_Provincia_P ";

            return cn.ObtenerTablas(consultaSQL, "Medicos");
        }
        public DataTable ObtenerMedicosActivos()
        {
            string consultaSQL = "SELECT " +
                "m.Legajo_MED, " +
                "m.DNI_MED, " +
                "m.Nombre_MED, " +
                "m.Apellido_MED, " +
                "m.Genero_MED, " +
                "N.DescripcionNacionalidad_NA AS Nacionalidad, " +
                "m.Fecha_Nacimiento_MED, " +
                "m.Direccion_MED, " +
                "m.Telefono_MED, " +
                "Espe.DescripcionEspecialidad_ES AS Especialidad, " +
                "L.Nombre_Localidad_L AS Localidad, " +
                "m.UsuarioMedico_MED, " +
                "P.NombreProvincia_P AS Provincia, " +
                "m.Estado_Med " +
                " FROM Medicos m " +
                "INNER JOIN Nacionalidad N ON m.IDNacionalidad_MED = N.IDNacionalidad_NA " +
                "INNER JOIN Especialidades Espe ON m.ID_Especialidad_MED = Espe.IDEspecialidades_ES " +
                "INNER JOIN Localidades L ON m.IDLocalidad_MED = L.IDLocalidad_L " +
                "INNER JOIN Provincias_P P ON m.IDProvincia_MED = P.ID_Provincia_P " +
                "WHERE Estado_MED = 1 ";
                
            return cn.ObtenerTablas(consultaSQL, "Medicos");
        }

        private void AgregarParametros(ref SqlCommand comand, Medico medico)
        {
            comand.Parameters.Add("@LEGAJO_MED", SqlDbType.Char).Value = medico.Legajo;
            comand.Parameters.Add("@DNI_MED", SqlDbType.Int).Value = medico.DNI;
            comand.Parameters.Add("@NOMBRE_MED", SqlDbType.VarChar).Value = medico.Nombre;
            comand.Parameters.Add("@APELLIDO_MED", SqlDbType.VarChar).Value = medico.Apellido;
            comand.Parameters.Add("@GENERO_MED", SqlDbType.VarChar).Value = medico.Genero;
            comand.Parameters.Add("@FECHA_NACIMIENTO_MED", SqlDbType.DateTime).Value = medico.FechaNacimiento;
            comand.Parameters.Add("@DIRECCION_MED", SqlDbType.VarChar).Value = medico.Direccion;
            comand.Parameters.Add("@TELEFONO_MED", SqlDbType.VarChar).Value = medico.Telefono;
            //comand.Parameters.Add("@USUARIOMEDICO_MED", SqlDbType.VarChar).Value = medico.Usuario;
            //comand.Parameters.Add("@ESTADO_MED", SqlDbType.Bit).Value = medico.Estado;
        }

        public bool ActualizarMedico (Medico medico)
        {
            SqlCommand SQLCom = new SqlCommand();
            AgregarParametros(ref SQLCom, medico);
            int filasModificadas= cn.EjecutarProcedimientoAlmacenado(SQLCom, "spActualizarMedico");
            if (filasModificadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int EliminarMedico(string legajo)
        {
            string consulta = "UPDATE Medicos SET Estado_MED = 0 WHERE Legajo_MED = @legajo";
            SqlCommand command = new SqlCommand(consulta);
            command.Parameters.AddWithValue("@legajo",legajo);
            return cn.ejecutarTransaccion(command);
        }

        public void AltaMedico(Medico medico)
        {
            SqlCommand cmd = new SqlCommand();
            AgregarParametrosAlta(ref cmd, medico);
            cn.EjecutarProcedimientoAlmacenado(cmd, "SP_AgregarMedico");
        }

        public DataTable ObtenerMedicoFiltrado(string filtro)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@LegajoFiltro", filtro);

            return cn.EjecutarConsulta(cmd, "SP_BuscarMedicoPorLegajo");
        }

        private void AgregarParametrosAlta(ref SqlCommand comando, Medico medico)
        {
            comando.Parameters.Add("@Legajo_MED", SqlDbType.Char).Value = medico.Legajo;
            comando.Parameters.Add("@DNI_MED", SqlDbType.Int).Value = medico.DNI;
            comando.Parameters.Add("@Nombre_MED", SqlDbType.VarChar).Value = medico.Nombre;
            comando.Parameters.Add("@Apellido_MED", SqlDbType.VarChar).Value = medico.Apellido;
            comando.Parameters.Add("@Genero_MED", SqlDbType.VarChar).Value = medico.Genero;
            comando.Parameters.Add("@Fecha_Nacimiento_MED", SqlDbType.DateTime).Value = medico.FechaNacimiento;
            comando.Parameters.Add("@UsuarioMedico_MED", SqlDbType.VarChar).Value = medico.Usuario;
            comando.Parameters.Add("@Direccion_MED", SqlDbType.VarChar).Value = medico.Direccion;
            comando.Parameters.Add("@Telefono_MED", SqlDbType.VarChar).Value = medico.Telefono;
            comando.Parameters.Add("@IDLocalidad_MED", SqlDbType.Int).Value = medico.IDLocalidad;
            comando.Parameters.Add("@IDProvincia_MED", SqlDbType.Int).Value = medico.IDProvincia;
            comando.Parameters.Add("@IDNacionalidad_MED", SqlDbType.Int).Value = medico.IDNacionalidad;
            comando.Parameters.Add("@ESTADO_MED", SqlDbType.Bit).Value = medico.Estado;
            comando.Parameters.Add("@Id_Especialidad_MED", SqlDbType.Int).Value = medico.IDEspecialidad;
        }

        public bool ExisteLegajo(string legajo)
        {
            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Medicos WHERE Legajo_MED = @legajo", conn);
                cmd.Parameters.AddWithValue("@legajo", legajo);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        public bool ExisteDNI(string dni)
        {
            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Medicos WHERE DNI_MED = @dni", conn);
                cmd.Parameters.AddWithValue("@dni", dni);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        public DataTable ObtenerDatosPersonales(string usuarioMedico)
        {
         string consultaSQL = $@"SELECT Legajo_MED AS LEGAJO, DNI_MED AS DNI, Nombre_MED AS NOMBRE, Apellido_MED AS APELLIDO, Fecha_Nacimiento_MED AS FECHA , Direccion_MED AS DIRECCION, Telefono_MED AS TELEFONO FROM Medicos  WHERE UsuarioMedico_MED = '{usuarioMedico}'";
            return cn.ObtenerTablas(consultaSQL, "Medicos");
        }

        public SqlDataReader ObtenerMedicosEspecialidad(int IdEspecialidad)
        {
            SqlConnection Conexion = cn.ObtenerConexion();
            string consulta = "SELECT Legajo_MED FROM MEDICOS INNER JOIN ESPECIALIDADES ON MEDICOS.Id_Especialidad_MED = ESPECIALIDADES.IDEspecialidades_ES WHERE MEDICOS.Id_Especialidad_MED = @ID_ESPECIALIDAD;";
            SqlCommand comando = new SqlCommand(consulta, Conexion);
            comando.Parameters.AddWithValue("@ID_ESPECIALIDAD", IdEspecialidad);
            SqlDataReader lector = comando.ExecuteReader();
            return lector;
        }

        public SqlDataReader ObtenerDias(string legajo)
        {
            SqlConnection conexion = cn.ObtenerConexion();
            string consulta = "SELECT DISTINCT Dias FROM Horarios_Medicos WHERE LegajoMedico_H = @Legajo";
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.Parameters.AddWithValue("@Legajo", legajo);
            SqlDataReader lector = comando.ExecuteReader();
            return lector;
        }
        public SqlDataReader ObtenerLegajos()
        {
            SqlConnection conexion = cn.ObtenerConexion();
            string consulta = "SELECT Legajo_MED FROM Medicos ";
            SqlCommand comando = new SqlCommand(consulta, conexion);
            SqlDataReader lector = comando.ExecuteReader();
            return lector;
        }

        public SqlDataReader ObtenerHorarios(string legajo, string dia)
        {
            SqlConnection conexion = cn.ObtenerConexion();
            string consulta = "SELECT Horario FROM Horarios_Medicos WHERE LegajoMedico_H = @Legajo AND Dias = @Dia ORDER BY Horario";
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.Parameters.AddWithValue("@Legajo", legajo);
            comando.Parameters.AddWithValue("@Dia", dia);
            return comando.ExecuteReader();
        }

        public bool ExisteMedicoConEspecialidad(int idEspecialidad)
        {
            string consulta = $"SELECT 1 FROM Medicos WHERE Id_Especialidad_MED = {idEspecialidad}";
            return cn.existe(consulta);
        }

        public DataTable MedicosFiltradosConDNI(string dni)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@DNI", dni + "%");

            return cn.EjecutarConsulta(cmd, "SP_BuscarMedicosPorDNI");
        }

        public Boolean ExisteNombreMedico(string nombre)
        {
            string consulta = "SELECT * FROM Medicos WHERE Nombre_MED = '" + nombre + "'";
            return cn.existe(consulta);
        }

        public Boolean ExisteApellido(string apellido)
        {
            string consulta = "SELECT * FROM Medicos WHERE Apellido_MED = '" + apellido + "'";
            return cn.existe(consulta);
        }

    }
}
