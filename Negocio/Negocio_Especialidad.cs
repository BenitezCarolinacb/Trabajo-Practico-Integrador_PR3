using Datos;
using System.Data;


namespace Negocio
{
    public class Negocio_Especialidad
    {
        DaoEspecialidad dao = new DaoEspecialidad();
        public DataTable ObtenerEspecialidades()
        {
            return dao.ObtenerTodaslasEspecialidades();
        }

       
    }
}
