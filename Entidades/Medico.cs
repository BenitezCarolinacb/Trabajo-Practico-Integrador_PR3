using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico
    {
     
        public string Legajo { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Genero { get; set; }
        public int IDNacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public int IDEspecialidad { get; set; }
        public int IDLocalidad { get; set; }
        public string Usuario { get; set; }
        public int IDProvincia { get; set; }
        public bool Estado { get; set; }

        public Medico() { }

        public Medico(string legajo, string dni, string nombre, string apellido, string genero, DateTime fechaNacimiento, string direccion, string telefono)       
        {
            Legajo = legajo;
            DNI = dni;
            Nombre = nombre;
            Apellido = apellido;
            Genero = genero;
            FechaNacimiento = fechaNacimiento;
            Direccion = direccion;
            Telefono = telefono;
            
        }
    }
}
