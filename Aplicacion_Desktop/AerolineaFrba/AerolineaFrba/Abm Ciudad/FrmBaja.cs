using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AerolineaFrba.Abm_Ciudad
{
    public partial class FrmBaja : Template.FrmListadoTemplate
    {
        public FrmBaja()
        {
            InitializeComponent();
        }

        private void FrmBaja_Load(object sender, EventArgs e)
        {

        }

        private void cmdBuscar_Click(object sender, EventArgs e)
        {
            //Conexion cn = new Conexion();
            SqlCommand cmd; //SqlConnection cn;
            SqlConnection cn = new SqlConnection(@"Data Source=localhost\SQLSERVER2012;Initial Catalog=GD2C2015;User ID=gd;Password=gd2015");
            cn.Open();
            if (this.txtCiudadEliminar.Text == "")
            {
                cmd = new SqlCommand("Select * from SFX.t_ciudades_aeropuertos", cn);
            }
            else
            {
                cmd = new SqlCommand("Select * from SFX.t_ciudades_aeropuertos where Cia_Descripcion=" + "'" + this.txtCiudadEliminar.Text + "';", cn);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.dataGridView1.DataSource = dt;
            cn.Close();
        }

        private void cmdLimpiar_Click(object sender, EventArgs e)
        {
            foreach (Control control in this.grdFiltros.Controls)
            {
                if (control is TextBox)
                {
                    control.Text = "";
                }
            }
            this.txtCiudadEliminar.Focus();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void grdFiltros_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
