using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MasterClass.Models;

namespace MasterClass
{
    public partial class NewUser : System.Web.UI.Page
    {
        MasterClassEntities db = new MasterClassEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var teacher = new Teacher();
                teacher.Teach_Fname = txtFname.Text;
                teacher.Teach_Lname = txtLname.Text;
                teacher.Teach_Email = txtEmail.Text;
                teacher.Teach_Password = txtPassword.Text;
                db.Teachers.Add(teacher);
                db.SaveChanges();
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SelectClass.aspx");
        }
    }
}