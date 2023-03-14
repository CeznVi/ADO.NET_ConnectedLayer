using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001_ConectedLayer.Requests
{
    static class Delete
    {
        static public void ForId(int id)
        {

            string dpName = ConfigurationManager.AppSettings["provider"];
            string connString = ConfigurationManager.ConnectionStrings["SqlProvider"].ConnectionString;

            DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory(dpName);

            using (DbConnection conn = dbProviderFactory.CreateConnection())
            {
                conn.ConnectionString = connString;
                conn.Open();

                DbCommand dbCommandDeleteUser = dbProviderFactory.CreateCommand();
                dbCommandDeleteUser.Connection = conn;
                dbCommandDeleteUser.CommandText =
                    $"DELETE from users where id = {id}" +
                    $"DELETE from usersInfo where userId = {id}";

                if (dbCommandDeleteUser.ExecuteNonQuery() == 2)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine("Команда выполнена");
                    Console.ResetColor();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Что-то пошло не так.....");
                    Console.ResetColor();
                }

            }
        }

        static public void TransactionForId(int id)
        {

            string dpName = ConfigurationManager.AppSettings["provider"];
            string connString = ConfigurationManager.ConnectionStrings["SqlProvider"].ConnectionString;

            DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory(dpName);

            using (DbConnection conn = dbProviderFactory.CreateConnection())
            {
                conn.ConnectionString = connString;
                conn.Open();

                DbCommand dbCommandDeleteUser = dbProviderFactory.CreateCommand();
                dbCommandDeleteUser.Connection = conn;
                dbCommandDeleteUser.CommandText =
                 "begin transaction" +
                 $" DELETE from users where id = {id}" +
                 $" DELETE from usersInfo where userId = {id}" +
                 " if(@@error >= 1)" +
                 " begin" +
                 " PRINT ('ERROR!') rollback transaction" +
                 " end" +
                 " else" +
                 " commit transaction";

                if (dbCommandDeleteUser.ExecuteNonQuery() == 2)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine("Команда выполнена");
                    Console.ResetColor();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Что-то пошло не так.....");
                    Console.ResetColor();
                }

            }
        }
    }
}
