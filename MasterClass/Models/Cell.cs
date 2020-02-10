using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MasterClass.Models
{
    //implements data associated with each cell
    public class Cell
    {
        //need memebers for name
        //attendance (present, absent, excused?)
        //state (interacted)
        //count of interactions
        public string FName { get; set; }
        public string LName { get; set; }
        //0 = excused, 1 = present, 2 = absent
        public int Attend { get; set; }
        //0 = not answered, ???
        public int State { get; set; }
        public int Count { get; set; }
    }
}