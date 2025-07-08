using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Contraseña { get; set; }
        public string Mail { get; set; }
        public int TipoUsuario { get; set; }


        public Usuario(int id, string nombre, string contraseña, string mail, int tipoUsuario)
        {
            ID = id;
            Nombre = nombre;
            Contraseña = contraseña;
            Mail = mail;
            TipoUsuario = tipoUsuario;
        }

        public Usuario()
        {
        }

        
    }
}
