using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MasterClass.Models;
using System.Web.ModelBinding;
using System.Data;
using System.Web.UI.HtmlControls;

namespace MasterClass
{
    public partial class newGrid : System.Web.UI.Page
    {
        MasterClassEntities db = new MasterClassEntities();
        int ClassID;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            ClassID = Convert.ToInt32(Session["ClassID"]);
            Build_Cards();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Attend> grdRun_GetData()
        {
            return from a in db.Attends.Include("Student")
                   where a.Class_ID == ClassID
                   orderby a.Student.Stu_Lname
                   select a;
        }

        protected void btnItem_Click(object sender, EventArgs e)
        {
            //Button btn = (Button)sender;
            LinkButton btn = (LinkButton)sender;
            var id = Convert.ToInt32(btn.Attributes["CustomProp"]);

            var item = (from a in db.Attends
                          where (a.Stu_ID == id && a.Class_ID == ClassID)
                          select a).FirstOrDefault();

            item.Att_Interactions++;
            db.SaveChanges();
        }

        private void Build_Cards()
        {
            IEnumerable<Attend> data = from a in db.Attends.Include("Student")
                                       where a.Class_ID == ClassID
                                       orderby a.Student.Stu_Lname
                                       select a;
            var count = data.Count();

            for (var i = 0; i < count; ++i)
            {
                //create card
                Panel pnl = new Panel();
                pnl.CssClass = "card col-md-3 d-md-inline-block bg-light";
                Image img = new Image();
                img.CssClass = "card-img-top img-fluid img-cover";
                img.ImageUrl = $"~/Images/{GetImage(data.ElementAt(i).Student.Stu_Pic)}";
                img.AlternateText = "Card Image";
                Panel bodyPnl = new Panel();
                bodyPnl.CssClass = "card-body";
                Literal h5 = new Literal();
                h5.Text = $"<h5 class=\"card-title card-responsive-text\"> {data.ElementAt(i).Student.Stu_Fname} {data.ElementAt(i).Student.Stu_Lname} </h5>";
                Literal p = new Literal();
                p.Text = $"<span class=\"card-text card-responsive-text\"> Interactions - {data.ElementAt(i).Att_Interactions} </span>";
                p.EnableViewState = true;
                LinkButton btnCard = new LinkButton();
                btnCard.Width = 0;
                btnCard.Height = 0;
                btnCard.CssClass = "stretched-link";
                btnCard.Attributes.Add("CustomProp", $"{data.ElementAt(i).Stu_ID}");
                btnCard.Click += btnItem_Click;
                bodyPnl.Controls.Add(h5);
                bodyPnl.Controls.Add(p);
                bodyPnl.Controls.Add(btnCard);
                pnl.Controls.Add(img);
                pnl.Controls.Add(bodyPnl);
                //add card
                pnlCards.Controls.Add(pnl);
            }
        }

        private string GetImage(string pic)
        {
            if (pic == null)
            {
                return "default.jpg";
            }
            else
            {
                return pic;
            }
        }
    }
}