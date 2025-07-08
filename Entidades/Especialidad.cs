using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entidades
{
    
        namespace Entidades
        {
            public class Especialidad
            {
                public int IDEspecialidades_ES { get; set; }
                public string DescripcionEspecialidad_ES { get; set; }

                // Constructor vacío
                public Especialidad() { }

                // Constructor con parámetros
                public Especialidad(int id, string descripcion)
                {
                    IDEspecialidades_ES = id;
                    DescripcionEspecialidad_ES = descripcion;
                }
            }
        }
    
}