using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;


namespace Negocio
{
    public class Negocio_Nacionalidad
    {
        DaoNacionalidades dao = new DaoNacionalidades();
        public DataTable ObtenerNacionalidades()
        {
            return dao.ObtenerTodaslasNacionalidades();
        }
    }
}