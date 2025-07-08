using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class Conexion
    {
       
       public static string cadenaConexion = "Data Source=localhost\\sqlexpress;Initial Catalog=ClinicaBD;Integrated Security=True";
      
        public DataTable ObtenerTablas(string consultaSQL, string nombreTabla)
        {
            SqlConnection conn = new SqlConnection(cadenaConexion);
            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, conn);
            DataSet ds = new DataSet();
            adap.Fill(ds, nombreTabla);
            conn.Close();
            return ds.Tables[nombreTabla];
        }

        public int ejecutarTransaccion(SqlCommand cmd)
        {
            SqlConnection conn = new SqlConnection(cadenaConexion);
            cmd.Connection = conn;
            conn.Open();
            int filasSAfectadas = cmd.ExecuteNonQuery();
            conn.Close();
            return filasSAfectadas;
        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
            try
            {
                sqlConnection.Open();
                return sqlConnection;
            }
            catch (Exception exception)
            {
                return null;
            }
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand comandoSQL, string nombreProcedimientoAlmacenado) //comandoSQL recibe tiene los parametros incluidos
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand = comandoSQL;
            sqlCommand.Connection = Conexion;
            sqlCommand.CommandType = CommandType.StoredProcedure;   /// INDICO QUE SE TRATA DE UN PROCEDIMIENTO ALMACENADO
            sqlCommand.CommandText = nombreProcedimientoAlmacenado; /// INDICO EL NOMBRE DEL PROCEDIMIENTO ALMACENADO
            FilasCambiadas = sqlCommand.ExecuteNonQuery();          /// EJECUTO EL PROCEDIMIENTO ALMACENADO
            Conexion.Close();
            return FilasCambiadas;
        }

        public DataTable EjecutarConsulta(SqlCommand comandoSQL, string nombreProcedimientoAlmacenado)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand sqlCommand = comandoSQL;
            sqlCommand.Connection = conexion;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = nombreProcedimientoAlmacenado;

            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
            DataTable tablaResultado = new DataTable();
            adapter.Fill(tablaResultado);

            conexion.Close();
            return tablaResultado;
        }

        public Usuario EjecutarReaderUsuario(SqlCommand comandoSQL, string nombreSP)
        {
            Usuario usuario = null;

            using (SqlConnection conn = new SqlConnection(cadenaConexion))
            {
                conn.Open();
                comandoSQL.Connection = conn;
                comandoSQL.CommandType = CommandType.StoredProcedure;
                comandoSQL.CommandText = nombreSP;

                using (SqlDataReader reader = comandoSQL.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        usuario = new Usuario(
                            Convert.ToInt32(reader["IDUsuario_U"]),
                            reader["NombreUsuario_U"].ToString(),
                            reader["Contraseña_U"].ToString(),
                            reader["Email_U"].ToString(),
                            Convert.ToInt32(reader["IdTipoUsuario_U"])
                        );
                    }
                }
            }

            return usuario;
        }

        public Boolean existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }

            Conexion.Close();

            return estado;
        }
    


    }
}
