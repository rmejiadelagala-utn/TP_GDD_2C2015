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
    public partial class FrmModificacionAeronave : Template.FrmListadoTemplate
    {
        DataGridViewButtonColumn Boton = new DataGridViewButtonColumn();
        
        public FrmModificacionAeronave()
        {
            InitializeComponent();
            txtBoxMatricula.Focus();
            InicializarFiltrosBusqueda();
        }
        private void InicializarFiltrosBusqueda()
        {
            foreach (Control control in this.grdFiltros.Controls)
            {
                if (control is TextBox)
                {
                    control.Text = "";
                }
            }
            InitializeComboBox();
            this.txtBoxMatricula.Focus();
        }

        private void CargarDataGrid()
        {
            Object matricula = txtBoxMatricula.Text;
            Object fabricante = cmbBoxFabricante.SelectedValue;
            Object modelo = cmbBoxModelo.SelectedValue;
            if (fabricante == null)
            {
                fabricante = ' ';
                modelo = ' ';
            }

            Conexion cnn = new Conexion();
            cnn.Abrir();
            cnn.ArmarProcedimiento("SFX.BuscarAeronave");
            cnn.AgregarParametro("Matricula", matricula.ToString());
            cnn.AgregarParametro("Fabricante", fabricante.ToString());
            cnn.AgregarParametro("Modelo", modelo.ToString());
            try
            {
                cnn.LoadDataGridView(dgvModificacionAeronave);
                cnn.Cerrar();
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo hacer la consulta a la base de datos" + ex.ToString());
            }
        }

        private void InitializeComboBox()
        {
            Conexion cnn = new Conexion();
            cnn.Abrir();
            //Cargar comboBox Fabricante
            DataTable dt1 = cnn.EjecutarConsulta("SELECT * FROM SFX.t_fabricantes");
            cmbBoxFabricante.DataSource = dt1.DefaultView;
            cmbBoxFabricante.DisplayMember = "Fab_Nombre";
            cmbBoxFabricante.ValueMember = "Fab_ID";
            cmbBoxFabricante.SelectedIndex = -1;

            //Cargar comboBox Modelo
            DataTable dt2 = cnn.EjecutarConsulta("SELECT Mod_ID, (Mod_Nombre +' '+ Fab_Nombre) as Modelo_Fabricante  FROM SFX.t_modelos, SFX.t_fabricantes WHERE Fab_ID=Mod_ID");
            cmbBoxModelo.DataSource = dt2.DefaultView;
            cmbBoxModelo.DisplayMember = "Modelo_Fabricante";
            cmbBoxModelo.ValueMember = "Mod_id";
            cmbBoxModelo.SelectedIndex = -1;

            cnn.Cerrar();

        }

        private void cmdBuscar_Click(object sender, EventArgs e)
        {
            
            Boton.Name = "Modificar";
            if (dgvModificacionAeronave.Columns.Contains(Boton))
            {
                this.dgvModificacionAeronave.Columns.Remove(Boton);
                this.CargarDataGrid();
                this.dgvModificacionAeronave.Columns.Add(Boton);
            }
            else
            {
                this.CargarDataGrid();
                this.dgvModificacionAeronave.Columns.Add(Boton);
            }
        }

        private void limpiarDataGrid()
        {
            if (dgvModificacionAeronave != null)
            {
                dgvModificacionAeronave.Columns.Remove(Boton);
                dgvModificacionAeronave = null;
            }
        }

        private void cmdLimpiar_Click(object sender, EventArgs e)
        {
            InicializarFiltrosBusqueda();
            InitializeComboBox();
        }

        private void dgvModificacionAeronave_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (this.dgvModificacionAeronave.Columns[e.ColumnIndex].Name == "Modificar")
            {
                FrmAltaModifAeronave avionSel = new FrmAltaModifAeronave();
                Object aero_ID = dgvModificacionAeronave.Rows[e.RowIndex].Cells["Aer_ID"].Value;
                MessageBox.Show("avion seleccionado, Aer_ID= " + aero_ID.ToString() );
                avionSel.mostrarAeronaveSeleccionada(aero_ID.ToString());
                avionSel.Show();

            }
        }

    }
}
