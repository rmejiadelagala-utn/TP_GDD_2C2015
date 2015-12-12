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
    public partial class FrmBajaAeronave : Template.FrmListadoTemplate
    {
        DataGridViewButtonColumn Boton = new DataGridViewButtonColumn();
        public FrmBajaAeronave()
        {
            InitializeComponent();
            txtBoxMatricula.Focus();
            InicializarFiltrosBusqueda();
            InitializeComboBox();
        }

        private void FormBajaAeronave_Load(object sender, EventArgs e)
        {
            CargarDataGrid();
            Boton.Name = "Eliminar";
            this.dgvBajaAeronave.Columns.Add(Boton);
            this.txtBoxMatricula.Focus();
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
            this.txtBoxMatricula.Focus();
        }

        private void CargarDataGrid()
        {
            Object matricula = txtBoxMatricula.Text;
            Object fabricante= cmbBoxFabricante.SelectedValue;
            Object modelo = cmbBoxModelo.SelectedValue;
            if (fabricante == null)
            {
                fabricante= ' ';
                modelo = ' ';
            }

                Conexion cnn = new Conexion();
                cnn.Abrir();
                cnn.ArmarProcedimiento("SFX.BuscarAeronave");
                cnn.AgregarParametro("Matricula", matricula.ToString());
                cnn.AgregarParametro("Fabricante", fabricante.ToString());
                cnn.AgregarParametro("Modelo", modelo.ToString());
            // en producción retirar este messageBox
                MessageBox.Show("El valor de Matricula seleccionado es: " + matricula.ToString() + "\n"
                    + "El valor de Fabricante seleccionado es: " + fabricante.ToString() + "\n"
                    + "El modelo seleccionado es: " + modelo.ToString());
                try
                {
                    cnn.LoadDataGridView(dgvBajaAeronave);
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
           this.CargarDataGrid();
           
        }

        private void cmdLimpiar_Click(object sender, EventArgs e)
        {
            InicializarFiltrosBusqueda();
            InitializeComboBox();
        }

        private void dgvBajaAeronave_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            MessageBox.Show("se dara de baja aeronave id =" + dgvBajaAeronave.Columns[e.ColumnIndex].Name);
            if (this.dgvBajaAeronave.Columns[e.ColumnIndex].Name == "Eliminar")
            {
                MessageBox.Show("se dara de baja aeronave id =" + dgvBajaAeronave.Rows[e.RowIndex].Cells["Aer_ID"].Value);
                Conexion cnn = new Conexion();

                cnn.ArmarProcedimiento("SFX.BajaAeronave");

                cnn.AgregarParametro("@ID", dgvBajaAeronave.Rows[e.RowIndex].Cells["Aer_ID"].Value);

                cnn.Abrir();

                cnn.EjecutarProcedimiento();

                cnn.Cerrar();

            }
        }

        private void dgvBajaAeronave_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            MessageBox.Show("se dara de baja aeronave id =" + dgvBajaAeronave.Columns[e.ColumnIndex].Name);
            if (this.dgvBajaAeronave.Columns[e.ColumnIndex].Name == "Eliminar")
            {
                MessageBox.Show("se dara de baja aeronave id =" + dgvBajaAeronave.Rows[e.RowIndex].Cells["Aer_ID"].Value);
                Conexion cnn = new Conexion();

                cnn.ArmarProcedimiento("SFX.BajaAeronave");

                cnn.AgregarParametro("@ID", dgvBajaAeronave.Rows[e.RowIndex].Cells["Aer_ID"].Value);

                cnn.Abrir();

                cnn.EjecutarProcedimiento();

                cnn.Cerrar();

            }
        }
    }
}
