using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;
using web_api_1.Models;
namespace web_api_1.Controllers{
    [Route("api/[controller]")]
    public class EmpleadosController : Controller{
        private Conexion dbConexion;
        public EmpleadosController(){
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public ActionResult Get(){
            return Ok(dbConexion.Empleados.ToArray());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult>Get(int id){
            var empleados = await dbConexion.Empleados.FindAsync(id);
            if (empleados != null)
            {
                return Ok(empleados);
            }else
            {
                return NotFound();
            } 
        }

        [HttpPost]
        public async Task<ActionResult>Post([FromBody] Empleados empleados){
            if (ModelState.IsValid)
            {
                dbConexion.Empleados.Add(empleados);
                await dbConexion.SaveChangesAsync();
                return Ok();
            }else
            {
                return BadRequest();
            }
        }

        public async Task<ActionResult> Put([FromBody] Empleados empleados){
            var v_empleados = dbConexion.Empleados.SingleOrDefault(a => a.id_empleado == clientes.id_empleado);
            if (v_empleados != null && ModelState.IsValid){
               dbConexion.Entry(v_empleados).CurrentValues.SetValues(empleados); 
               await dbConexion.SaveChangesAsync();
               return Ok();
            }else
            {
               return BadRequest(); 
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult>Delete(int id){
            var clientes = dbConexion.Empleados.SingleOrDefault(a => a.id_empleado == id);
            if (empleados != null)
            {
                dbConexion.Empleados.Remove(empleados);
                await dbConexion.SaveChangesAsync();
                return Ok();
            }else
            {
                return BadRequest();
            }
        }
    }
}
