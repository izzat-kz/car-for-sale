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
    public partial class CarManager : System.Web.UI.Page
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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            string sql;
            string manName, modelName;
            decimal cc, price;

            manName = txtMan.Text;
            modelName = txtModel.Text;
            cc = Convert.ToDecimal(txtCC.Text);
            price = Convert.ToDecimal(txtPrice.Text);

            sql = "insert into carforsale (manufacturerName, modelName, cc, price) " +
                "values('" + manName + "', '" + modelName + "',  " + cc + ",  " + price + ")";

            executeSQL(sql, "insert");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string sql;
            int carID;
            decimal newPrice;

            carID = Convert.ToInt32(txtCarID.Text);
            newPrice = Convert.ToDecimal(txtUpdatePrice.Text);

            sql = "update carforsale set price = '" + newPrice + "' where carID = '" + carID + "'";

            executeSQL(sql, "update");

        }
    }
}
