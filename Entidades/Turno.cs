using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        public int IDTurno { get; set; }
        public string LegajoMedico { get; set; } 
        public DateTime Fecha { get; set; }      
        public TimeSpan Hora { get; set; }      
        public string DNIPaciente { get; set; } 
        public string Observaciones { get; set; }
        public bool? Estado { get; set; } 

        public int IdEspecialidad { get; set; }

        public Turno() { } 

        public Turno(int idTurno, string legajoMedico, DateTime fecha, TimeSpan hora, string dniPaciente, string observaciones = "No hay observaciones", bool? estado = null)
        {
            IDTurno = idTurno;
            LegajoMedico = legajoMedico;
            Fecha = fecha;
            Hora = hora;
            DNIPaciente = dniPaciente;
            Observaciones = observaciones;
            Estado = estado;
            
        }
    }
}
