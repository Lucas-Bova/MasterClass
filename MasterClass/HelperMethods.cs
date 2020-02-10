using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace MasterClass
{
    public static class HelperMethods
    {

        public static IEnumerable<Control> GetControls(Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                yield return control;

                foreach (Control descendant in GetControls(control))
                {
                    yield return descendant;
                }
            }
        }
    }
}