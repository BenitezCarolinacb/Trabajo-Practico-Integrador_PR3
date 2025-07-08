using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Datos
{

    public class DaoNacionalidades
    {
        Conexion conexion = new Conexion();
        public DataTable ObtenerTodaslasNacionalidades()
        {
            string consultaSQL = "SELECT IDNacionalidad_NA, Cod_Nacionalidad_NA FROM Nacionalidad";
            return conexion.ObtenerTablas(consultaSQL, "Nacionalidad");
        }
    }
}
