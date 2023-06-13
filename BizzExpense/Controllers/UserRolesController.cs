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

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var userRole = _userRoleRepository.GetUserRole(id);
            if (userRole == null) { return NotFound(); }

            return Ok(userRole);
        }

        // GET: api/<UserRolesController>
        [HttpGet("[action]/{userId}")]
        public IActionResult userRolesByUserId(int userId)
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
        [HttpPost]
        public IActionResult Post([FromBody] UserRole userRole)
        {
            _userRoleRepository.AddUserRole(userRole);
            return CreatedAtAction("Get", new { id = userRole.UserRoleId }, userRole);
        }

        // PUT api/<UserRolesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserRole userRole)
        {
            if (id != userRole.UserRoleId)
            {
                return BadRequest();
            }
            _userRoleRepository.UpdateUserRole(userRole);

            return Ok(userRole);
        }

        // DELETE api/<UserRolesController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _userRoleRepository.DeleteUserRole(id);
            return NoContent();
        }
    }
}
