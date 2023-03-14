using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001_ConectedLayer.Requests
{
    static class RunSelect
    {
        static public void FromUsers()
        {
            string dpName = ConfigurationManager.AppSettings["provider"];
            string connString = ConfigurationManager.ConnectionStrings["SqlProvider"].ConnectionString;

            DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory(dpName);

            using (DbConnection conn = dbProviderFactory.CreateConnection())
            {
                conn.ConnectionString = connString;
                conn.Open();



                DbCommand dbCommandGettAllUsers = dbProviderFactory.CreateCommand();
                dbCommandGettAllUsers.Connection = conn;
                dbCommandGettAllUsers.CommandText = "SELECT * FROM users";


                using (DbDataReader dbAllUser = dbCommandGettAllUsers.ExecuteReader())
                {
                    Console.WriteLine("Содержимое базы (SELECT * FROM users):");
                    Console.ForegroundColor = ConsoleColor.Green;
                    while (dbAllUser.Read())
                    {
                        Console.WriteLine(
                            $"Id: {dbAllUser["id"]}" +
                            $"\tLogin: {dbAllUser["login"]}" +
                            $"  Email: {dbAllUser["email"]}" +
                            $"  Pass: {dbAllUser["password"]}"
                                         );

                    }
                    Console.ResetColor();

                }

            }


        }

        static public void FromUsersInfo() 
        {


            string dpName = ConfigurationManager.AppSettings["provider"];
            string connString = ConfigurationManager.ConnectionStrings["SqlProvider"].ConnectionString;

            DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory(dpName);

            using (DbConnection conn = dbProviderFactory.CreateConnection())
            {
                conn.ConnectionString = connString;
                conn.Open();



                DbCommand dbCommandGettAllUsers = dbProviderFactory.CreateCommand();
                dbCommandGettAllUsers.Connection = conn;
                dbCommandGettAllUsers.CommandText = "SELECT* FROM usersInfo";


                using (DbDataReader dbAllUser = dbCommandGettAllUsers.ExecuteReader())
                {
                    Console.WriteLine("Содержимое по запросу (SELECT* FROM usersInfo):");
                    Console.ForegroundColor = ConsoleColor.Green;
                    
                    while (dbAllUser.Read())
                    {
                        
                        Console.WriteLine(
                            $"Id: {dbAllUser["id"]}" +
                            $"\tUserId: {dbAllUser["userId"]}" +
                            $"\tFIO: {dbAllUser["fio"]}" +
                            $"\tINN: {dbAllUser["inn"]}" +
                            $"\tGender: {dbAllUser["gender"]}" +
                            $"\tBDay: { DateTime.Parse(dbAllUser["birthDate"].ToString()).ToShortDateString()}"
                                         );
                        
                    }
                    Console.ResetColor();

                }

            }
        }
        

    }
}
