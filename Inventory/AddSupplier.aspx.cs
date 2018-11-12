using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Purchase
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void clear()
        {
            txtSname.Text = "";
            txtSphone.Text = "";
            txtSaddress.Text = "";
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            a.ExcecuteNonQuery("Insert into SupplierTable (S_name, S_phone, S_address) values ('" + txtSname.Text + "','" + txtSphone.Text + "','" + txtSaddress.Text + "')");
            clear();
        }
    }
}