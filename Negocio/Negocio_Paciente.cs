using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Datos;
using Entidades;


namespace Negocio
{
    public class Negocio_Paciente
    {

        DaoPaciente daoPaciente = new DaoPaciente();

        public DataTable ObtenerPacientes()
        {
            return daoPaciente.ObtenerPacientes();
        }

        public bool ActualizarPaciente(Paciente paciente)
        {
            return daoPaciente.ActualizarPaciente(paciente);
        }

        public bool EliminarPaciente(string dni)
        {
            int filasEliminadas = daoPaciente.EliminarPaciente(dni);
            return filasEliminadas > 0;
        }

        public DataTable NegocioPacientesFiltrados(string filtro, string Legajo)
        {           
            return daoPaciente.ObtenerPacientesFiltrados(filtro,Legajo); 
        }

        public DataTable NegocioPacientesFiltradosDNI(string filtro)
        {
            return daoPaciente.ObtenerPacientesFiltradosDNI(filtro);
        }


        public DataTable NegocioPacientesFiltradosNombre(string nombre)
        {
            return daoPaciente.ObtenerPacientesFiltradosConNombre(nombre);
        }
        public void AltaPaciente(Paciente nuevo)
        {
            daoPaciente.AltaPaciente(nuevo);
        }

        public bool ExisteUnMailPaciente(string mail)
        {
            return daoPaciente.ExisteUnMailPaciente(mail);
        }
        public bool existeDNIPaciente(string dni)
        {
            return daoPaciente.ExisteDNIpaciente(dni);
        }


        public bool ExisteNombreMedico(string nombre)
        {
            return daoPaciente.ExisteNombrePaciente(nombre);
        }

        public bool ExisteApellidoMedico(string apellido)
        {
            return daoPaciente.ExisteApellidoPaciente(apellido);
        }


    }
}
