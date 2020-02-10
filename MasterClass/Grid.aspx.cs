using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MasterClass.Models;

namespace MasterClass
{
    public partial class Grid : System.Web.UI.Page
    {
        public int Cols { get; set; }
        public int Rows { get; set; }
        public List<Cell> GridList { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(Object sender, EventArgs e)
        {
            GridList = (List<Cell>)Session["GridList"];
            Cols = Convert.ToInt32(Session["Cols"]);
            Rows = Convert.ToInt32(Session["Rows"]);
            //if (!IsPostBack)
            //{
            //    CalcTable();
            //}
            CalcTable();
        }

        private void CalcTable()
        {
            int i = 0;
            Panel panel = new Panel();
            panel.ID = "GridPanel";
            panel.EnableViewState = true;
            panel.CssClass = "container-fluid";
            do
            {
                for (int r = 0; r < Rows; ++r)
                {
                    Panel SubPanel = new Panel();
                    SubPanel.ID = $"panel,{r}";
                    SubPanel.CssClass = "row";
                    for (int c = 0; c < Cols; ++c)
                    {
                        Button button = new Button();
                        button.CssClass = $"btn btn-primary col-sm-{GetSize(Cols)} border border-dark rounded";
                        button.ID = $"{r},{c}";
                        button.Text = GridList[i].FName;
                        button.Attributes.Add("runat", "server");
                        button.Click += new EventHandler(Btn_Click);
                        //button.OnClientClick = "Cell_Clicked(event)";
                        SubPanel.Controls.Add(button);
                        ++i;
                    }
                    panel.Controls.Add(SubPanel);
                }
            } while (i < GridList.Count);

            Session.Add("ActivePanel", panel);
            Page.Master.FindControl("MainPlaceHolder").Controls.Add(panel);
        }

        private int GetSize(int cols)
        {
            int size = 12 / cols;
            if (size < 1)
            {
                size = 1;
            }
            return size;
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            btn.CssClass = $"btn btn-success col-sm-{GetSize(Cols)} border border-dark rounded";

            //update database to reflect that this button was hit
            //change button color??? maybe do this with a script
            //we are having trouble with keeping the client added class changes when we postback
        }
    }
}