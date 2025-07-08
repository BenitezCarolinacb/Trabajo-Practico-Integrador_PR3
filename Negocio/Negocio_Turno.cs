using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class Negocio_Turno
    {
        DaoTurno datos = new DaoTurno();

        public DataTable ObtenerTurno()
        {
            return datos.ObtenerTurno();
        }
        public DataTable ObtenerTurnoFiltrados(string filtro)
        {

            return datos.ObtenerTurnoFiltrado(filtro);
        }

        public DataTable ObtenerTurnoFiltradosDNI(string dni)
        {

            return datos.ObtenerTurnoFiltradoConDNI(dni);
        }
        public bool ActualizarObservacionEstado(int idTurno, string nuevaObs, string nuevoEstado)
        {
            return datos.ActualizarObservacionEstado(idTurno, nuevaObs, nuevoEstado);
        }


        public DataTable ObtenerTurno(string legajoMedico)
        {
            return datos.ObtenerTurnoPorMedico(legajoMedico);
        }
        public string ObtenerLegajo(string user, string pass)
        {
            return datos.ObtenerLegajoLogin(user, pass);
        }

        public bool AsignarTurno(string legajo, string dni, string dia, string hora, int especialidad)
        {
            if (!datos.ExisteTurnoMedico(legajo, dia, hora))
            {
                return datos.InsertarTurno(legajo, dni, dia, hora, especialidad);
            }
            return false;
        }
      
      
        public DataTable ObtenerPorcentajeTurnosPresentes()
        {
            return datos.ObtenerPorcentajePresentismo();
        }
        public DataTable ObtenerPorcentajeTurnosAusentes()
        {
            return datos.ObtenerPorcentajeAusentismo();
        }


    }
}
