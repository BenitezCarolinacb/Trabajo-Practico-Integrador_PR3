using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Datos
{
    public class DaoLocalidad
    {
        Conexion conexion = new Conexion();
        public DataTable ObteneraunaLocalidad(int idProvincia)
        {
            string consulta = "SELECT * FROM Localidades WHERE IDProvincia_L = " + idProvincia;
            return conexion.ObtenerTablas(consulta, "Localidades");
        }
    }
}