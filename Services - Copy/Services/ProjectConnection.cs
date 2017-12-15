using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    class ProjectConnection
    {
        public static SqlConnection conn = null;
        public static readonly object Newconnection;

        public void Connection_Today()
        {
            //Add connecting String Here
            conn = new SqlConnection("Data Source=.;Initial Catalog=POS;Integrated Security=True");
            conn.Open();
        }
    }
}
