﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hospital_ISA
{
    public partial class DoctorInfo : Form
    {
        private int Dssn;
        private string shiftAppoints;
        private string shift_from;
        private string shift_to;
        Controller c;
        public DoctorInfo(int Dssn)
        {
            InitializeComponent();
            c = new Controller();
            this.Dssn = Dssn;
            DataTable dt = c.selectDoctor(Dssn);

            if (dt != null)
            {
                object[] doctor = dt.Rows[0].ItemArray;
                string Fname = doctor[1].ToString();
                string Lname = doctor[2].ToString();
                string phone = doctor[3].ToString();
                string age = doctor[4].ToString();
                 shift_from = doctor[9].ToString();
                 shift_to = doctor[10].ToString();
                string department = c.getDocDepartment(Dssn).Rows[0][0].ToString();
                DateTime today = DateTime.Today;
                DataTable d = new DataTable(); 
                for (int i = 0; i<7; i++)
                {
                  today = today.AddDays(i);
                  comboBox1.Items.Add
                        (today.ToString("yyyy-MM-dd"));

                }
                comboBox1.SelectedIndex = 0;
                DocAge.Text = age;
                DocDep.Text = department;
                DrName.Text = Fname + " " + Lname;
                DocPhone.Text = phone;
                DocShiftFromTo.Text = "From: " + shift_from + " To: " + shift_to;
                dataGridView1.DataSource = c.availableappointments(shift_from,shift_to,comboBox1.SelectedItem.ToString(), Dssn);
                dataGridView1.Refresh();
            }
            
            button2.Enabled = false;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Explore ex = new Explore();
            ex.Show();
            Close(); 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button2.Enabled= false;
            Book b = new Book(Dssn, comboBox1.SelectedItem.ToString(), shiftAppoints);
            b.Show();
            Close();
        }


        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void DoctorInfo_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellEventArgs e)
        {
            int indexi = e.RowIndex;     //get clicked row index
            if (indexi >= 0)               //check if this row in table
            {
                DataGridViewRow selRow = dataGridView1.Rows[indexi];    //store row
                shiftAppoints =selRow.Cells[0].Value.ToString();
                button2.Enabled = true;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataGridView1.DataSource = c.availableappointments(shift_from, shift_to, comboBox1.SelectedItem.ToString(), Dssn);
            dataGridView1.Refresh();
        }
    }
}
