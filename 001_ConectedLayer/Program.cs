using _001_ConectedLayer.Requests;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace _001_ConectedLayer
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Посмотрим содержимое базы:");
            RunSelect.FromUsers();
            RunSelect.FromUsersInfo();
            Console.ReadKey();
            Console.Clear();


            Console.WriteLine("Удалим данные с помощью запроса, и посмотрим на результат" +
                "\n должен быть удален юзер с айди 12");
            Delete.ForId(12);

            RunSelect.FromUsers();
            RunSelect.FromUsersInfo();
            Console.ReadKey();
            Console.Clear();


            Console.WriteLine("Удалим данные с транзакции, и посмотрим на результат" +
                 "\n должен быть удален юзер с айди 2");
            Delete.TransactionForId(2);

            RunSelect.FromUsers();
            RunSelect.FromUsersInfo();
            Console.ReadKey();
            Console.Clear();
        }
    }
}
