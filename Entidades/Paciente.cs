using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente
    {
        private string nombrePaciente;

        public string DNI { get; set; }
        public int IDLocalidad { get; set; }
        public int IDNacionalidad { get; set; }
        public string Genero { get; set; }
        public string Email { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public bool Estado { get; set; }
        public int VidLocalidad { get; }
        public int IdProvincia { get; set; }

        public Paciente() { } // Constructor vacío


        public Paciente(int idLocalidad)
        {
            idLocalidad = IDLocalidad;
        }

        public Paciente(int idLocalidad, string nombrePaciente) : this(idLocalidad)
        {
            this.nombrePaciente = nombrePaciente;
        }

        public Paciente(string dni, string nombre, string apellido, string direccion, string telefono, string email, string genero, DateTime fechaNacimiento, bool estado)
        {
            DNI = dni;
            Nombre = nombre;
            Apellido = apellido;
            Direccion = direccion;
            Telefono = telefono;
            Email = email;
            Genero = genero;
            FechaNacimiento = fechaNacimiento;
            Estado = estado;
        }
    }
}
