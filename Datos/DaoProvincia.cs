using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Datos
{
    public class DaoProvincia
    {

        Conexion conexion = new Conexion();
        public DataTable ObtenerTodasLasProvincias()
        {
            string consultaSQL = "SELECT * FROM Provincias_P";
            return conexion.ObtenerTablas(consultaSQL, "Provincias_P");
        }

    }
}
