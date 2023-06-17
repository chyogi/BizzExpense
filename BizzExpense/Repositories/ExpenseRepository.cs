using Azure.Core;
using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Utils;
using Microsoft.Data.SqlClient;

namespace BizzExpense.Repositories
{
    public class ExpenseRepository : BaseRepository, IExpenseRepository
    {
        public ExpenseRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public void AddExpense(AddExpenseDto addExpenseDto)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {

                    cmd.CommandText = @"
                                        INSERT INTO [dbo].[Expenses]
                                                   ([ExpenseTypeId]
                                                   ,[ExpenseSubTypeId]
                                                   ,[ExpenseAmount]
                                                   ,[SubmittedByUserId]
                                                   ,[CreateTS]
                                                   ,[CreatedBy]
                                                   ,[UpdateTS]
                                                   ,[UpdatedBy])
                                        OUTPUT INSERTED.ExpenseId 
                                             VALUES
                                                   (@ExpenseTypeId
                                                   ,@ExpenseSubTypeId
                                                   ,@ExpenseAmount
                                                   ,@SubmittedByUserId
                                                   ,@CreateTS
                                                   ,@CreatedBy
                                                   ,@UpdateTS
                                                   ,@UpdatedBy)
                                        ";

                    DbUtils.AddParameter(cmd, "@ExpenseTypeId", addExpenseDto.expense.ExpenseTypeId);
                    DbUtils.AddParameter(cmd, "@ExpenseSubTypeId", addExpenseDto.expense.ExpenseSubTypeID);
                    DbUtils.AddParameter(cmd, "@ExpenseAmount", addExpenseDto.expense.ExpenseAmount);
                    DbUtils.AddParameter(cmd, "@SubmittedByUserId", addExpenseDto.expense.SubmittedByUserId);
                    DbUtils.AddParameter(cmd, "@CreateTS", addExpenseDto.expense.CreateTS);
                    DbUtils.AddParameter(cmd, "@CreatedBy", addExpenseDto.expense.CreatedBy);
                    DbUtils.AddParameter(cmd, "@UpdateTS", addExpenseDto.expense.UpdateTS);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", addExpenseDto.expense.UpdatedBy);

                    addExpenseDto.expense.ExpenseId = (int)cmd.ExecuteScalar();
                    addExpenseDto.approvalStatus.ExpenseId = addExpenseDto.expense.ExpenseId;
                }

