using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace Negocio
{
    public class Negocio_Localidad
    {
        DaoLocalidad dao = new DaoLocalidad();
        public DataTable ObtenerLocalidad(int idProv)
        {
            return dao.ObteneraunaLocalidad(idProv);
        }


    }
}
