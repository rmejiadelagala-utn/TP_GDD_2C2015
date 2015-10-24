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
    }
}
