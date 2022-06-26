using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AddStudent.Models
{
    internal class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime DOB { get; set; }
        public string Major { get; set; }
        public double Scholar { get; set; }
        public int EntryYear { get; set; }

        public Student()
        {

        }

        public Student(int id, string name, DateTime date, string major, double solar, int year)
        {
            Id = id;
            Name = name;
            DOB = date;
            Major = major;
            Scholar = solar;
            EntryYear = year;
        }
        public Boolean isNumber(string s)
        {
            return s.All(char.IsNumber);
        }
        public override string? ToString()
        {
            return Id + "|" + Name + "|" + DOB.ToString("dd MMM yyyy") + "|" + Major + "|" + Scholar + "|" + EntryYear + "\n";
        }
    }
}
