using AddStudent.Logic;
using AddStudent.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AddStudent
{
    public partial class Form1 : Form
    {
        List<Student> lstStu;
        StudentManager stu = new StudentManager();
        //private string name = "";
        //private string namePath = "";
        Student st = new Student();
        public Form1()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }


        private void Save()
        {
            StreamWriter sw = new StreamWriter(tbFileName.Text);
            List<Student> lst = StudentManager.GetAllStudent(tbFileName.Text);
            if (sw != null)
            {
                foreach (var item in lst)
                {
                    sw.Write(item.ToString());
                }
                //name = Path.GetFileNameWithoutExtension(namePath);
                sw.Close();
            }
        }
        /*
        private void SaveDialog()
        {
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();
            saveFileDialog1.CreatePrompt = true;
            saveFileDialog1.OverwritePrompt = true;
            saveFileDialog1.FileName = name;
            saveFileDialog1.DefaultExt = "txt";
            saveFileDialog1.Filter =
                "Text files (*.txt)|*.txt|All files (*.*)|*.*";
            saveFileDialog1.InitialDirectory =
                Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            DialogResult result = saveFileDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                namePath = saveFileDialog1.FileName;
                Save();
            }
        }
        */
        private void btOpen_Click(object sender, EventArgs e)
        {
            List<Student> lstNew = new List<Student>();
            OpenFileDialog open = new OpenFileDialog();
            open.Title = "OPEN";
            open.InitialDirectory = @"D:\";
            open.Filter = "Text file|*.txt";
            open.Multiselect = false;
            if (open.ShowDialog() == DialogResult.OK)
            {
                string fileName = open.FileName;
                tbFileName.Text = fileName;
                lstStu = StudentManager.GetAllStudent(fileName);
                lstNew = lstStu;
                dataGridView1.DataSource = lstNew;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void SendMessage(String message)
        {
            MessageBox.Show(message);
        }
        private void btAdd_Click(object sender, EventArgs e)
        {
            if (lstStu is null)
            {
                MessageBox.Show("Need to load data!");
                return;
            }
            //lstStu = StudentManager.GetAllStudent(tbFileName.Text);

            //check data is empty
            if (tbID.Text.Equals(String.Empty) || tbName.Text.Equals(String.Empty)
                || tbEntryYear.Text.Equals(String.Empty)
                || tbMajor.Text.Equals(String.Empty) || tbScholar.Text.Equals(String.Empty))
            {
                MessageBox.Show("Data is not allow null!");
                return;
            }

            //check format date of birth 
            //if (!StudentManager.IsDateTime(tbDOB.Text))
            //{
            //    MessageBox.Show("Please enter DOB with format: yyyy/MM/dd");
            //    return;
            //}

            //check data is number
            if (!StudentManager.isNumber(tbID.Text) || !StudentManager.isNumber(tbEntryYear.Text)
                || !StudentManager.isNumber(tbScholar.Text))
            {
                MessageBox.Show("Please input a number at ID, Entry year and Scholar!");
                return;
            }
            //check ID exists
            foreach (Student s in lstStu)
            {
                if (Convert.ToInt32(tbID.Text) == s.Id)
                {
                    MessageBox.Show("ID is already exists!");
                    return;
                }
            }
            //add to datagirdview
            int id = Convert.ToInt32(tbID.Text);
            string name = tbName.Text;
            //DateTime da = Convert.ToDateTime(tbDOB.Text);
            DateTime da = dtDOB.Value;
            string ma = tbMajor.Text.ToUpper();
            double scho = Convert.ToDouble(tbScholar.Text);
            int year = Convert.ToInt32(tbEntryYear.Text);
            Student ss = new Student(id, name, da, ma, scho, year);
            lstStu.Add(ss);
            dataGridView1.DataSource = lstStu.ToList();
        }

        private void tbName_TextChanged(object sender, EventArgs e)
        {

        }

        private void btSave_Click(object sender, EventArgs e)
        {
            if (lstStu is null)
            {
                MessageBox.Show("Need to load data!");
                return;
            }
            string content = "";
            try
            {
                foreach (Student s in lstStu)
                {
                    content += s.ToString();
                }
                File.WriteAllText(tbFileName.Text, content);
                MessageBox.Show("Save Successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void btSaveAs_Click(object sender, EventArgs e)
        {
            if (lstStu is null)
            {
                MessageBox.Show("Need to load data!");
                return;
            }
            string content1 = "";
            string path = tbFileName.Text;
            foreach (Student s in lstStu)
            {
                content1 += s.ToString();
            }
            SaveFileDialog sf = new SaveFileDialog();
            sf.Filter = "Text file|*.txt";
            if (sf.ShowDialog() == DialogResult.OK)
            {
                StreamWriter sw = new StreamWriter(sf.FileName);
                sw.WriteLine(content1);
                MessageBox.Show("Save successfully!");
                sw.Dispose();
                sw.Close();
            }
        }

        private void tbDOB_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtDOB_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void tbFileName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
