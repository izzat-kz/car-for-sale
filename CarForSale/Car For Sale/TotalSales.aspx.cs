using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Car_For_Sale
{
    public partial class TotalSales : System.Web.UI.Page
    {
        public SqlConnection connection =
        new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\mizza\OneDrive\Documents\carforsaleDATABASE.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            string sql;
            SqlCommand command;
            DataTable dt = new DataTable();
            int purcID = Convert.ToInt32(txtFind.Text);

            sql = "select * from dbo.purchasers where purcID = '" + purcID + "' ";

            connection.Open();
            command = new SqlCommand(sql, connection);
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            command.ExecuteNonQuery();

            if (dt.Rows.Count > 0)
            {
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
            }
            else
            {
                Response.Write("No Record");
            }
            command.Dispose();
            connection.Close();
        }
    }
}