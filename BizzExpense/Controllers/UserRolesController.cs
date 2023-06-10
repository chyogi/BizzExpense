using BizzExpense.Models;
using BizzExpense.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BizzExpense.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserRolesController : ControllerBase
    {
        private readonly IUserRoleRepository _userRoleRepository;
        public UserRolesController(IUserRoleRepository userRoleRepository)
        {
                _userRoleRepository = userRoleRepository;
        }
        // GET: api/<UserRolesController>
        [HttpGet("{userId}")]
        public IActionResult Get(int userId)
        {
            var userRoles = _userRoleRepository.GetUserRoles(userId);
            if (userRoles == null) { return NotFound(); }

            return Ok(userRoles);
        }

        // GET: api/<UserRolesController>
        [HttpGet("[action]/")]
        public IActionResult AllRoleTypes()
        {
            var userRoleTypes = _userRoleRepository.GetAllRoleTypes();
            if (userRoleTypes == null) { return NotFound(); }

            return Ok(userRoleTypes);
        }

        // GET api/<UserRolesController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<UserRolesController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        // PUT api/<UserRolesController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
    }

        // DELETE api/<UserRolesController>/5
    //    [HttpDelete("{id}")]
    //    public void Delete(int id)
    //    {
    //    }
    //}
}
