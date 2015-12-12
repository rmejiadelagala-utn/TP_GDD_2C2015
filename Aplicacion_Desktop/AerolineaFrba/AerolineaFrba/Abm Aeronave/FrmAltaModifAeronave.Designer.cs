namespace AerolineaFrba.Abm_Aeronave
{
    partial class FrmAltaModifAeronave
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblMatricula = new System.Windows.Forms.Label();
            this.txtBoxMatricula = new System.Windows.Forms.TextBox();
            this.txtBoxKgDisp = new System.Windows.Forms.TextBox();
            this.lblKgDisponibles = new System.Windows.Forms.Label();
            this.dateTimePckFueraServicio = new System.Windows.Forms.DateTimePicker();
            this.dateTimePckReinicioServicio = new System.Windows.Forms.DateTimePicker();
            this.cmbBoxTipoServicio = new System.Windows.Forms.ComboBox();
            this.lblFechaFueraServ = new System.Windows.Forms.Label();
            this.lblFechaReinicioServ = new System.Windows.Forms.Label();
            this.lblTipoServicio = new System.Windows.Forms.Label();
            this.cmbBoxModelo = new System.Windows.Forms.ComboBox();
            this.lblModelo = new System.Windows.Forms.Label();
            this.txtBoxCantButPasillo = new System.Windows.Forms.TextBox();
            this.txtBoxCantButVentan = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.grdCampos.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Location = new System.Drawing.Point(360, 302);
            // 
            // grdCampos
            // 
            this.grdCampos.Controls.Add(this.label2);
            this.grdCampos.Controls.Add(this.label1);
            this.grdCampos.Controls.Add(this.txtBoxCantButVentan);
            this.grdCampos.Controls.Add(this.txtBoxCantButPasillo);
            this.grdCampos.Controls.Add(this.cmbBoxModelo);
            this.grdCampos.Controls.Add(this.lblModelo);
            this.grdCampos.Controls.Add(this.lblTipoServicio);
            this.grdCampos.Controls.Add(this.lblFechaReinicioServ);
            this.grdCampos.Controls.Add(this.lblFechaFueraServ);
            this.grdCampos.Controls.Add(this.cmbBoxTipoServicio);
            this.grdCampos.Controls.Add(this.dateTimePckReinicioServicio);
            this.grdCampos.Controls.Add(this.dateTimePckFueraServicio);
            this.grdCampos.Controls.Add(this.lblKgDisponibles);
            this.grdCampos.Controls.Add(this.txtBoxKgDisp);
            this.grdCampos.Controls.Add(this.txtBoxMatricula);
            this.grdCampos.Controls.Add(this.lblMatricula);
            this.grdCampos.Size = new System.Drawing.Size(436, 273);
            // 
            // lblMatricula
            // 
            this.lblMatricula.AutoSize = true;
            this.lblMatricula.Location = new System.Drawing.Point(18, 35);
            this.lblMatricula.Name = "lblMatricula";
            this.lblMatricula.Size = new System.Drawing.Size(50, 13);
            this.lblMatricula.TabIndex = 0;
            this.lblMatricula.Text = "Matricula";
            // 
            // txtBoxMatricula
            // 
            this.txtBoxMatricula.Location = new System.Drawing.Point(86, 28);
            this.txtBoxMatricula.Name = "txtBoxMatricula";
            this.txtBoxMatricula.Size = new System.Drawing.Size(100, 20);
            this.txtBoxMatricula.TabIndex = 1;
            // 
            // txtBoxKgDisp
            // 
            this.txtBoxKgDisp.Location = new System.Drawing.Point(321, 63);
            this.txtBoxKgDisp.Name = "txtBoxKgDisp";
            this.txtBoxKgDisp.Size = new System.Drawing.Size(100, 20);
            this.txtBoxKgDisp.TabIndex = 2;
            // 
            // lblKgDisponibles
            // 
            this.lblKgDisponibles.AutoSize = true;
            this.lblKgDisponibles.Location = new System.Drawing.Point(225, 69);
            this.lblKgDisponibles.Name = "lblKgDisponibles";
            this.lblKgDisponibles.Size = new System.Drawing.Size(77, 13);
            this.lblKgDisponibles.TabIndex = 3;
            this.lblKgDisponibles.Text = "Kg Disponibles";
            // 
            // dateTimePckFueraServicio
            // 
            this.dateTimePckFueraServicio.Location = new System.Drawing.Point(142, 189);
            this.dateTimePckFueraServicio.Name = "dateTimePckFueraServicio";
            this.dateTimePckFueraServicio.Size = new System.Drawing.Size(200, 20);
            this.dateTimePckFueraServicio.TabIndex = 4;
            // 
            // dateTimePckReinicioServicio
            // 
            this.dateTimePckReinicioServicio.Location = new System.Drawing.Point(142, 243);
            this.dateTimePckReinicioServicio.Name = "dateTimePckReinicioServicio";
            this.dateTimePckReinicioServicio.Size = new System.Drawing.Size(200, 20);
            this.dateTimePckReinicioServicio.TabIndex = 5;
            // 
            // cmbBoxTipoServicio
            // 
            this.cmbBoxTipoServicio.FormattingEnabled = true;
            this.cmbBoxTipoServicio.Location = new System.Drawing.Point(300, 27);
            this.cmbBoxTipoServicio.Name = "cmbBoxTipoServicio";
            this.cmbBoxTipoServicio.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxTipoServicio.TabIndex = 6;
            // 
            // lblFechaFueraServ
            // 
            this.lblFechaFueraServ.AutoSize = true;
            this.lblFechaFueraServ.Location = new System.Drawing.Point(33, 183);
            this.lblFechaFueraServ.Name = "lblFechaFueraServ";
            this.lblFechaFueraServ.Size = new System.Drawing.Size(90, 26);
            this.lblFechaFueraServ.TabIndex = 7;
            this.lblFechaFueraServ.Text = "Fecha \r\nFuera de Servicio";
            // 
            // lblFechaReinicioServ
            // 
            this.lblFechaReinicioServ.AutoSize = true;
            this.lblFechaReinicioServ.Location = new System.Drawing.Point(33, 237);
            this.lblFechaReinicioServ.Name = "lblFechaReinicioServ";
            this.lblFechaReinicioServ.Size = new System.Drawing.Size(101, 26);
            this.lblFechaReinicioServ.TabIndex = 8;
            this.lblFechaReinicioServ.Text = "Fecha \r\nReinicio de Servicio";
            // 
            // lblTipoServicio
            // 
            this.lblTipoServicio.AutoSize = true;
            this.lblTipoServicio.Location = new System.Drawing.Point(225, 31);
            this.lblTipoServicio.Name = "lblTipoServicio";
            this.lblTipoServicio.Size = new System.Drawing.Size(69, 13);
            this.lblTipoServicio.TabIndex = 9;
            this.lblTipoServicio.Text = "Tipo Servicio";
            // 
            // cmbBoxModelo
            // 
            this.cmbBoxModelo.FormattingEnabled = true;
            this.cmbBoxModelo.Location = new System.Drawing.Point(86, 63);
            this.cmbBoxModelo.Name = "cmbBoxModelo";
            this.cmbBoxModelo.Size = new System.Drawing.Size(100, 21);
            this.cmbBoxModelo.TabIndex = 15;
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(18, 69);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(45, 13);
            this.lblModelo.TabIndex = 14;
            this.lblModelo.Text = "Modelo:";
            // 
            // txtBoxCantButPasillo
            // 
            this.txtBoxCantButPasillo.Location = new System.Drawing.Point(163, 114);
            this.txtBoxCantButPasillo.Name = "txtBoxCantButPasillo";
            this.txtBoxCantButPasillo.Size = new System.Drawing.Size(100, 20);
            this.txtBoxCantButPasillo.TabIndex = 16;
            // 
            // txtBoxCantButVentan
            // 
            this.txtBoxCantButVentan.Location = new System.Drawing.Point(163, 140);
            this.txtBoxCantButVentan.Name = "txtBoxCantButVentan";
            this.txtBoxCantButVentan.Size = new System.Drawing.Size(100, 20);
            this.txtBoxCantButVentan.TabIndex = 17;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 117);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(124, 13);
            this.label1.TabIndex = 18;
            this.label1.Text = "Cantidad Butacas Pasillo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(18, 143);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(140, 13);
            this.label2.TabIndex = 19;
            this.label2.Text = "Cantidad Butacas Ventanilla";
            // 
            // FrmAltaModifAeronave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(460, 352);
            this.Name = "FrmAltaModifAeronave";
            this.Text = "FrmAltaModifAeronave";
            this.grdCampos.ResumeLayout(false);
            this.grdCampos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblTipoServicio;
        private System.Windows.Forms.Label lblFechaReinicioServ;
        private System.Windows.Forms.Label lblFechaFueraServ;
        private System.Windows.Forms.ComboBox cmbBoxTipoServicio;
        private System.Windows.Forms.DateTimePicker dateTimePckReinicioServicio;
        private System.Windows.Forms.DateTimePicker dateTimePckFueraServicio;
        private System.Windows.Forms.Label lblKgDisponibles;
        private System.Windows.Forms.TextBox txtBoxKgDisp;
        private System.Windows.Forms.TextBox txtBoxMatricula;
        private System.Windows.Forms.Label lblMatricula;
        private System.Windows.Forms.ComboBox cmbBoxModelo;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtBoxCantButVentan;
        private System.Windows.Forms.TextBox txtBoxCantButPasillo;

    }
}