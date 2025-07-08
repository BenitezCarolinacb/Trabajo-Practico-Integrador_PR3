using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entidades
{
    public class Horarios_Medicos
    {
        public string LegajoMedico_H { get; set; }
        public string Dias { get; set; }
        public TimeSpan Horario { get; set; }
        // Constructor vacío
        public Horarios_Medicos() { }

        // Constructor con parámetros
        public Horarios_Medicos(string legajoMedico, string dias, TimeSpan horario)
        {
            LegajoMedico_H = legajoMedico;
            Dias = dias;
            Horario = horario;
        }
    }
}
