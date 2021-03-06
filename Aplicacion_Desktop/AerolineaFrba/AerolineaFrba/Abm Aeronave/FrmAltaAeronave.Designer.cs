﻿namespace AerolineaFrba.Abm_Aeronave
{
    partial class FrmAltaAeronave
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
            this.txtPasillo = new System.Windows.Forms.TextBox();
            this.txtKg = new System.Windows.Forms.TextBox();
            this.txtMatricula = new System.Windows.Forms.TextBox();
            this.lblMatricula = new System.Windows.Forms.Label();
            this.lblModelo = new System.Windows.Forms.Label();
            this.lblkgDisponible = new System.Windows.Forms.Label();
            this.lblTipoServiciol = new System.Windows.Forms.Label();
            this.CantButPasillo = new System.Windows.Forms.Label();
            this.CantButVentanilla = new System.Windows.Forms.Label();
            this.txtVentanilla = new System.Windows.Forms.TextBox();
            this.cmbBoxTipoServ = new System.Windows.Forms.ComboBox();
            this.cmbBoxModelo = new System.Windows.Forms.ComboBox();
            this.grdCampos.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Click += new System.EventHandler(this.cmdGuardar_Click);
            // 
            // grdCampos
            // 
            this.grdCampos.Controls.Add(this.cmbBoxModelo);
            this.grdCampos.Controls.Add(this.cmbBoxTipoServ);
            this.grdCampos.Controls.Add(this.txtVentanilla);
            this.grdCampos.Controls.Add(this.CantButVentanilla);
            this.grdCampos.Controls.Add(this.CantButPasillo);
            this.grdCampos.Controls.Add(this.lblTipoServiciol);
            this.grdCampos.Controls.Add(this.lblkgDisponible);
            this.grdCampos.Controls.Add(this.lblModelo);
            this.grdCampos.Controls.Add(this.lblMatricula);
            this.grdCampos.Controls.Add(this.txtMatricula);
            this.grdCampos.Controls.Add(this.txtKg);
            this.grdCampos.Controls.Add(this.txtPasillo);
            // 
            // txtPasillo
            // 
            this.txtPasillo.Location = new System.Drawing.Point(147, 166);
            this.txtPasillo.Name = "txtPasillo";
            this.txtPasillo.Size = new System.Drawing.Size(100, 20);
            this.txtPasillo.TabIndex = 0;
            // 
            // txtKg
            // 
            this.txtKg.Location = new System.Drawing.Point(147, 94);
            this.txtKg.Name = "txtKg";
            this.txtKg.Size = new System.Drawing.Size(100, 20);
            this.txtKg.TabIndex = 2;
            // 
            // txtMatricula
            // 
            this.txtMatricula.Location = new System.Drawing.Point(147, 19);
            this.txtMatricula.Name = "txtMatricula";
            this.txtMatricula.Size = new System.Drawing.Size(100, 20);
            this.txtMatricula.TabIndex = 4;
            // 
            // lblMatricula
            // 
            this.lblMatricula.AutoSize = true;
            this.lblMatricula.Location = new System.Drawing.Point(21, 26);
            this.lblMatricula.Name = "lblMatricula";
            this.lblMatricula.Size = new System.Drawing.Size(53, 13);
            this.lblMatricula.TabIndex = 5;
            this.lblMatricula.Text = "Matricula:";
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(21, 62);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(45, 13);
            this.lblModelo.TabIndex = 6;
            this.lblModelo.Text = "Modelo:";
            // 
            // lblkgDisponible
            // 
            this.lblkgDisponible.AutoSize = true;
            this.lblkgDisponible.Location = new System.Drawing.Point(21, 101);
            this.lblkgDisponible.Name = "lblkgDisponible";
            this.lblkgDisponible.Size = new System.Drawing.Size(83, 13);
            this.lblkgDisponible.TabIndex = 7;
            this.lblkgDisponible.Text = "Kg Disponibles: ";
            // 
            // lblTipoServiciol
            // 
            this.lblTipoServiciol.AutoSize = true;
            this.lblTipoServiciol.Location = new System.Drawing.Point(21, 137);
            this.lblTipoServiciol.Name = "lblTipoServiciol";
            this.lblTipoServiciol.Size = new System.Drawing.Size(72, 13);
            this.lblTipoServiciol.TabIndex = 8;
            this.lblTipoServiciol.Text = "Tipo Servicio:";
            // 
            // CantButPasillo
            // 
            this.CantButPasillo.AutoSize = true;
            this.CantButPasillo.Location = new System.Drawing.Point(21, 173);
            this.CantButPasillo.Name = "CantButPasillo";
            this.CantButPasillo.Size = new System.Drawing.Size(104, 13);
            this.CantButPasillo.TabIndex = 9;
            this.CantButPasillo.Text = "Cant Butacas Pasillo";
            // 
            // CantButVentanilla
            // 
            this.CantButVentanilla.AutoSize = true;
            this.CantButVentanilla.Location = new System.Drawing.Point(21, 211);
            this.CantButVentanilla.Name = "CantButVentanilla";
            this.CantButVentanilla.Size = new System.Drawing.Size(120, 13);
            this.CantButVentanilla.TabIndex = 10;
            this.CantButVentanilla.Text = "Cant Butacas Ventanilla";
            // 
            // txtVentanilla
            // 
            this.txtVentanilla.Location = new System.Drawing.Point(147, 204);
            this.txtVentanilla.Name = "txtVentanilla";
            this.txtVentanilla.Size = new System.Drawing.Size(100, 20);
            this.txtVentanilla.TabIndex = 11;
            // 
            // cmbBoxTipoServ
            // 
            this.cmbBoxTipoServ.FormattingEnabled = true;
            this.cmbBoxTipoServ.Location = new System.Drawing.Point(147, 129);
            this.cmbBoxTipoServ.Name = "cmbBoxTipoServ";
            this.cmbBoxTipoServ.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxTipoServ.TabIndex = 12;
            // 
            // cmbBoxModelo
            // 
            this.cmbBoxModelo.FormattingEnabled = true;
            this.cmbBoxModelo.Location = new System.Drawing.Point(147, 54);
            this.cmbBoxModelo.Name = "cmbBoxModelo";
            this.cmbBoxModelo.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxModelo.TabIndex = 13;
            this.cmbBoxModelo.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // FrmAltaAeronave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 352);
            this.Name = "FrmAltaAeronave";
            this.Text = "Alta Aeronave";
            this.grdCampos.ResumeLayout(false);
            this.grdCampos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cmbBoxModelo;
        private System.Windows.Forms.ComboBox cmbBoxTipoServ;
        private System.Windows.Forms.TextBox txtVentanilla;
        private System.Windows.Forms.Label CantButVentanilla;
        private System.Windows.Forms.Label CantButPasillo;
        private System.Windows.Forms.Label lblTipoServiciol;
        private System.Windows.Forms.Label lblkgDisponible;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.Label lblMatricula;
        private System.Windows.Forms.TextBox txtMatricula;
        private System.Windows.Forms.TextBox txtKg;
        private System.Windows.Forms.TextBox txtPasillo;
    }
}