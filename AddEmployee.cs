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
    public partial class AddEmployee : Form
    {
        Controller controllerObj;
        Boolean NoDepartment;           //to store the value of the checkbox
        public AddEmployee()
        {
            InitializeComponent();
            controllerObj = new Controller();
            // initialize components
            DepartmentComboBox.DataSource = controllerObj.getNonMedicineDeps();
            DepartmentComboBox.DisplayMember = "Dname";
            GenderComboBox.SelectedIndex = 0;
            ShiftComboBox.SelectedIndex = 0;

        }

        // if checkbox changed -> change the state of the DepartmentComboBox
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            NoDepartment = DepartmentCheckBox.Checked;
            DepartmentComboBox.Enabled = !NoDepartment;
            if (NoDepartment)
                DepartmentComboBox.Text = null;
            else
            {
                DepartmentComboBox.SelectedIndex = 0;
            }

        }

        private void AddButton_Click(object sender, EventArgs e)
        {
            // validate the data and add the employee
            int Dno = (NoDepartment) ? -1 : (int)controllerObj.getDepartmentNumber(DepartmentComboBox.Text);
            try
            {
                if (!(SalaryTextBox.Text == "" || FnameTextBox.Text == "" || LnameTextBox.Text == ""
                    || AgeTextBox.Text == "" || JobTextBox.Text == "" || PhoneTextBox.Text == ""||pass.Text==""))
                {
                    int r = controllerObj.InsertEmployee(Convert.ToInt32(SSNTextBox.Text), FnameTextBox.Text,
                        LnameTextBox.Text, Convert.ToInt32(AgeTextBox.Text),
                       GenderComboBox.Text, Convert.ToInt32(SalaryTextBox.Text), CertificateTextBox.Text, JobTextBox.Text,
                       PhoneTextBox.Text, ShiftComboBox.Text, Dno,pass.Text.ToString());

                    if (r > 0)
                    {
                        MessageBox.Show("Inserted Successfully");
                        Close();
                    }
                    else
                        MessageBox.Show("Please Enter Valid Values");
                }
                else
                    MessageBox.Show("Please Enter Valid Values");
            }
            catch
            {
                MessageBox.Show("Please Enter Valid Values");
            }

        }

        private void DepartmentComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void AddEmployee_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Manager m = new Manager();
            m.Show();
            Close();
        }
    }
}
