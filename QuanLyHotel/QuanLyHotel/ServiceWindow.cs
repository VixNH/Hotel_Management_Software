﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using serviceBUS;
using serviceDTO;


namespace QuanLyHotel
{
    public partial class ServiceWindow : UserControl
    {
        public ServiceWindow()
        {
            InitializeComponent();
        }

        //Service
        private void loadData()
        {
            ServiceBUS ctmBus = new ServiceBUS();
            List<ServiceDTO> list = ctmBus.select();

            if (list == null)
            {
                MessageBox.Show("Fail");
                return;
            }
            dtgvService.Columns.Clear();
            dtgvService.DataSource = null;

            dtgvService.AutoGenerateColumns = false;
            dtgvService.AllowUserToAddRows = false;
            dtgvService.DataSource = list;

            DataGridViewTextBoxColumn nAME = new DataGridViewTextBoxColumn();
            nAME.Name = "nAME";
            nAME.HeaderText = "Name:";
            nAME.DataPropertyName = "nAME";
            nAME.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgvService.Columns.Add(nAME);

            DataGridViewTextBoxColumn kIND = new DataGridViewTextBoxColumn();
            kIND.Name = "kINd";
            kIND.HeaderText = "KIND";
            kIND.DataPropertyName = "kINd";
            kIND.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgvService.Columns.Add(kIND);

            DataGridViewTextBoxColumn cOST = new DataGridViewTextBoxColumn();
            cOST.Name = "cOST";
            cOST.HeaderText = "COST";
            cOST.DataPropertyName = "cOST";
            cOST.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgvService.Columns.Add(cOST);


            CurrencyManager myCurrencyManager = (CurrencyManager)this.BindingContext[dtgvService.DataSource];
            myCurrencyManager.Refresh();


        }
        private void BtAddService_Click(object sender, EventArgs e)
        {

            ServiceBUS srvBUS = new ServiceBUS();
            ServiceDTO srv = new ServiceDTO();
            srv.NAME = txtNameService.Text;
            srv.KIND = txtKindService.Text;
            srv.COST = Decimal.Parse(txtCostService.Text);
            bool kq = srvBUS.add(srv);
            if (kq == false)
                MessageBox.Show("Fail!");
            else
                MessageBox.Show("Sussces");
            this.loadData();
        }

        private void BtEditService_Click(object sender, EventArgs e)
        {
            ServiceBUS srvBUS = new ServiceBUS();
            ServiceDTO srv = new ServiceDTO();
            srv.NAME = txtNameService.Text;
            srv.KIND = txtKindService.Text;
            srv.COST = Decimal.Parse(txtCostService.Text);
            bool kq = srvBUS.edit(srv);
            if (kq == false)
                MessageBox.Show("Fail!");
            else
                MessageBox.Show("Sussces");
            this.loadData();
        }

        private void BtDeleteService_Click(object sender, EventArgs e)
        {
            ServiceBUS srvBUS = new ServiceBUS();
            ServiceDTO srv = new ServiceDTO();
            srv.NAME = txtNameService.Text;
            srv.KIND = txtKindService.Text;
            srv.COST = Decimal.Parse(txtCostService.Text);
            bool kq = srvBUS.delete(srv);
            if (kq == false)
                MessageBox.Show("Fail!");
            else
                MessageBox.Show("Sussces");
            this.loadData();
        }

        private void BtLoadService_Click(object sender, EventArgs e)
        {
            //this.loadData();
        }




        //Use service

        private void DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //int numrow;
            //numrow = e.RowIndex;
            //txtIDR.Text = dataGridView1.Rows[numrow].Cells[1].Value.ToString();
        }

        private void DataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //int numrow;
            //numrow = e.RowIndex;
            //txtIDS.Text = dataGridView1.Rows[numrow].Cells[1].Value.ToString();
        }

        private void BtUsedService_Click(object sender, EventArgs e)
        {
            //RoomServiceBUS rsBUS = new RoomServiceBUS();
            //RoomServiceDTO rs = new RoomServiceDTO();
            //rs.IDR_S = "";
            //rs.IDR = txtIDR.Text;
            //rs.IDS = txtIDS.Text;
            //rs.TIME = DateTime.Parse(dtDateService.Text);
            //rs.NUMBER = int.Parse(txtNumberService.Text);
            //rs.COST = 1* int.Parse(txtNumberService.Text);         //công thức lấy cost service
        }

        private void BtAddKind_Click(object sender, EventArgs e)
        {
            //txtKindService.Items.Add(txtKind.Text);
        }
    }
}
