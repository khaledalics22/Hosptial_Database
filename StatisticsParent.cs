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
    public partial class StatisticsParent : Form
    {
        public StatisticsParent()
        {
            InitializeComponent();
        }

        private void StatisticsParent_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Statistics statistics = new Statistics();
            statistics.Show();
            Close(); 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Income i = new Income(); 
            i.Show();
            Close(); 
        }

        private void button3_Click(object sender, EventArgs e)
        {
            HealthStatistics hs = new HealthStatistics();
            hs.Show();
            Close(); 
        }
    }
}
