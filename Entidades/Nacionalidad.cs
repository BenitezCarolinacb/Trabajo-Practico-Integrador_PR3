using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Nacionalidad
    {
        public int IDNacionalidad_NA { get; set; }
        public string Cod_Nacionalidad_NA { get; set; }
        public string DescripcionNacionalidad_NA { get; set; }

        public Nacionalidad() { }

        public Nacionalidad(int id, string cod, string descripcion)
        {
            IDNacionalidad_NA = id;
            Cod_Nacionalidad_NA = cod;
            DescripcionNacionalidad_NA = descripcion;
        }
    }
}
