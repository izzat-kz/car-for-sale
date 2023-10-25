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
    public partial class RecordPurchaser : System.Web.UI.Page
    {

        private SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\mizza\OneDrive\Documents\carforsaleDATABASE.mdf;Integrated Security=True;Connect Timeout=30");

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

        protected void btnRecord_Click(object sender, EventArgs e)
        {
            string sql;
            string name, address, modelName;
            int phone, carID;

            name = txtName.Text;
            address = txtAddress.Text;
            phone = Convert.ToInt32(txtPhone.Text);
            carID = Convert.ToInt32(ddlCar.SelectedValue);
            modelName = ddlCar.SelectedItem.Text;

            sql = "insert into purchasers (purcName, purcAddress, purcPhone, carID, modelName) values " +
                "('" + name + "', '" + address + "', '" + phone + "', '" + carID + "', '" + modelName + "')";

            executeSQL(sql, "insert");

            Response.Redirect("TotalSales.aspx");
        }
    }
}