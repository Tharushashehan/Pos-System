using Services.GridForms;
using Services.Payments;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Services
{
    public partial class GRN : Form
    {
        string Documentid = Guid.NewGuid().ToString();
        private GetItemCodes GetItemCode;
        private ChequeGRN GRNCheque;
        private Supplier_Details SD;
        public static string GRNDocumentID;


        public GRN()
        {
            InitializeComponent();

            GetItemCode = new GetItemCodes();
            GetItemCode.FormClosed += new FormClosedEventHandler(GetItemCode_FormClosed);

            GRNCheque = new ChequeGRN();
            GRNCheque.FormClosed += new FormClosedEventHandler(GRNCheque_FormClosed);

            SD = new Supplier_Details();
            SD.FormClosed += new FormClosedEventHandler(SD_FormClosed);

        }

        private void SD_FormClosed(object sender, FormClosedEventArgs e)
        {
            textBoxSUPID.Text = SD.SUpCode;
            textBoxSUPName.Text = SD.SupName;
            
        }

        private void GRNCheque_FormClosed(object sender, FormClosedEventArgs e)
        {
            textBoxChequeAmount.Text = GRNCheque.totalCheque;
            Calculation();
        }

        private void GetItemCode_FormClosed(object sender, FormClosedEventArgs e)
        {
            textBoxItemCode.Text = GetItemCode.ItemCode;
            textBoxItemName.Text = GetItemCode.ItemName;
            textBoxCost.Text = GetItemCode.CostForGRN;
            labelDocID.Text = Documentid;
            textBoxSUPID.Enabled = false;
            textBoxItemCode.Enabled = false;
            textBoxItemName.Enabled = false;
        }

        private void GRN_Load(object sender, EventArgs e)
        {
            labelDocID.Text = Documentid;
            labelDocID.Visible = false;
            if(Permission.GRNDiscountChange == "DEACTIVE")
            {
                textBoxDiscount.Enabled = false;
            }
            if(Permission.GRNCostChange == "DEACTIVE")
            {
                textBoxCost.Enabled = false;
            }
            if(Permission.GRNOldView == "DEACTIVE")
            {
                buttonGrn.Enabled = false;
            }
            if(Permission.GRNSave == "DEACTIVE")
            {
                buttonSave.Enabled = false;
            }

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            GetItemCode.ShowDialog();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Addtogrid();
        }
        public void Addtogrid()
        {
            try
            {
                if(textBoxSUPID.Text != "")
                {
                    pictureBox2.Enabled = false;
                }
                if(textBoxCost.Text == "")
                {
                    MessageBox.Show("Please Fill Cost");
                }
                else if(textBoxQuentity.Text == "")
                {
                    MessageBox.Show("Please Fill Quentity");
                }
                else if(textBoxAmount.Text == "")
                {
                    MessageBox.Show("Please Fill Amount");
                }
                else if(textBoxItemCode.Text == "")
                {
                    MessageBox.Show("Please Fill Item Code");
                }
                else
                {
                    int row = 0;
                    dataGridView1.Rows.Add();
                    row = dataGridView1.Rows.Count - 2;
                    for(int i = 0; i <= dataGridView1.Rows.Count - 2; i++)
                    {
                        dataGridView1["ItemName",row].Value = textBoxItemName.Text;
                        dataGridView1["ItemCost",row].Value = textBoxCost.Text;
                        dataGridView1["ItemQuentity",row].Value = textBoxQuentity.Text;
                        dataGridView1["Amount",row].Value = textBoxAmount.Text;
                        dataGridView1["ItemCode",row].Value = textBoxItemCode.Text;
                        // total += Convert.ToDecimal(dataGridView1["Amount", row].Value);
                    }
                    //   textBoxItemAmount.Text = total.ToString();

                    decimal Total = 0;

                    for(int i = 0; i < dataGridView1.Rows.Count; i++)
                    {
                        Total += Convert.ToDecimal(dataGridView1.Rows[i].Cells["Amount"].Value);
                    }

                    textBoxItemAmount.Text = Total.ToString();
                    textBoxAmount.Clear();
                    textBoxCost.Clear();
                    textBoxItemCode.Clear();
                    textBoxQuentity.Clear();
                    textBoxItemName.Clear();
                }
            }
            catch(Exception EX)
            {
                MessageBox.Show(EX.Message);
            }
        }
        private void textBoxChequeAmount_Click(object sender, EventArgs e)
        {
            GRNDocumentID = labelDocID.Text;
            GRNCheque.ShowDialog();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            SD.ShowDialog();

        }

        private void textBoxQuentity_KeyUp(object sender, KeyEventArgs e)
        {
            CalculationFN01();
            if(e.KeyCode == Keys.Enter)
            {
                Addtogrid();
                textBoxItemName.Clear();
                textBoxItemCode.Clear();
                textBoxQuentity.Clear();
                textBoxDiscount.Clear();
                textBoxAmount.Clear();
                textBoxCost.Clear();
                textBoxItemCode.Focus();
                e.Handled = true;
            }
        }
        public void CalculationFN01()
        {
            try
            {
                decimal Cost = 0;
                decimal Quentity = 0;
                decimal Amount = 0;
                if (textBoxCost.Text == "")
                {
                    Cost = 0;
                }
                else
                {
                    Cost = Convert.ToDecimal(textBoxCost.Text);
                }
                if (textBoxQuentity.Text == "")
                {
                    Quentity = 0;
                }
                else
                {
                    Quentity = Convert.ToDecimal(textBoxQuentity.Text);
                }
                if (textBoxAmount.Text == "")
                {
                    Amount = 0;
                }
                Amount = Quentity * Cost;
                textBoxAmount.Text = Amount.ToString("N");
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }
        public void Calculation()
        {
            decimal total = 0;
            decimal CashPayment = 0;
            decimal ChequePayment = 0;
            decimal BalanceToCS = 0;

            if (textBoxItemAmount.Text == "")
            {
                total = 0;
            }
            else
            {
                total = Convert.ToDecimal(textBoxItemAmount.Text);
            }

            if (textBoxPaidCash.Text == "")
            {
                CashPayment = 0;
            }
            else
            {
                CashPayment = Convert.ToDecimal(textBoxPaidCash.Text);

            }

            if (textBoxChequeAmount.Text == "")
            {
                ChequePayment = 0;
            }
            else
            {
                ChequePayment = Convert.ToDecimal(textBoxChequeAmount.Text);

            }

            BalanceToCS = (CashPayment + ChequePayment) - total;
            labelBalance.Text = BalanceToCS.ToString();
        }

        private void textBoxPaidCash_KeyUp(object sender, KeyEventArgs e)
        {
            Calculation();
        }

        private void textBoxChequeAmount_KeyUp(object sender, KeyEventArgs e)
        {
            Calculation();
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            string Documentid = Guid.NewGuid().ToString();
            if (textBoxSUPID.Text == "")
            {
                MessageBox.Show("Please Select Supplier");
            }
            else
            {
                SaveGRNeDetails();
            }

        }
        public void SaveGRNeDetails()
        {
            try
            {
                int rows = dataGridView1.Rows.Count;
                for (int i = 0; rows - 1 > i; i++)

                {
                    ProjectConnection Newconnection = new ProjectConnection();
                    Newconnection.Connection_Today();
                    SqlCommand comm = new SqlCommand();
                    comm.Connection = ProjectConnection.conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "GRN.Save_GRN_Details_Temp";
                    comm.Parameters.AddWithValue("@ID", Documentid.ToString());
                    comm.Parameters.AddWithValue("@Item_Code", (dataGridView1.Rows[i].Cells["ItemCode"].Value).ToString());
                    comm.Parameters.AddWithValue("@Selling_Price", Convert.ToDecimal((dataGridView1.Rows[i].Cells["ItemCost"].Value).ToString()));
                    comm.Parameters.AddWithValue("@Quantity", Convert.ToDecimal((dataGridView1.Rows[i].Cells["ItemQuentity"].Value).ToString()));
                    comm.Parameters.AddWithValue("@Amount", Convert.ToDecimal((dataGridView1.Rows[i].Cells["Amount"].Value).ToString()));
                    comm.ExecuteNonQuery();
                }
                SaveGRNHeader();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Code GRN-01 \nTry Again with Correct Inputs \n" + ex.Message);
            }
        }
        public void SaveGRNHeader()
        {
            try
            {
                ProjectConnection Newconnection = new ProjectConnection();
                Newconnection.Connection_Today();
                SqlCommand comm = new SqlCommand();
                comm.Connection = ProjectConnection.conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "GRN.Save_GRN_Details ";
                comm.Parameters.AddWithValue("@ID", Documentid.ToString());
                comm.Parameters.AddWithValue("@Sup_Code", textBoxSUPID.Text);
                comm.Parameters.AddWithValue("@Doc_Date", Convert.ToDateTime(dateTimePickerTranDate.Text));
                comm.Parameters.AddWithValue("@Total_Amount ", Convert.ToDecimal(textBoxItemAmount.Text));
                if (textBoxPaidCash.Text == "")
                {
                    comm.Parameters.AddWithValue("@Cash_Payment", 0);
                }
                else
                {
                    comm.Parameters.AddWithValue("@Cash_Payment", Convert.ToDecimal(textBoxPaidCash.Text));
                }
                if (textBoxChequeAmount.Text == "")
                {
                    comm.Parameters.AddWithValue("@Cheque_Payment", 0);
                }
                else
                {
                    comm.Parameters.AddWithValue("@Cheque_Payment", Convert.ToDecimal(textBoxChequeAmount.Text));
                }
                comm.ExecuteNonQuery();
                MessageBox.Show("Successfully");
                Clear();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Code GRNH-01 \nTry Again with Correct Inputs \n" + ex.Message);
            }
        }

        private void buttonGrn_Click(object sender, EventArgs e)
        {
            GRNHistory GH = new GRNHistory();
            GH.Show();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBoxItemCode_KeyUp(object sender,KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                LoadItemDetailsBarcode();
                textBoxQuentity.Focus();
                e.Handled = true;
            }
        }
        public void LoadItemDetailsBarcode()
        {
            try
            {
                ProjectConnection Newconnection = new ProjectConnection();
                Newconnection.Connection_Today();
                SqlCommand comm = new SqlCommand();
                comm.Connection = ProjectConnection.conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "Stock.Search_Items";
                comm.Parameters.AddWithValue("@Search_Condition",textBoxItemCode.Text);
                SqlDataReader dr;
                dr = comm.ExecuteReader();
                if(dr.HasRows == true)
                {
                    dr.Read();
                    textBoxItemCode.Text = dr["Item Code"].ToString();
                    textBoxItemName.Text = dr["Item Name"].ToString();
                    textBoxCost.Text = dr["Selling_Price"].ToString();
                    dr.Close();
                }
            }
            catch(Exception)
            {
                MessageBox.Show("Error Loading Customer Details");
            }
        }

        private void buttonClear_Click(object sender,EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            textBoxAmount.Clear();
            textBoxChequeAmount.Clear();
            textBoxCost.Clear();
            textBoxSUPID.Clear();
            textBoxSUPName.Clear();
            textBoxQuentity.Clear();
            textBoxItemAmount.Clear();
            textBoxItemName.Clear();
            labelBalance.Text = "Balance";
            pictureBox2.Enabled = true;
            this.dataGridView1.Rows.Clear();
        }
    }
}
