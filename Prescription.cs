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
    public partial class Prescription : Form
    {
        Controller ctr;
        int AppointID = -1;
        int Pssn;
        public Prescription(int pID=507)
        {
            InitializeComponent();
            ctr = new Controller();
            Pssn = pID;
            dataGridView1.DataSource= ctr.GetPrevAppoint(Pssn);
            dataGridView1.Refresh();
        }

        //private void button1_Click(object sender, EventArgs e)
        //{
        //    if(AppointID!=-1)
        //    {
        //        PriscInfo prI = new PriscInfo(AppointID);
        //        prI.Show();
        //    }
            
        //}

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int indexi = e.RowIndex;     //get clicked row index
            if (indexi >= 0)               //check if this row in table
            {
                DataGridViewRow selRow = dataGridView1.Rows[indexi];
                AppointID = Convert.ToInt32(selRow.Cells[0].Value.ToString());
                dataGridView2.DataSource = ctr.GetApointMed(AppointID);
                dataGridView2.Refresh();
                textBox1.Text = ctr.GetAppDiag(AppointID).ToString();
            }
            else
            {
                AppointID = -1;
                dataGridView2.DataSource = null;
                textBox1.Text = " ";
            }
              
        }

        private void splitter1_SplitterMoved(object sender, SplitterEventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Patient p = new Patient();
            p.Show();
            Close(); 
        }
    }
}
