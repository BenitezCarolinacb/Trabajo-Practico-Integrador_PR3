using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class Negocio_HorarioMedico
    {
        Dao_HorarioMedico datos = new Dao_HorarioMedico();
       
        public bool AsignarHorario(string legajo, string dia, string hora)
        {
            if (!datos.ExisteHorario(legajo, dia, hora))
            {
                return datos.InsertarTurno(legajo, dia, hora);
            }
            return false;
        }

    }
}
