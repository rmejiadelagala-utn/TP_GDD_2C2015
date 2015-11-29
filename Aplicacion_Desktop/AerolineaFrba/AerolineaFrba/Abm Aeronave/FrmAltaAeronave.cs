using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AerolineaFrba.Abm_Aeronave
{
    public partial class FrmAltaAeronave : Template.FrmAltaModificacion
    {
        public FrmAltaAeronave()
        {
            InitializeComponent();
            InitializeComboBox();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void InitializeComboBox()
        {
            Conexion cnn = new Conexion();
            cnn.Abrir();
            DataTable dt1 = cnn.EjecutarConsulta("select Mod_ID, Mod_Nombre from SFX.t_modelos");
            cmbBoxModelo.DataSource = dt1.DefaultView;
            cmbBoxModelo.DisplayMember = "Mod_Nombre";
            cmbBoxModelo.ValueMember = "Mod_id";
            cmbBoxModelo.SelectedIndex = -1;

            DataTable dt2 = cnn.EjecutarConsulta("select * from SFX.t_servicios");
            cmbBoxTipoServ.DataSource = dt2.DefaultView;
            cmbBoxTipoServ.DisplayMember = "Ser_Descripcion";
            cmbBoxTipoServ.ValueMember = "Ser_id";
            cmbBoxTipoServ.SelectedIndex = -1;

            cnn.Cerrar();
        }

        private void cmdGuardar_Click(object sender, EventArgs e)
        {
           
            
            try
            {
                Conexion cnn = new Conexion();

                cnn.ArmarProcedimiento("SFX.InsertarAeronave");

                cnn.AgregarParametro("@matricula", txtMatricula.Text);
                cnn.AgregarParametro("@mod_id",  cmbBoxModelo.SelectedValue);
                cnn.AgregarParametro("@kg_disponibles", txtKg.Text);
                cnn.AgregarParametro("@cantPasillo", txtPasillo.Text);
                cnn.AgregarParametro("@cantVentanilla", txtVentanilla.Text);
                cnn.AgregarParametro("@ser_id", cmbBoxTipoServ.SelectedValue);

                cnn.Abrir();
                
                cnn.EjecutarProcedimiento();

                cnn.Cerrar();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void cmdLimpiar_Click(object sender, EventArgs e)
        {
            
            InitializeComboBox();

            foreach (Control control in this.grdCampos.Controls)
            {
                if (control is TextBox)
                {
                    control.Text = "";
                }
            }
            this.txtMatricula.Focus();
        }
    }
}
