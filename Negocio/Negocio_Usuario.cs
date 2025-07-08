using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class Negocio_Usuario
    {
        DaoUsuario daousuario = new DaoUsuario();
       public Usuario NegocioObtenerUsuario(string nombre, string contraseña)
        {
            return daousuario.ObtenerUsuario(nombre, contraseña);
        }

        public bool AgregarUsuario(Usuario usuario)
        {
            if (daousuario.ExisteUsuario(usuario.Nombre))
            {
                return false; 
            }
            int filasAfectadas = daousuario.AgregarUsuario(usuario);

            return filasAfectadas > 0;
        }

        public bool CambiarContraseña(string usuario, string nuevaClave)
        {
            int filas = daousuario.ActualizarContraseña(usuario, nuevaClave);
            return filas >= 0;
        }

        public bool existeUsuario(string nombreUsuario)
        {
            return daousuario.ExisteUsuario(nombreUsuario);
        }

        public bool ExisteUnMail(string mail)
        {
            return daousuario.ExisteMail(mail);
        }

        public bool existeNombreUsuario(string usuario)
        {
            return daousuario.existeNombreUsuario(usuario);
        }

        public bool ModificarUsuarioPorNombre(string usuarioActual, Usuario user)
        {
            return daousuario.ModificarUsuarioPorNombre(usuarioActual, user);
        }


    }
}
