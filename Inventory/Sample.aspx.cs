using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Purchase
{
    public partial class Sample : System.Web.UI.Page
    {
        string orderno;
        public DateTime now = DateTime.Now;
        public int count = 0;
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        DBCON g = new DBCON();
        DBCON h = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtOrder.Text = ordernoGen();
                loadProd();
                txtOrder.Enabled = false;
            }


        }

        protected void ddlProd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public string ordernoGen()
        {
            orderno = "";
            a.DT.Clear();
            a.ExcecuteQuery("select isnull(max(Order_no),0)+1 from OrderTable");
            if (a.DT.Rows.Count > 0)
            {
                int temp = Convert.ToInt32(a.DT.Rows[0][0].ToString());
                orderno = temp.ToString();
                return orderno;
            }
            else { return ""; }
        }

        public void loadProd()
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from ProductTable");
            ddlProd.DataTextField = "P_name";
            ddlProd.DataValueField = "P_id";
            ddlProd.DataSource = a.DT;
            ddlProd.DataBind();
        }

        protected void addOrder(object sender, EventArgs e)
        {



            btnOrder.Visible = true;
            rptData.Visible = true;

            d.ExcecuteQuery("select P_price from ProductTable where P_id='" + ddlProd.SelectedValue + "'");
            double sub = Convert.ToDouble(d.DT.Rows[0][0].ToString());

            string total = Convert.ToString(Convert.ToDouble(txtPqty.Text) * sub);
            f.DT.Clear();
            f.ExcecuteQuery("select * from TempOrderTable where P_name='" + ddlProd.SelectedItem + "'");
            if (f.DT.Rows.Count == 0)
            {
                c.DT.Clear();
                c.ExcecuteNonQuery("insert into TempOrderTable values('" + ddlProd.SelectedItem + "','" + txtPqty.Text + "','" + d.DT.Rows[0][0].ToString() + "','" + total + "')");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Duplicate Entry')", true);
            }
            Bind();


        }

        public void Bind()
        {
            c.DT.Clear();
            c.ExcecuteQuery("Select * from TempOrderTable t1 inner join ProductTable t2 on t1.P_name=t2.P_name ");
            rptData.DataSource = c.DT;
            rptData.DataBind();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {

            foreach (RepeaterItem i in rptData.Items)
            {

                HiddenField hid = (HiddenField)i.FindControl("hid");
                g.DT.Clear();
                g.ExcecuteQuery("select P_name,P_qty,P_tot from TempOrderTable where No='" + hid.Value + "'");
                string name = g.DT.Rows[0][0].ToString();
                string qty = g.DT.Rows[0][1].ToString();
                string tot = g.DT.Rows[0][2].ToString();
                d.DT.Clear();
                d.ExcecuteQuery("select P_id from ProductTable where P_name='" + name + "'");
                string pid = d.DT.Rows[0][0].ToString();
                //string unit = d.DT.Rows[0][1].ToString();

                f.DT.Clear();
                f.ExcecuteNonQuery("Insert into OrderTable values('" + txtOrder.Text.ToString().Trim() + "','" + pid + "','" + qty + "','" + tot + "','" + now.Date.ToString("yyyy - MM - dd") + "','false')");
                //string rem = Convert.ToString(Convert.ToInt32(unit) - Convert.ToInt32(hid.Value));

                h.DT.Clear();
                h.ExcecuteNonQuery("Delete from TempOrderTable where No='" + hid.Value + "'");

            }
            clear();
            //Bind();
            txtOrder.Text = ordernoGen();
            rptData.Visible = false;

            btnOrder.Visible = false;
        }

        public void clear()
        {
            //txtOrder.Text = ordernoGen();
            txtPqty.Text = "";
            ddlProd.ClearSelection();

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                c.DT.Clear();
                c.ExcecuteNonQuery("Delete from TempOrderTable where No='" + e.CommandArgument + "'");
                Bind();
            }
        }


    }
}



