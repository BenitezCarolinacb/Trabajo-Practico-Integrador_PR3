using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Runtime.Remoting.Messaging;

namespace Datos
{
    public class DaoEspecialidad
    {
        Conexion conexion = new Conexion();
        public DataTable ObtenerTodaslasEspecialidades()
        {
            string consultaSQL = "SELECT IDEspecialidades_ES, DescripcionEspecialidad_ES FROM Especialidades";
            return conexion.ObtenerTablas(consultaSQL, "Especialidades");
        }


    }
}
