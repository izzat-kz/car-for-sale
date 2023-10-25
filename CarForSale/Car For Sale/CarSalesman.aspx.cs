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
    public partial class CarSalesman : System.Web.UI.Page
    {
        public SqlConnection connection =
        new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\mizza\OneDrive\Documents\carforsaleDATABASE.mdf;Integrated Security=True;Connect Timeout=30");

        public void executeSQL(String sql, String state)
        {
            SqlCommand command;
            connection.Open();
            command = new SqlCommand(sql, connection);
            if (command.ExecuteNonQuery() != 0)
            {
                command.Dispose();
                connection.Close();
                Response.Write(state + " command executed!");
            }
            else
            {
                Response.Write(state + " not executed!");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string sql;
            SqlCommand command;
            DataTable dt = new DataTable();
            decimal cc = Convert.ToDecimal(ddlFilter.SelectedValue);

            sql = "select * from dbo.carforsale where cc = '" + cc + "' ";

            connection.Open();
            command = new SqlCommand(sql, connection);
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            command.ExecuteNonQuery();

            if (dt.Rows.Count > 0)
            {
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            else
            {
                Response.Write("No Record");
            }
            command.Dispose();
            connection.Close();
        }

        protected void btnPurchaser_Click(object sender, EventArgs e)
        {
            Response.Redirect("SalesInfo.aspx");
        }

    }
}