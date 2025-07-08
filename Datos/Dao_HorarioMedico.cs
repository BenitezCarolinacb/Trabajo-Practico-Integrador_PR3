using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Dao_HorarioMedico
    {
        Conexion conexion = new Conexion();
        public bool InsertarTurno(string legajo, string dia, string hora)
        {
            SqlConnection con = conexion.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("INSERT INTO Horarios_Medicos (LegajoMedico_H, Dias, Horario) VALUES (@legajo, @dia, @hora)", con);

            cmd.Parameters.AddWithValue("@legajo", legajo);
            cmd.Parameters.AddWithValue("@dia", dia);
            cmd.Parameters.AddWithValue("@hora", hora);
            
            int filasAfectadas = cmd.ExecuteNonQuery();
            con.Close();

            return filasAfectadas > 0;
        }

        public bool ExisteHorario(string legajo, string dia, string hora)
        {
            SqlConnection con = conexion.ObtenerConexion();
            string consulta = "SELECT COUNT(*) FROM Horarios_Medicos WHERE LegajoMedico_H = @legajo AND Dias = @dia AND Horario = @hora";

             SqlCommand cmd = new SqlCommand(consulta, con);
            cmd.Parameters.AddWithValue("@legajo", legajo);
            cmd.Parameters.AddWithValue("@dia", dia);
            cmd.Parameters.AddWithValue("@hora", hora);

            int cantidad = (int)cmd.ExecuteScalar();
            return cantidad > 0;
        }


    }
}