                using (var cmd = conn.CreateCommand())
                {

                    cmd.CommandText = @"
                                        INSERT INTO [dbo].[ApprovalStatus]
                                                    ([ExpenseId]
                                                    ,[StatusId]
                                                    ,[Comments]
                                                    ,[ApproverId]
                                                    ,[CreateTS]
                                                    ,[CreatedBy]
                                                    ,[UpdateTS]
                                                    ,[UpdatedBy])
                                        OUTPUT INSERTED.[ApprovalStatusId] 
                                             VALUES
                                                   (@ExpenseId
                                                   ,@StatusId
                                                   ,@Comments
                                                   ,@ApproverId
                                                   ,@CreateTS
                                                   ,@CreatedBy
                                                   ,@UpdateTS
                                                   ,@UpdatedBy)
                                        ";

                    DbUtils.AddParameter(cmd, "@ExpenseId", addExpenseDto.approvalStatus.ExpenseId);
                    DbUtils.AddParameter(cmd, "@StatusId", addExpenseDto.approvalStatus.StatusId);
                    DbUtils.AddParameter(cmd, "@Comments", addExpenseDto.approvalStatus.Comments);
                    DbUtils.AddParameter(cmd, "@ApproverId", addExpenseDto.approvalStatus.ApproverId);
                    DbUtils.AddParameter(cmd, "@CreateTS", addExpenseDto.approvalStatus.CreateTS);
                    DbUtils.AddParameter(cmd, "@CreatedBy", addExpenseDto.approvalStatus.CreatedBy);
                    DbUtils.AddParameter(cmd, "@UpdateTS", addExpenseDto.approvalStatus.UpdateTS);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", addExpenseDto.approvalStatus.UpdatedBy);

                    addExpenseDto.approvalStatus.ApprovalStatusId = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void DeleteExpense(int expenseId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        DELETE FROM [dbo].[ApprovalStatus]
                                         WHERE 
                                              [ExpenseId] = @ExpenseId
                                      "
                    ;

                    DbUtils.AddParameter(cmd, "@ExpenseId", expenseId);

                    cmd.ExecuteNonQuery();
                }

                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        DELETE FROM [dbo].[Expenses]
                                         WHERE 
                                              [ExpenseId] = @ExpenseId
                                      "
                    ;

                    DbUtils.AddParameter(cmd, "@ExpenseId", expenseId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public IList<ExpenseDto> GetExpenses(int userId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT e1.[ExpenseId]
                                        ,e1.[ExpenseTypeId]
                                        ,etr1.[ExpenseTypeDescription]
                                        ,e1.[ExpenseSubTypeId]
                                        ,estr1.[ExpenseSubTypeDescription]
                                        ,E1.[ExpenseAmount]
                                        ,e1.[SubmittedByUserId]
                                        ,e1.[CreateTS] as [ExpenseCreatedTS]
                                        ,e1.[CreatedBy] as [ExpenseCreatedBy]
                                        ,e1.[UpdateTS] as [ExpenseUpdatedTS]
                                        ,e1.[UpdatedBy] as [ExpenseUpdatedBy]
                                        ,as1.[ApprovalStatusId]
                                        ,as1.[StatusId]
                                        ,sr1.[StatusDescription]
                                        ,as1.[Comments]
                                        ,as1.[ApproverId]
                                        ,as1.[CreateTS] as [ApprovalCreatedTS]
                                        ,as1.[CreatedBy] as [ApprovalCreatedBy]
                                        ,as1.[UpdateTS] as [ApprovalUpdatedTS]
                                        ,as1.[UpdatedBy] as [ApprovalUpdatedBy]

                                        FROM [dbo].[Expenses] e1
                                        INNER JOIN [dbo].[Users] u1 on u1.UserId = e1.SubmittedByUserId
                                        INNER JOIN [dbo].[ApprovalStatus] as1 on as1.ExpenseId = e1.ExpenseId
                                        INNER JOIN [dbo].[Users] u2 on u2.UserId = as1.ApproverId
                                        INNER JOIN [dbo].[StatusRef] sr1 on sr1.StatusRefId = as1.StatusId
                                        INNER JOIN [dbo].[ExpenseTypesRef] etr1 on etr1.ExpenseTypeRefId =e1.ExpenseTypeId
                                        LEFT JOIN [dbo].[ExpenseSubTypesRef] estr1 on estr1.ExpenseSubTypeRefId = e1.ExpenseSubTypeId 
                                                                                        and estr1.ExpenseTypeId = e1.ExpenseTypeId
                                        WHERE e1.[SubmittedByUserId]= @UserId
                                        ";

                    DbUtils.AddParameter(cmd, "@UserId", userId);

                    var reader = cmd.ExecuteReader();

                    IList<ExpenseDto> expenses = new List<ExpenseDto>();

                    while (reader.Read())
                    {
                        expenses.Add(new ExpenseDto()
                        {
                            ExpenseId = DbUtils.GetInt(reader, "ExpenseId"),
                            ExpenseTypeId = DbUtils.GetInt(reader, "ExpenseTypeId"),
                            ExpenseType = DbUtils.GetString(reader, "ExpenseTypeDescription"),
                            ExpenseSubTypeId = DbUtils.GetInt(reader, "ExpenseSubTypeId"),
                            ExpenseSubType = DbUtils.GetString(reader, "ExpenseSubTypeDescription"),
                            ExpenseAmount = DbUtils.GetNullableDecimal(reader, "ExpenseAmount"),
                            SubmittedByUserId = DbUtils.GetInt(reader, "SubmittedByUserId"),
                            ExpenseCreatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseCreatedTS"),
                            ExpenseCreatedByUserId = DbUtils.GetInt(reader, "ExpenseCreatedBy"),
                            ExpenseUpdatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseUpdatedTS"),
                            ExpenseUpdatedByUserId = DbUtils.GetInt(reader, "ExpenseUpdatedBy"),
                            ApprovalStatusId = DbUtils.GetInt(reader, "ApprovalStatusId"),
                            StatusId = DbUtils.GetInt(reader, "StatusId"),
                            StatusDescription = DbUtils.GetString(reader, "StatusDescription"),
                            Comments = DbUtils.GetString(reader, "Comments"),
                            ApproverId = DbUtils.GetInt(reader, "ApproverId"),
                            ApprovalCreatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalCreatedTS"),
                            ApprovalCreatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalCreatedBy"),
                            ApprovalUpdatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalUpdatedTS"),
                            ApprovalUpdatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalUpdatedBy"),
                        });

                    }
                    reader.Close();
                    return expenses;
                }
            }
        }

