using System.ComponentModel.DataAnnotations;
namespace web_api_1.Models{
    public class Empleados{
        [Key]
        public int id_empleado{get; set;}
        public string nombre{get; set;}
        public string apellido{get; set;}
        public string direccion{get; set;}
        public string telefono{get; set;}
        public string id_puesto{get; set;}
        public string dpi{get; set;}
        public string fecha_nacimiento{get; set;}
        public string fecha_ingreso{get; set;}
    }
}