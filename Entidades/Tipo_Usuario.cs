using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Tipo_Usuarios
    {
        public int IDTipoUsuario_T { get; set; }
        public string Rol_T { get; set; }

        // Constructor vacío
        public Tipo_Usuarios() { }

        // Constructor con parámetros
        public Tipo_Usuarios(int id, string rol)
        {
            IDTipoUsuario_T = id;
            Rol_T = rol;
        }
    }
}
