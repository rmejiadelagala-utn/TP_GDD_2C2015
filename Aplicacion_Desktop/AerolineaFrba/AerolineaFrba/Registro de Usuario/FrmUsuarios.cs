using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace AerolineaFrba.Registro_de_Usuario
{
    public partial class FrmUsuarios : Form
    {
        public FrmUsuarios()
        {
            InitializeComponent();
        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblNombre_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void cmdCrear_Click(object sender, EventArgs e)
        {
            try
            {
                /*
                string ConnectionString = @"Data Source=HERN-PC\SQLSERVER2012;Initial Catalog=GD2C2015;User ID=gd;Password=gd2015";

                SqlConnection cnn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("InsertarUsuario", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                
                //cmd.Parameters.Add("@nombre", SqlDbType.Char, 8);
                //cmd.Parameters.Add("@password", SqlDbType.Char, 20);
                //cmd.Parameters.Add("@pregunta", SqlDbType.Char, 255);
                //cmd.Parameters.Add("@respuesta", SqlDbType.Char, 255);
                //cmd.Parameters["@nombre"].Value = txtNombre.Text;
                //cmd.Parameters["@password"].Value = txtPassword.Text;
                //cmd.Parameters["@pregunta"].Value = txtPregunta.Text;
                //cmd.Parameters["@respuesta"].Value = txtRespuesta.Text;

                cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@pregunta", txtPregunta.Text);
                cmd.Parameters.AddWithValue("@respuesta", txtRespuesta.Text);

                cnn.Open();
                int resultado = cmd.ExecuteNonQuery();
                MessageBox.Show("Datos insertados: " + resultado.ToString());
                cnn.Close();
                */

                Conexion cnn = new Conexion();

                cnn.ArmarProcedimiento("InsertarUsuario");

                cnn.AgregarParametro("@nombre", txtNombre.Text);
                cnn.AgregarParametro("@password", txtPassword.Text);
                cnn.AgregarParametro("@pregunta", txtPregunta.Text);
                cnn.AgregarParametro("@respuesta", txtRespuesta.Text);

                cnn.Abrir();
                
                cnn.EjecutarProcedimiento();

                cnn.Cerrar();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void FrmUsuarios_Load(object sender, EventArgs e)
        {

        }

        private void cmdCancelar_Click(object sender, EventArgs e)
        {

        }

        private void cmdCancelar_Click_1(object sender, EventArgs e)
        {
            foreach (Control control in this.groupBox1.Controls)
            {
                if (control is TextBox)
                {
                    control.Text = "";
                }
            }
            this.txtNombre.Focus();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
