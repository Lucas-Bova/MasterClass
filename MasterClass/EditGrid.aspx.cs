using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MasterClass.Models;
using MasterClass;
using System.Web.UI.HtmlControls;

namespace MasterClass
{
    public partial class EditGrid : System.Web.UI.Page
    {
        public int Cols { get; set; }
        public int Rows { get; set; }
        public List<Cell> GridList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Cols = Convert.ToInt32(Session["Cols"]);
            Rows = Convert.ToInt32(Session["Rows"]);
            Panel panel = (Panel)Session["Panel"];
            if (Session["Panel"] != null && (Cols * Rows) == Convert.ToInt32(panel.Attributes["num"]))
            {
                Page.Master.FindControl("MainPlaceHolder").Controls.Add((Panel)Session["Panel"]);
            }
            else
            {
                CalcTable();
            }
        }

        private void CalcTable()
        {
            Panel panel = new Panel();
            panel.ID = "EditPanel";
            panel.EnableViewState = true;
            panel.Attributes.Add("num", $"{Cols * Rows}");
            for (int i = 0; i < Rows; ++i)
            {
                if (i > 0)
                {
                    panel.Controls.Add(new Literal() { Text = "<br />" });
                }
                for (int c = 0; c < Cols; ++c)
                {
                    TextBox box = new TextBox();
                    box.ID = $"{i},{c}";
                    box.EnableViewState = true;
                    panel.Controls.Add(box);
                }
                Session.Add("Panel", panel);
                Page.Master.FindControl("MainPlaceHolder").Controls.Add(panel);
            }
        }

        protected void BtnRun_Click(Object sender, EventArgs e)
        {
            GridList = new List<Cell>();
            ContentPlaceHolder cph = (ContentPlaceHolder)this.Page.Master.FindControl("MainPlaceHolder");
            Panel panel = (Panel)cph.FindControl("EditPanel");
            List<TextBox> list = HelperMethods.GetControls(panel).OfType<TextBox>().ToList();
            foreach (TextBox box in list)
            {
                Cell cell = new Cell();
                cell.FName = box.Text;
                GridList.Add(cell);
            }
            Session.Add("GridList", GridList);
            Response.Redirect("~/Grid.aspx");
        }
    }
}