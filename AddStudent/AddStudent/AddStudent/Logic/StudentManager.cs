using AddStudent.DataAccess;
using AddStudent.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AddStudent.Logic
{
    internal class StudentManager
    {
        List<Student> lstSt = new List<Student>();
        public List<Student> List { get; set; }
        public static List<Student> GetAllStudent(string fileName)
        {
            FileIO file = new FileIO(fileName);
            return file.ReadFromFile();
        }
        public static bool isNumber(string s)
        {
            return s.All(char.IsNumber);
        }
        public static bool IsDateTime(string txtDate)
        {
            DateTime tempDate;
            return DateTime.TryParse(txtDate, out tempDate);
        }
    }
}
