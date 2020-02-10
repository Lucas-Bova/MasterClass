using MasterClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterClass
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1; i <= 50; ++i)
                {
                    ddlCols.Items.Add(i.ToString());
                    ddlRows.Items.Add(i.ToString());
                }
                if (Session["Cols"] != null && Convert.ToInt32(Session["Cols"]) > 1)
                {
                    ddlCols.SelectedValue = Session["Cols"].ToString();
                    ddlRows.SelectedValue = Session["Rows"].ToString();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //save the col and row values into the session state and redirect to the grid page
            if (IsValid)
            {
                Session.Add("Cols", ddlCols.SelectedItem.Text);
                Session.Add("Rows", ddlRows.SelectedItem.Text);
                Response.Redirect("~/EditGrid.aspx");
            }
        }
    }
}