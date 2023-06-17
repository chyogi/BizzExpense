using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BizzExpense.Controllers
{
    [AllowAnonymous]
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly ILoginRepository _loginRepository;
        public LoginController(ILoginRepository loginRepository)
        {
            _loginRepository = loginRepository;
        }
        // GET: api/<LoginController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok();
        }

        // POST api/<LoginController>
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest loginRequest)
        {
            var loginResponse = _loginRepository.Login(loginRequest);
            if (loginResponse == null) { return NotFound(); }

            return Ok(loginResponse);
        }

        [HttpPost("logout")]
        public IActionResult LogOut()
        {
            return NoContent();
        }

        [HttpPost("[action]/")]
        public IActionResult Register([FromBody] RegisterDto registerDto)
        {
            _loginRepository.RegisterUser(registerDto);
            return CreatedAtAction("Get", new { id = registerDto.LogInId }, registerDto);
        }

        // POST api/<LoginController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        // PUT api/<LoginController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<LoginController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
