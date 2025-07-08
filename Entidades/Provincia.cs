using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincia
    {
        public int ID_Provincia_P { get; set; }
        public string NombreProvincia_P { get; set; }
        public string CodProvincia_P { get; set; }
        // Constructor vacío
        public Provincia() { }
        // Constructor con parámetros

        public Provincia(int id, string nombre, string codigo)
        {
            ID_Provincia_P = id;
            NombreProvincia_P = nombre;
            CodProvincia_P = codigo;
        }
    }
}
