using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Assignment1.Classes
{
    public class SqlServerConnection
    {
        // Values to pass to the connection string
        private const string USER = "tester";
        private const string PASSWORD = "tester";
        private const string DATABASE = "Dnn Assignment";
        private const string SERVER = "localhost";

        public static SqlConnection Instance
        {
            get
            {
                SqlConnectionStringBuilder conStr = new SqlConnectionStringBuilder();

                conStr.UserID = USER;
                conStr.Password = PASSWORD;
                conStr.InitialCatalog = DATABASE;
                conStr.DataSource = SERVER;

                return new SqlConnection(conStr.ConnectionString);

            }
        }
    }
}