using Datos;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class Negocio_Medico
    {
        DaoMedico datos = new DaoMedico();
        public DataTable ObtenerTablaMedico()
        {
            return datos.ObtenerMedicos();
        }

        public DataTable ObtenerTablaMedicoActivos()
        {
            return datos.ObtenerMedicosActivos();
        }

        public bool ActualizarMedico(Medico medico)
        {
            return datos.ActualizarMedico(medico);
        }

        public bool EliminarMedico(string legajo)
        {
            int filasEliminadas = datos.EliminarMedico(legajo);
            return filasEliminadas > 0;
        }

        public DataTable ObtenerMedicoFiltrados(string filtro)
        {
            return datos.ObtenerMedicoFiltrado(filtro);
        }

        public void AltaMedico(Medico medico) 
        {
            datos.AltaMedico(medico);
        }

        public bool ExisteLegajo(string legajo)
        {
            return datos.ExisteLegajo(legajo);
        }

        public bool ExisteMedico(string dni)
        {
            return datos.ExisteDNI(dni);
        }
        public bool existeDNI(string dni)
        {
            DaoMedico dao = new DaoMedico();
            return dao.ExisteDNI(dni);
        }

        public DataTable ObtenerTablaDatosPersonales(string usuarioMedico)
        {
            return datos.ObtenerDatosPersonales(usuarioMedico);
        }

        public SqlDataReader ObtenerMedicosPorEspecialidad(int idEspecialidad)
        {
            return datos.ObtenerMedicosEspecialidad(idEspecialidad);
        }
        public SqlDataReader ObtenerDias(string legajo)
        {
            return datos.ObtenerDias(legajo);
        }
        public SqlDataReader ObtenerLegajos()
        {
            return datos.ObtenerLegajos(); 
        }
        public SqlDataReader ObtenerHorarios(string legajo, string dia)
        {
            return datos.ObtenerHorarios(legajo, dia);
        }

        public bool ExisteMedicoConEspecialidad(int idEspecialidad)
        {
            return datos.ExisteMedicoConEspecialidad(idEspecialidad);
        }

        public DataTable NegocioMedicosFiltrados(string dni)
        {
            return datos.MedicosFiltradosConDNI(dni);
        }

        public bool ExisteNombreMedico(string nombre)
        {
            return datos.ExisteNombreMedico(nombre);
        }

        public bool ExisteApellidoMedico(string apellido)
        {
            return datos.ExisteApellido(apellido);
        }


    }
}
