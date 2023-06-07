using Azure.Core;
using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BizzExpense.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExpensesController : ControllerBase
    {
        private readonly IExpenseRepository _expenseRepository;
        public ExpensesController(IExpenseRepository expenseRepository)
        {
            _expenseRepository = expenseRepository;
        }

        // GET: api/<ExpensesController>
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var expense = _expenseRepository.GetExpense(id);
            if (expense == null) { return NotFound(); }

            return Ok(expense);
        }

        // GET api/<ExpensesController>/5
        [HttpGet("[action]/{userId}")]
        public IActionResult GetExpensesByUser(int userId)
        {
            var userExpenses = _expenseRepository.GetExpenses(userId);
            if (userExpenses == null) { return NotFound(); }

            return Ok(userExpenses);
        }

        // POST api/<ExpensesController>
        [HttpPost]
        public IActionResult Post([FromBody] AddExpenseDto addExpenseDto)
        {
            _expenseRepository.AddExpense(addExpenseDto);
            return CreatedAtAction("Get", new { id = addExpenseDto.expense.ExpenseId }, addExpenseDto);
        }

        // PUT api/<ExpensesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Expense expense)
        {
            if (id != expense.ExpenseId)
            {
                return BadRequest();
            }

            _expenseRepository.UpdateExpense(expense);

            return Ok();
        }

        // PUT api/<ExpensesController>/5
        [HttpPut("[action]/{id}")]
        public IActionResult UpdateExpenseStatus(int id, [FromBody] ApprovalStatus approvalStatus)
        {
            if (id != approvalStatus.ExpenseId)
            {
                return BadRequest();
            }

            _expenseRepository.UpdateExpenseStatus(approvalStatus);

            return Ok();
        }

        // DELETE api/<ExpensesController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _expenseRepository.DeleteExpense(id);
            return NoContent();
        }
    }
}
