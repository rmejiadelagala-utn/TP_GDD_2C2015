using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AerolineaFrba.Registro_de_Usuario;
using AerolineaFrba.Principal;

namespace AerolineaFrba.Login
{
    public partial class FrmLogin : Form
    {
        public FrmLogin()
        {
            InitializeComponent();
            txtUsuario.Focus();
        }

        private void cmdRegistrarse_Click(object sender, EventArgs e)
        {
            
            FrmUsuarios c = new FrmUsuarios();
            c.Show();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FrmUsuarios c = new FrmUsuarios();
            c.Show();
        }

        private void cmdLogin_Click(object sender, EventArgs e)
        {
            
            try
            {

                Conexion cnn = new Conexion();

                cnn.ArmarFuncion("ExisteUsuario");

                cnn.AgregarParametro("@userName", txtUsuario.Text);
                cnn.AgregarParametro("@password", txtContra.Text);

                cnn.Abrir();

                int result = cnn.EjecutarFuncion();
                
                if (result > 0)
                {
                    FrmPrincipal f = new FrmPrincipal();
                    f.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Datos incorrectos...");
                    txtUsuario.Text = "";
                    txtContra.Text = "";
                }
                
                cnn.Cerrar();
            
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            txtUsuario.Select(0,0);
        }

        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