        public IList<ExpenseDto> GetExpensesByApprover(int approverId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT e1.[ExpenseId]
                                        ,e1.[ExpenseTypeId]
                                        ,etr1.[ExpenseTypeDescription]
                                        ,e1.[ExpenseSubTypeId]
                                        ,estr1.[ExpenseSubTypeDescription]
                                        ,E1.[ExpenseAmount]
                                        ,e1.[SubmittedByUserId]
                                        ,e1.[CreateTS] as [ExpenseCreatedTS]
                                        ,e1.[CreatedBy] as [ExpenseCreatedBy]
                                        ,e1.[UpdateTS] as [ExpenseUpdatedTS]
                                        ,e1.[UpdatedBy] as [ExpenseUpdatedBy]
                                        ,as1.[ApprovalStatusId]
                                        ,as1.[StatusId]
                                        ,sr1.[StatusDescription]
                                        ,as1.[Comments]
                                        ,as1.[ApproverId]
                                        ,as1.[CreateTS] as [ApprovalCreatedTS]
                                        ,as1.[CreatedBy] as [ApprovalCreatedBy]
                                        ,as1.[UpdateTS] as [ApprovalUpdatedTS]
                                        ,as1.[UpdatedBy] as [ApprovalUpdatedBy]

                                        FROM [dbo].[Expenses] e1
                                        INNER JOIN [dbo].[Users] u1 on u1.UserId = e1.SubmittedByUserId
                                        INNER JOIN [dbo].[ApprovalStatus] as1 on as1.ExpenseId = e1.ExpenseId
                                        INNER JOIN [dbo].[Users] u2 on u2.UserId = as1.ApproverId
                                        INNER JOIN [dbo].[StatusRef] sr1 on sr1.StatusRefId = as1.StatusId
                                        INNER JOIN [dbo].[ExpenseTypesRef] etr1 on etr1.ExpenseTypeRefId =e1.ExpenseTypeId
                                        LEFT JOIN [dbo].[ExpenseSubTypesRef] estr1 on estr1.ExpenseSubTypeRefId = e1.ExpenseSubTypeId 
                                                                                        and estr1.ExpenseTypeId = e1.ExpenseTypeId
                                        WHERE as1.[ApproverId]= @ApproverId
                                        ";

                    DbUtils.AddParameter(cmd, "@ApproverId", approverId);

                    var reader = cmd.ExecuteReader();

                    IList<ExpenseDto> expenses = new List<ExpenseDto>();

                    while (reader.Read())
                    {
                        expenses.Add(new ExpenseDto()
                        {
                            ExpenseId = DbUtils.GetInt(reader, "ExpenseId"),
                            ExpenseTypeId = DbUtils.GetInt(reader, "ExpenseTypeId"),
                            ExpenseType = DbUtils.GetString(reader, "ExpenseTypeDescription"),
                            ExpenseSubTypeId = DbUtils.GetInt(reader, "ExpenseSubTypeId"),
                            ExpenseSubType = DbUtils.GetString(reader, "ExpenseSubTypeDescription"),
                            ExpenseAmount = DbUtils.GetNullableDecimal(reader, "ExpenseAmount"),
                            SubmittedByUserId = DbUtils.GetInt(reader, "SubmittedByUserId"),
                            ExpenseCreatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseCreatedTS"),
                            ExpenseCreatedByUserId = DbUtils.GetNullableInt(reader, "ExpenseCreatedBy"),
                            ExpenseUpdatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseUpdatedTS"),
                            ExpenseUpdatedByUserId = DbUtils.GetNullableInt(reader, "ExpenseUpdatedBy"),
                            ApprovalStatusId = DbUtils.GetInt(reader, "ApprovalStatusId"),
                            StatusId = DbUtils.GetInt(reader, "StatusId"),
                            StatusDescription = DbUtils.GetString(reader, "StatusDescription"),
                            Comments = DbUtils.GetString(reader, "Comments"),
                            ApproverId = DbUtils.GetInt(reader, "ApproverId"),
                            ApprovalCreatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalCreatedTS"),
                            ApprovalCreatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalCreatedBy"),
                            ApprovalUpdatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalUpdatedTS"),
                            ApprovalUpdatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalUpdatedBy"),
                        });

                    }
                    reader.Close();
                    return expenses;
                }
            }
        }

        public IList<ExpenseTypeRef> GetAllExpenseTypes()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT [ExpenseTypeRefId]
                                              ,[ExpenseTypeDescription]
                                              ,[CreateTS]
                                              ,[CreatedBy]
                                              ,[UpdateTS]
                                              ,[UpdatedBy]
                                          FROM [dbo].[ExpenseTypesRef]
                                        ";

                    var reader = cmd.ExecuteReader();

                    IList<ExpenseTypeRef> expenseTypes = new List<ExpenseTypeRef>();

                    while (reader.Read())
                    {
                        expenseTypes.Add(new ExpenseTypeRef()
                        {
                            ExpenseTypeRefId = DbUtils.GetInt(reader, "ExpenseTypeRefId"),
                            ExpenseTypeDescription = DbUtils.GetString(reader, "ExpenseTypeDescription"),
                            CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
                            CreatedBy = DbUtils.GetNullableInt(reader, "CreatedBy"),
                            UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
                            UpdatedBy = DbUtils.GetNullableInt(reader, "UpdatedBy"),
                        });

                    }
                    reader.Close();
                    return expenseTypes;
                }
            }
        }

        public IList<ExpenseSubTypeRef> GetAllExpenseSubTypes()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT [ExpenseSubTypeRefId]
                                              ,[ExpenseTypeId]
                                              ,[ExpenseSubTypeDescription]
                                              ,[CreateTS]
                                              ,[CreatedBy]
                                              ,[UpdateTS]
                                              ,[UpdatedBy]
                                          FROM [dbo].[ExpenseSubTypesRef]
                                        ";

                    var reader = cmd.ExecuteReader();

                    IList<ExpenseSubTypeRef> expenseSubTypes = new List<ExpenseSubTypeRef>();

                    while (reader.Read())
                    {
                        expenseSubTypes.Add(new ExpenseSubTypeRef()
                        {
                            ExpenseSubTypeRefId = DbUtils.GetInt(reader, "ExpenseSubTypeRefId"),
                            ExpenseTypeId = DbUtils.GetInt(reader, "ExpenseTypeId"),
                            ExpenseSubTypeDescription = DbUtils.GetString(reader, "ExpenseSubTypeDescription"),
                            CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
                            CreatedBy = DbUtils.GetNullableInt(reader, "CreatedBy"),
                            UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
                            UpdatedBy = DbUtils.GetNullableInt(reader, "UpdatedBy"),
                        });

                    }
                    reader.Close();
                    return expenseSubTypes;
                }
            }
        }

        public IList<StatusRef> GetAllApprovalStatus()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT [StatusRefId]
                                              ,[StatusDescription]
                                              ,[CreateTS]
                                              ,[CreatedBy]
                                              ,[UpdateTS]
                                              ,[UpdatedBy]
                                          FROM [dbo].[StatusRef]
                                        ";

                    var reader = cmd.ExecuteReader();

                    IList<StatusRef> approvalStatus = new List<StatusRef>();

                    while (reader.Read())
                    {
                        approvalStatus.Add(new StatusRef()
                        {
                            StatusRefId = DbUtils.GetInt(reader, "StatusRefId"),
                            StatusDescription = DbUtils.GetString(reader, "StatusDescription"),
                            CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
                            CreatedBy = DbUtils.GetNullableInt(reader, "CreatedBy"),
                            UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
                            UpdatedBy = DbUtils.GetNullableInt(reader, "UpdatedBy"),
                        });

                    }
                    reader.Close();
                    return approvalStatus;
                }
            }
        }

        public ExpenseDto GetExpense(int expenseId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT e1.[ExpenseId]
                                        ,e1.[ExpenseTypeId]
                                        ,etr1.[ExpenseTypeDescription]
                                        ,e1.[ExpenseSubTypeId]
                                        ,estr1.[ExpenseSubTypeDescription]
                                        ,E1.[ExpenseAmount]
                                        ,e1.[SubmittedByUserId]
                                        ,e1.[CreateTS] as [ExpenseCreatedTS]
                                        ,e1.[CreatedBy] as [ExpenseCreatedBy]
                                        ,e1.[UpdateTS] as [ExpenseUpdatedTS]
                                        ,e1.[UpdatedBy] as [ExpenseUpdatedBy]
                                        ,as1.[ApprovalStatusId]
                                        ,as1.[StatusId]
                                        ,sr1.[StatusDescription]
                                        ,as1.[Comments]
                                        ,as1.[ApproverId]
                                        ,as1.[CreateTS] as [ApprovalCreatedTS]
                                        ,as1.[CreatedBy] as [ApprovalCreatedBy]
                                        ,as1.[UpdateTS] as [ApprovalUpdatedTS]
                                        ,as1.[UpdatedBy] as [ApprovalUpdatedBy]

                                        FROM [dbo].[Expenses] e1
                                        INNER JOIN [dbo].[Users] u1 on u1.UserId = e1.SubmittedByUserId
                                        INNER JOIN [dbo].[ApprovalStatus] as1 on as1.ExpenseId = e1.ExpenseId
                                        INNER JOIN [dbo].[Users] u2 on u2.UserId = as1.ApproverId
                                        INNER JOIN [dbo].[StatusRef] sr1 on sr1.StatusRefId = as1.StatusId
                                        INNER JOIN [dbo].[ExpenseTypesRef] etr1 on etr1.ExpenseTypeRefId =e1.ExpenseTypeId
                                        LEFT JOIN [dbo].[ExpenseSubTypesRef] estr1 on estr1.ExpenseSubTypeRefId = e1.ExpenseSubTypeId 
                                                                                        and estr1.ExpenseTypeId = e1.ExpenseTypeId
                                        WHERE e1.[ExpenseId] = @ExpenseId
                                        ";

                    DbUtils.AddParameter(cmd, "@ExpenseId", expenseId);

                    var reader = cmd.ExecuteReader();

                    ExpenseDto? expense = null;

                    while (reader.Read())
                    {
                        expense = new ExpenseDto()
                        {
                            ExpenseId = DbUtils.GetInt(reader, "ExpenseId"),
                            ExpenseTypeId = DbUtils.GetInt(reader, "ExpenseTypeId"),
                            ExpenseType = DbUtils.GetString(reader, "ExpenseTypeDescription"),
                            ExpenseSubTypeId = DbUtils.GetInt(reader, "ExpenseSubTypeId"),
                            ExpenseSubType = DbUtils.GetString(reader, "ExpenseSubTypeDescription"),
                            ExpenseAmount = DbUtils.GetNullableDecimal(reader, "ExpenseAmount"),
                            SubmittedByUserId = DbUtils.GetInt(reader, "SubmittedByUserId"),
                            ExpenseCreatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseCreatedTS"),
                            ExpenseCreatedByUserId = DbUtils.GetInt(reader, "ExpenseCreatedBy"),
                            ExpenseUpdatedTS = DbUtils.GetNullableDateTime(reader, "ExpenseUpdatedTS"),
                            ExpenseUpdatedByUserId = DbUtils.GetInt(reader, "ExpenseUpdatedBy"),
                            ApprovalStatusId = DbUtils.GetInt(reader, "ApprovalStatusId"),
                            StatusId = DbUtils.GetInt(reader, "StatusId"),
                            StatusDescription = DbUtils.GetString(reader, "StatusDescription"),
                            Comments = DbUtils.GetString(reader, "Comments"),
                            ApproverId = DbUtils.GetInt(reader, "ApproverId"),
                            ApprovalCreatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalCreatedTS"),
                            ApprovalCreatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalCreatedBy"),
                            ApprovalUpdatedTS = DbUtils.GetNullableDateTime(reader, "ApprovalUpdatedTS"),
                            ApprovalUpdatedByUserId = DbUtils.GetNullableInt(reader, "ApprovalUpdatedBy"),

                        };

                    }
                    reader.Close();
                    return expense;
                }
            }
        }

        public void UpdateExpense(Expense expense)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        UPDATE [dbo].[Expenses]
                                           SET [ExpenseTypeId] = @ExpenseTypeId
                                              ,[ExpenseSubTypeId] = @ExpenseSubTypeId
                                              ,[ExpenseAmount] = @ExpenseAmount
                                              ,[SubmittedByUserId] = @SubmittedByUserId
                                              ,[UpdateTS] = @UpdateTS
                                              ,[UpdatedBy] = @UpdatedBy
                                         WHERE 
                                                [ExpenseId] = @ExpenseId
                                      ";

                    DbUtils.AddParameter(cmd, "@ExpenseId", expense.ExpenseId);
                    DbUtils.AddParameter(cmd, "@ExpenseTypeId", expense.ExpenseTypeId);
                    DbUtils.AddParameter(cmd, "@ExpenseSubTypeId", expense.ExpenseSubTypeID);
                    DbUtils.AddParameter(cmd, "@ExpenseAmount", expense.ExpenseAmount);
                    DbUtils.AddParameter(cmd, "@SubmittedByUserId", expense.SubmittedByUserId);
                    DbUtils.AddParameter(cmd, "@UpdateTS", expense.UpdateTS);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", expense.UpdatedBy);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateExpenseStatus(ApprovalStatus approvalStatus)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        UPDATE [dbo].[ApprovalStatus]
                                            SET 
                                                [StatusId] = @StatusId
                                                ,[Comments] = @Comments
                                                ,[ApproverId] = @ApproverId
                                              ,[UpdateTS] = @UpdateTS
                                              ,[UpdatedBy] = @UpdatedBy
                                         WHERE 
                                                [ExpenseId] = @ExpenseId
                                      ";

                    DbUtils.AddParameter(cmd, "@ExpenseId", approvalStatus.ExpenseId);
                    DbUtils.AddParameter(cmd, "@StatusId", approvalStatus.StatusId);
                    DbUtils.AddParameter(cmd, "@Comments", approvalStatus.Comments);
                    DbUtils.AddParameter(cmd, "@ApproverId", approvalStatus.ApproverId);
                    DbUtils.AddParameter(cmd, "@UpdateTS", approvalStatus.UpdateTS);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", approvalStatus.UpdatedBy);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
