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

namespace AerolineaFrba.Abm_Aeronave
{
    public partial class FrmAltaModifAeronave : Template.FrmAltaModificacion
    {
        public FrmAltaModifAeronave()
        {
            InitializeComponent();
        }

        public void mostrarAeronaveSeleccionada(string id)
        {
            Conexion cnn = new Conexion();
            cnn.Abrir();
            SqlDataReader dr = cnn.EjecutarDataReader(
                "SELECT Aer_Matricula,Mod_Nombre, Aer_KG_Disponibles, Ser_Descripcion,Aer_Fecha_Fuera_Servicio, Aer_Fecha_Reinicio_Servicio " +
                " FROM SFX.t_Aeronaves, SFX.t_modelos, SFX.t_servicios WHERE Aer_ID = " + id +
                " and Aer_Mod_ID=Mod_ID and Ser_ID=Aer_Ser_ID " );
            
            //Cargar textBoxMatricula
            txtBoxMatricula.Text = dr["Aer_Matricula"].ToString();
            txtBoxKgDisp.Text = dr["Aer_KG_Disponibles"].ToString();
            Object auxModelo = dr["Mod_Nombre"];
            Object auxServ = dr["Ser_Descripcion"];
            cnn.Cerrar();

            cnn.Abrir();
            DataTable dt1 = cnn.EjecutarConsulta("select Mod_ID, Mod_Nombre from SFX.t_modelos");
            cmbBoxModelo.DataSource = dt1.DefaultView;
            cmbBoxModelo.DisplayMember = "Mod_Nombre";
            cmbBoxModelo.Text = "elige un opcion"; //auxModelo.ToString();
            cmbBoxModelo.ValueMember = "Mod_id";
           // cmbBoxModelo.SelectedIndex = -1;
            cmbBoxModelo.SelectedText ="elige un opcion";
            cnn.Cerrar();

            MessageBox.Show("Q ver que le estoy asignando al seletedValue: " + auxServ.ToString());
            cnn.Abrir();
            DataTable dt2 = cnn.EjecutarConsulta("select Ser_ID, Ser_Descripcion from SFX.t_servicios");
            cmbBoxTipoServicio.DataSource = dt2.DefaultView;
            cmbBoxTipoServicio.DisplayMember = "Ser_Descripcion";
            cmbBoxTipoServicio.ValueMember = "Ser_id";
            int index = cmbBoxTipoServicio.FindString(auxServ.ToString());
            cmbBoxTipoServicio.SelectedIndex = index;
            cnn.Cerrar();
        }
    }
}