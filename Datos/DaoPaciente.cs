using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace Datos
{
    public class DaoPaciente
    {
        Conexion conexion = new Conexion();
       
        public DataTable ObtenerPacientes()
        {
            string consultaSQL = "SELECT " +
            "p.DNI_PA, " +
            "l.Nombre_Localidad_L AS Localidad, " +
            "pr.NombreProvincia_P AS Provincia, " +
            "n.DescripcionNacionalidad_NA AS Nacionalidad, " +
            "p.Genero_PA, " +
            "p.Email_PA, " +
            "p.Nombre_PA, " +
            "p.Apellido_PA, " +
            "p.Fecha_Nacimiento_PA, " +
            "p.Direccion_PA, " +
            "p.Telefono_PA, " +
            "p.Estado_PA " +
            "FROM Pacientes p " +
            "INNER JOIN Localidades l ON p.ID_Localidad_PA = l.IDLocalidad_L " +
            "INNER JOIN Provincias_P pr ON p.ID_Provincia_PA = pr.ID_Provincia_P " +
            "INNER JOIN Nacionalidad n ON p.ID_Nacionalidad_PA = n.IDNacionalidad_NA " +
            "WHERE Estado_PA = 1";

            return conexion.ObtenerTablas(consultaSQL, "Pacientes");
        }
        private void AgregarParametros(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = comando.Parameters.Add("@DNI_PA", SqlDbType.Int);
            SqlParametros.Value = paciente.DNI;
            SqlParametros = comando.Parameters.Add("@Nombre_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Nombre;
            SqlParametros = comando.Parameters.Add("@APELLIDO_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Apellido;
            SqlParametros = comando.Parameters.Add("@Genero_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Genero;
            SqlParametros = comando.Parameters.Add("@Email_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Email;
            SqlParametros = comando.Parameters.Add("@Fecha_Nacimiento_PA", SqlDbType.DateTime);
            SqlParametros.Value = paciente.FechaNacimiento;
            SqlParametros = comando.Parameters.Add("@Direccion_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Direccion;
            SqlParametros = comando.Parameters.Add("@Telefono_PA", SqlDbType.VarChar);
            SqlParametros.Value = paciente.Telefono;
            SqlParametros = comando.Parameters.Add("@ESTADO_PA", SqlDbType.Bit);
            SqlParametros.Value = paciente.Estado;
        }

        public bool ActualizarPaciente(Paciente paciente)
        {
            SqlCommand sqlCommand = new SqlCommand();
            AgregarParametros(ref sqlCommand, paciente);
            Conexion conexion = new Conexion();
            int filasAfectadas = conexion.EjecutarProcedimientoAlmacenado(sqlCommand, "spActualizarPaciente");
            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int EliminarPaciente(string dni)
        {
            string consulta = "UPDATE Pacientes SET Estado_PA = 0 WHERE DNI_PA = @dni";
            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@dni", dni);
            return conexion.ejecutarTransaccion(cmd);
        }

        public DataTable ObtenerPacientesFiltrados(string filtro,string legajo)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@DNIFiltro", filtro);
            cmd.Parameters.AddWithValue("@LegajoMed", legajo);

            return conexion.EjecutarConsulta(cmd, "SP_BuscarTurnosPorUnDNI");
        }

        public DataTable ObtenerPacientesFiltradosDNI(string filtro)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@DNI", filtro + "%");

            return conexion.EjecutarConsulta(cmd, "SP_BuscarPacientesPorDNI");
        }

        public DataTable ObtenerPacientesFiltradosConNombre(string nombre)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@NombrePaciente", nombre + "%");

            return conexion.EjecutarConsulta(cmd, "SP_BuscarPacientesPorNombre");
        }
        public void AltaPaciente(Paciente paciente)
        {
            SqlCommand cmd = new SqlCommand();
            AgregarParametrosAlta(ref cmd, paciente);
            Conexion conexion = new Conexion();
            conexion.EjecutarProcedimientoAlmacenado(cmd, "sp_AgregarPaciente");
        }

        private void AgregarParametrosAlta(ref SqlCommand comando, Paciente paciente)
        {
            comando.Parameters.Add("@DNI_PA", SqlDbType.Char, 8).Value = paciente.DNI;
            comando.Parameters.Add("@Nombre_PA", SqlDbType.VarChar, 50).Value = paciente.Nombre;
            comando.Parameters.Add("@Apellido_PA", SqlDbType.VarChar, 50).Value = paciente.Apellido;
            comando.Parameters.Add("@Genero_PA", SqlDbType.VarChar, 10).Value = paciente.Genero;
            comando.Parameters.Add("@Email_PA", SqlDbType.VarChar, 100).Value = paciente.Email;
            comando.Parameters.Add("@Fecha_Nacimiento_PA", SqlDbType.DateTime).Value = paciente.FechaNacimiento;
            comando.Parameters.Add("@Direccion_PA", SqlDbType.VarChar, 100).Value = paciente.Direccion;
            comando.Parameters.Add("@Telefono_PA", SqlDbType.VarChar, 15).Value = paciente.Telefono;
            comando.Parameters.Add("@ID_Localidad_PA", SqlDbType.Int).Value = paciente.IDLocalidad;
            comando.Parameters.Add("@ID_Provincia_PA", SqlDbType.Int).Value = paciente.IdProvincia;
            comando.Parameters.Add("@ID_Nacionalidad_PA", SqlDbType.Int).Value = paciente.IDNacionalidad;
            comando.Parameters.Add("@Estado_PA", SqlDbType.Bit).Value = paciente.Estado;

        }

        
        public Boolean ExisteUnMailPaciente(string mail)
        {
            string consulta = "SELECT * FROM Pacientes WHERE Email_PA = '" + mail + "'";
            return conexion.existe(consulta);
        }


        public bool ExisteDNIpaciente(string dni)
        {
            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Pacientes WHERE DNI_PA = @dni", conn);
                cmd.Parameters.AddWithValue("@dni", dni);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        public Boolean ExisteNombrePaciente(string nombre)
        {
            string consulta = "SELECT * FROM Pacientes WHERE Nombre_PA = '" + nombre + "'";
            return conexion.existe(consulta);
        }

        public Boolean ExisteApellidoPaciente(string apellido)
        {
            string consulta = "SELECT * FROM Pacientes WHERE Apellido_PA = '" + apellido + "'";
            return conexion.existe(consulta);
        }
    }
}
