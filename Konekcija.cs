using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication4
{
    public class Konekcija
    {
        static public SqlConnection Connect()
        {
            string cs = ConfigurationManager.ConnectionStrings["veza"].ConnectionString;
            SqlConnection veza = new SqlConnection(cs);
            return veza;
        }
    }
}