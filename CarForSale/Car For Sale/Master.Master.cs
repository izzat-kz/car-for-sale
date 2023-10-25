using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car_For_Sale
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnManager_Click(object sender, EventArgs e)
        {
            Response.Redirect("CarManager.aspx");
        }

        protected void btnSalesman_Click(object sender, EventArgs e)
        {
            Response.Redirect("CarSalesman.aspx");
        }
    }
}