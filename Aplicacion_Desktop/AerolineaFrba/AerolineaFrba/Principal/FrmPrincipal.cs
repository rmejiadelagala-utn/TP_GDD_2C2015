using AerolineaFrba.Abm_Rol;
using AerolineaFrba.Registro_de_Usuario;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AerolineaFrba.Principal;
using AerolineaFrba.Abm_Ciudad;
using AerolineaFrba.Compra;

namespace AerolineaFrba.Principal
{
    public partial class FrmPrincipal : Form
    {
        public FrmPrincipal()
        {
            InitializeComponent();
        }

        private void Principal_Load(object sender, EventArgs e)
        {

        }

        private void funcionalidadesToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void tiposDeServiciosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmUsuarios c = new FrmUsuarios();
            c.Show();
        }

        private void rolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmListadoRol c = new FrmListadoRol();
            c.Show();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void ciudadesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmAltaCiudad c = new FrmAltaCiudad();
            c.Show();
        }

        private void modificacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmListadoCiudad c = new FrmListadoCiudad();
            c.Show();
        }

        private void altaModificaciónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmAltaCiudad c = new FrmAltaCiudad();
            c.Show();
        }

        private void bajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmBaja c = new FrmBaja();
            c.Show();
        }

        private void listadoToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmListadoCiudad c = new FrmListadoCiudad();
            c.Show();

        }

        private void realizarComprarToolStripMenuItem_Click(object sender, EventArgs e)
        {
  
        }

        private void pasajesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmPasaje pas = new FrmPasaje();
            pas.Show();
        }
    }
}
