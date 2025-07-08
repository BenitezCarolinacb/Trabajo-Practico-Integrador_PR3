using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;

namespace Datos
{
    public class DaoUsuario
    {
        Conexion conexion = new Conexion();

        public Usuario ObtenerUsuario(string nombreUsuario, string contraseña)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@Contraseña", contraseña);

            return conexion.EjecutarReaderUsuario(cmd, "SP_ObtenerUsuarioLogin");
        }


        public void AltaUsuario(Usuario nuevoUsuario)
        {
            using (SqlConnection conexion = new Conexion().ObtenerConexion())
            {
                SqlCommand comando = new SqlCommand("AltaUsuario", conexion);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@NombreUsuario", nuevoUsuario.Nombre);
                comando.Parameters.AddWithValue("@Clave", nuevoUsuario.Contraseña);
                comando.Parameters.AddWithValue("@TipoUsuario", nuevoUsuario.TipoUsuario);
             

                comando.ExecuteNonQuery();
            }
        }

        public bool ExisteUsuario(string user)
        {
            string consulta = "SELECT COUNT(*) FROM Usuarios WHERE NombreUsuario_U = @usuario";

            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {
                if (conn == null)
                    throw new Exception("Error al obtener la conexión.");

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@usuario", user);

                int cantidad = Convert.ToInt32(cmd.ExecuteScalar());
                return cantidad > 0;
            }
        }

        public int AgregarUsuario(Usuario user)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarUsuario(ref comando, user);
            return conexion.EjecutarProcedimientoAlmacenado(comando, "spAgregarUsuario");

        }

        private void ArmarParametrosAgregarUsuario(ref SqlCommand Comando, Usuario user)
        {
            Comando.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = user.Nombre;
            Comando.Parameters.Add("@CLAVE", SqlDbType.VarChar).Value = user.Contraseña;
            Comando.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = user.Mail;
            Comando.Parameters.Add("@TIPO", SqlDbType.Int).Value = user.TipoUsuario;
        }
        public Boolean ExisteUnUsuario(string user)
        {
            string consulta = "SELECT * FROM Usuarios WHERE NombreUsuario_U = '" + user + "'";
            return conexion.existe(consulta);
        }

        public int ActualizarContraseña(string usuario, string claveNueva)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@Usuario", usuario);
            comando.Parameters.AddWithValue("@NuevaClave", claveNueva);

            return conexion.EjecutarProcedimientoAlmacenado(comando, "SPActualizarContraseña");
        }

        public Boolean ExisteMail(string mail)
        {
            string consulta = "SELECT * FROM Usuarios WHERE Email_U = '" + mail + "'";
            return conexion.existe(consulta);
        }

        public bool existeNombreUsuario(string nombreUsuario)
        {
            string consulta = "SELECT COUNT(*) FROM Usuarios WHERE NombreUsuario_U = @usuario";

            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {
                if (conn == null)
                    throw new Exception("Error al obtener la conexión.");

                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.Parameters.AddWithValue("@usuario", nombreUsuario);

                    int cantidad = Convert.ToInt32(cmd.ExecuteScalar());
                    return cantidad > 0;
                }
            }
        }

        public bool ModificarUsuarioPorNombre(string usuarioActual, Usuario user)
        {
            string consulta = @" UPDATE Usuarios SET NombreUsuario_U = @nuevoNombre, Contraseña_U = @nuevaClave WHERE NombreUsuario_U = @usuarioActual";

            using (SqlConnection conn = new Conexion().ObtenerConexion())
            {
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.Parameters.AddWithValue("@nuevoNombre", user.Nombre);
                    cmd.Parameters.AddWithValue("@nuevaClave", user.Contraseña);
                    cmd.Parameters.AddWithValue("@usuarioActual", usuarioActual);

                    int filasAfectadas = cmd.ExecuteNonQuery();

                    return filasAfectadas > 0;
                }
            }
        }


    }
}
