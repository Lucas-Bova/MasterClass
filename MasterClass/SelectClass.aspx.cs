using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MasterClass.Models;
using System.Web.ModelBinding;
using System.Drawing;
using System.Data;

namespace MasterClass
{
    public partial class SelectClass : System.Web.UI.Page
    {
        MasterClassEntities db = new MasterClassEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grdClass.Rows[0].BackColor = ColorTranslator.FromHtml("#A1DCF2");
            }
            if (Session["ClassID"] == null)
            {
                Class temp = (from c in db.Classes
                              orderby c.Class_ID
                              select c).FirstOrDefault();
                Session["ClassID"] = temp.Class_ID;
            }
        }

        public IQueryable<Teacher> ddlInsertTeacher_GetData()
        {
            return from t in db.Teachers
                   orderby t.Teach_Lname
                   select t;
        }

        //grdClass data memebers
        public IQueryable<Class> grdClass_GetData()
        {
            return from c in db.Classes.Include("Teacher")
                   orderby c.Class_ID
                   select c;
        }


        //dvClass data memebers
        public void dvClass_UpdateItem(int Class_ID)
        {
            var item = (from c in db.Classes
                        where c.Class_ID == Class_ID
                        select c).FirstOrDefault();
            if (item == null)
            {
                ModelState.AddModelError("", $"Item with id {Class_ID} was not found");
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.SaveChanges();
                grdClass.DataBind();
            }
        }

        public void dvClass_InsertItem()
        {
            var item = new Class();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.Classes.Add(item);
                db.SaveChanges();
                grdClass.DataBind();
            }
        }

        public void dvClass_DeleteItem(int Class_ID) //add code to delete corresponding attend data
        {
            var item = (from c in db.Classes
                        where c.Class_ID == Class_ID
                        select c).FirstOrDefault();
            if (item != null)
            {
                db.Classes.Remove(item);
                db.SaveChanges();
                grdClass.DataBind();
            }
        }

        public Class dvClass_GetItem([Control] Nullable<int> grdClass)
        {
            if (grdClass == null)
            {
                grdClass = db.Classes.FirstOrDefault().Class_ID;
            }
            return (from c in db.Classes
                   where c.Class_ID == grdClass
                   select c).FirstOrDefault();
        }


        /////////////////end of dvclass methods/////////////////

        //lvStudent data methods 
        //this method needs some love
        public IQueryable<Student> lvStudent_GetItem()
        {
            int classid = Convert.ToInt32(Session["ClassID"]);
            var InClass = (from a in db.Attends
                              where a.Class_ID == classid
                              select a.Stu_ID).Distinct();

            IQueryable<Student> result = from s in db.Students
                                         where !InClass.Contains(s.Stu_ID)
                                         select s;
            return result;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void lvStudent_UpdateItem(int Stu_ID)
        {
            var item = (from s in db.Students
                        where s.Stu_ID == Stu_ID
                        select s).FirstOrDefault();
            if (item == null)
            {
                ModelState.AddModelError("", $"Item with id {Stu_ID} was not found");
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.SaveChanges();
                lvStudents.DataBind();
            }
        }

        //insert method should create an attend entry as well as
        public void lvStudent_InsertItem()
        {
            var item = new Student();
            item.TeachID = 1000; //temporary code until we update the data model, this will need to be removed once the relationship between teacher and student is removed
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.Students.Add(item);
                db.SaveChanges();
                lvStudents.DataBind();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void lvStudent_DeleteItem(int Stu_ID) //might need to add some code here to delete the corresponding data in the attend table
        {
            var item = (from s in db.Students
                        where s.Stu_ID == Stu_ID
                        select s).FirstOrDefault();
            if (item != null)
            {
                db.Students.Remove(item);
                db.SaveChanges();
                lvStudents.DataBind();
            }
        }

        //grdAttend data methods
        public IQueryable<Attend> grdAttend_GetData([Control] Nullable<int> grdClass)
        {
            if (grdClass == null)
            {
                grdClass = db.Classes.FirstOrDefault().Class_ID;
            }
            return from a in db.Attends.Include("Student")
                   where a.Class_ID == grdClass
                   select a;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void grdAttend_DeleteItem(int Stu_ID)
        {
            var item = (from a in db.Attends
                        where a.Stu_ID == Stu_ID
                        select a).FirstOrDefault();
            if (item != null)
            {
                db.Attends.Remove(item);
                db.SaveChanges();
                grdAttend.DataBind();
                lvStudents.DataBind();
            }
        }

        //onclick for grdclass select btn
        protected void btnClassSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            var id = btn.Attributes["CustomProp"];
            Session["ClassID"] = id;
            lvStudents.DataBind();
        }

        //onclick for lvStudents
        //needs some control
        protected void lvSelectBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int StuID = Convert.ToInt32(btn.Attributes["CustomProp"]);
            int ClassID = Convert.ToInt32(Session["ClassID"]);
            Attend item = new Attend();
            item.Stu_ID = StuID;
            item.Class_ID = ClassID;
            item.Att_Interactions = 0;
            db.Attends.Add(item);
            db.SaveChanges();
            grdAttend.DataBind();
        }

        //on selected indext change for grdClass to set focus highlight
        protected void grdClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdClass.Rows)
            {
                if (row.RowIndex == grdClass.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                }
            }
        }

        protected void btnClassRun_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            var id = btn.Attributes["CustomProp"];
            Session["ClassID"] = id;

            Response.Redirect("~/newGrid.aspx");
        }

        //updating picture
        //maybe need to delete old picture here
        protected void lvStudents_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            FileUpload fu = (FileUpload)lvStudents.EditItem.FindControl("FileUpload1");
            if (fu.HasFile)
             {
                string path = "C:\\Users\\lbova\\source\\repos\\MasterClass\\MasterClass\\Images\\" + fu.FileName; try
                {
                    fu.SaveAs(path);
                    //update db
                    int id = Convert.ToInt32(fu.Attributes["CustomProp"]);

                    var item = (from s in db.Students
                                where (s.Stu_ID == id)
                                select s).FirstOrDefault();

                    item.Stu_Pic = fu.FileName;
                    db.SaveChanges();

                }
                catch (System.IO.DirectoryNotFoundException ex)
                {
                    //lblMessage.Text = ex.Message;
                }
            }
        }

        protected void lvStudents_ItemInserted(object sender, ListViewInsertedEventArgs e) //not working
        {
            var li = e.Values.Values;
            String[] vals = li.OfType<String>().ToArray();
            var lname = vals[0];
            var fname = vals[1];
            try
            {
                //update db
                var item = (from s in db.Students
                            where (s.Stu_Fname == fname && s.Stu_Lname == lname)
                            select s).FirstOrDefault();

                item.Stu_Pic = Convert.ToString(Session["FileName"]);
                db.SaveChanges();

            }
            catch (Exception ex)
            {
                //lblMessage.Text = ex.Message;
            }
        }

        protected void lvStudents_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload fu = (FileUpload)lvStudents.InsertItem.FindControl("FileUpload2");
            if (fu.HasFile)
            {
                string path = "C:\\Users\\lbova\\source\\repos\\MasterClass\\MasterClass\\Images\\" + fu.FileName; try
                {
                    fu.SaveAs(path);
                    Session["FileName"] = fu.FileName;
                }
                catch (System.IO.DirectoryNotFoundException ex)
                {
                    //lblMessage.Text = ex.Message;
                }
            }
        }
    }
}