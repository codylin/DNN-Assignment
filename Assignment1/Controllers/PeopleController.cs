using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Assignment1.Classes;
using Assignment1.Models;
using System.Data.SqlClient;
using System.Data;

namespace Assignment1.Controllers
{
    public class PeopleController : ApiController
    {
        [HttpGet()]
        [ActionName("GetPeople")]
        public IEnumerable<Models.People> GetPeople()
        {

            using (SqlConnection sqlConnection = SqlServerConnection.Instance)
            {
                sqlConnection.Open();
                Models.People result = null;
                List<Models.People> people = new List<Models.People>();
                using (SqlCommand cmd = new SqlCommand("spListResults", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        result = new Models.People();
                        result.Email = reader["Email"].ToString();
                        result.UserName = reader["UserName"].ToString();
                        result.FullName = reader["Name"].ToString();
                        result.Joined = reader["Joined"].ToString();
                        people.Add(result);
                    }


                    return people;
                }
            }
        }
        [HttpPost()]
        [ActionName("CreatePerson")]
        public string CreatePerson(Dictionary<String,String> data)
        {
            string returnMsg = "OK";
            using (SqlConnection sqlConnection = SqlServerConnection.Instance)
            {
                sqlConnection.Open();
                //Models.People result = null;
                //List<Models.People> people = new List<Models.People>();
                using (SqlCommand cmd = new SqlCommand("spCreatePerson", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@EMAIL_PARAM", SqlDbType.VarChar).Value = data["Email"];
                    cmd.Parameters.Add("@Username_PARAM", SqlDbType.VarChar).Value = data["UserName"];
                    cmd.Parameters.Add("@Firstname_PARAM", SqlDbType.VarChar).Value = data["FirstName"];
                    cmd.Parameters.Add("@Lastname_PARAM", SqlDbType.VarChar).Value = data["LastName"];
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex) {
                        Console.WriteLine(ex.ToString());
                        if(ex.Number == 2627) {
                            returnMsg = "Duplicate Primary Key Username";
                            
                        }

                    }
                }
            }
            return returnMsg;
        }
    }

    

}
