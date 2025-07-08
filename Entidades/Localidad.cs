using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entidades
{
    public class Localidad
    {
        public int IDLocalidad_L { get; set; }
        public int IDProvincia_L { get; set; }
        public string Nombre_Localidad_L { get; set; }

        public Provincia Provincia { get; set; }

        // Constructor vacío

        public Localidad() { }
        // Constructor con parametros
        public Localidad(int id, int idProvincia, string nombre)
        {
            IDLocalidad_L = id;
            IDProvincia_L = idProvincia;
            Nombre_Localidad_L = nombre;
        }
    }
}
