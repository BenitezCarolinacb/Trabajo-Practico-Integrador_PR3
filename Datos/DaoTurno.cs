using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurno
    {
        Conexion conexion = new Conexion();
    
        public DataTable ObtenerTurno()
        {

            string consultaSQL = @"SELECT IDTurno_TUR, LegajoMedico_TUR, Fecha_TUR, Hora_TUR, DNIPaciente_TUR, Observaciones_TUR, Estado_TUR FROM Turnos";
            Conexion conexion = new Conexion();
            return conexion.ObtenerTablas(consultaSQL, "Turnos");
        }
        public DataTable ObtenerTurnoFiltrado(string filtro)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@LegajoFiltro", filtro);

            return conexion.EjecutarConsulta(cmd, "SP_BuscarTurnoPorLegajo");
        }

        public DataTable ObtenerTurnoFiltradoConDNI(string dni)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@dniFiltro", dni);

            return conexion.EjecutarConsulta(cmd, "SP_BuscarTurnoPorDNIPaciente");
        }

        public bool ActualizarObservacionEstado(int idTurno, string nuevaObs, string nuevoEstado)
        {
            
        string sql = @"UPDATE Turnos SET Observaciones_TUR = @Obs,Estado_TUR = @Estado WHERE IDTurno_TUR = @Id";
        SqlCommand cmd = new SqlCommand(sql);
        cmd.Parameters.AddWithValue("@Obs", nuevaObs);
        cmd.Parameters.AddWithValue("@Estado", nuevoEstado);
        cmd.Parameters.AddWithValue("@Id", idTurno);

        int filas = conexion.ejecutarTransaccion(cmd);
        return filas > 0;
            
            
        }

        public DataTable ObtenerTurnoPorMedico(string legajoMedico)
        {
            string consultaSQL = $"SELECT * FROM Turnos WHERE LegajoMedico_TUR = '{legajoMedico}'";
            return conexion.ObtenerTablas(consultaSQL, "Turnos");
        }
        public string ObtenerLegajoLogin(string usuario, string pass)
        {
            using (SqlConnection con = conexion.ObtenerConexion())
            {
                string consulta = @"SELECT M.Legajo_MED FROM Usuarios U INNER JOIN Medicos M ON M.UsuarioMedico_MED = U.NombreUsuario_U WHERE U.NombreUsuario_U = @USUARIO AND U.Contraseña_U = @PASS";

                using (SqlCommand cmd = new SqlCommand(consulta, con))
                {
                    cmd.Parameters.AddWithValue("@USUARIO", usuario);
                    cmd.Parameters.AddWithValue("@PASS", pass);

                    object resultado = cmd.ExecuteScalar();
                    return resultado != null ? resultado.ToString() : null;
                }
            }
        }

        public bool InsertarTurno(string legajo, string dni, string dia, string hora, int especialidad)
        {
            SqlConnection con = conexion.ObtenerConexion(); 
            SqlCommand cmd = new SqlCommand("INSERT INTO Turnos (LegajoMedico_TUR, DNIPaciente_TUR, Fecha_TUR, Hora_TUR, Id_Especialidad_TUR) VALUES (@legajo, @dni, @dia, @hora, @especialidad)", con);

            cmd.Parameters.AddWithValue("@legajo", legajo);
            cmd.Parameters.AddWithValue("@dni", dni);
            cmd.Parameters.AddWithValue("@dia", dia);
            cmd.Parameters.AddWithValue("@hora", hora);
            cmd.Parameters.AddWithValue("@especialidad", especialidad);

            int filasAfectadas = cmd.ExecuteNonQuery();
            con.Close();

            return filasAfectadas > 0;
        }

        public bool ExisteTurnoMedico(string legajo, string dia, string hora)
        {
            SqlConnection con = conexion.ObtenerConexion();
            string consulta = @"SELECT COUNT(*) FROM Turnos 
                        WHERE LegajoMedico_TUR = @legajo AND Fecha_TUR = @dia AND Hora_TUR = @hora";

            SqlCommand cmd = new SqlCommand(consulta, con);
            cmd.Parameters.AddWithValue("@legajo", legajo);
            cmd.Parameters.AddWithValue("@dia", dia);
            cmd.Parameters.AddWithValue("@hora", hora);

            int total = (int)cmd.ExecuteScalar();
            return total > 0;
        }

        public DataTable ObtenerPorcentajePresentismo()
        {
            string consulta = @"SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Turnos) AS Porcentaje FROM Turnos WHERE Estado_TUR = 'Presente' ";


            return conexion.ObtenerTablas(consulta, "PorcentajeTurnosPresentes");
        }

        public DataTable ObtenerPorcentajeAusentismo()
        {
            string consulta = @"SELECT COUNT(*) * 100.0 / NULLIF((SELECT COUNT(*) FROM Turnos WHERE Estado_TUR IS NOT NULL), 0) AS PorcentajeAusente FROM Turnos WHERE Estado_TUR = 'Ausente';";
            return conexion.ObtenerTablas(consulta, "PorcentajeTurnosAusentes");
        }



    }
}
