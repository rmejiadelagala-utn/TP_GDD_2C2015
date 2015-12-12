namespace AerolineaFrba.Abm_Aeronave
{
    partial class FrmModificacionAeronave
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
            this.txtBoxMatricula = new System.Windows.Forms.TextBox();
            this.cmbBoxFabricante = new System.Windows.Forms.ComboBox();
            this.cmbBoxModelo = new System.Windows.Forms.ComboBox();
            this.lblMatricula = new System.Windows.Forms.Label();
            this.lblFabricante = new System.Windows.Forms.Label();
            this.lblModelo = new System.Windows.Forms.Label();
            this.dgvModificacionAeronave = new System.Windows.Forms.DataGridView();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvModificacionAeronave)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(447, 137);
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(569, 137);
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.lblModelo);
            this.grdFiltros.Controls.Add(this.lblFabricante);
            this.grdFiltros.Controls.Add(this.lblMatricula);
            this.grdFiltros.Controls.Add(this.cmbBoxModelo);
            this.grdFiltros.Controls.Add(this.cmbBoxFabricante);
            this.grdFiltros.Controls.Add(this.txtBoxMatricula);
            this.grdFiltros.Size = new System.Drawing.Size(633, 96);
            // 
            // txtBoxMatricula
            // 
            this.txtBoxMatricula.Location = new System.Drawing.Point(88, 40);
            this.txtBoxMatricula.Name = "txtBoxMatricula";
            this.txtBoxMatricula.Size = new System.Drawing.Size(100, 20);
            this.txtBoxMatricula.TabIndex = 0;
            // 
            // cmbBoxFabricante
            // 
            this.cmbBoxFabricante.FormattingEnabled = true;
            this.cmbBoxFabricante.Location = new System.Drawing.Point(286, 39);
            this.cmbBoxFabricante.Name = "cmbBoxFabricante";
            this.cmbBoxFabricante.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxFabricante.TabIndex = 1;
            // 
            // cmbBoxModelo
            // 
            this.cmbBoxModelo.FormattingEnabled = true;
            this.cmbBoxModelo.Location = new System.Drawing.Point(506, 39);
            this.cmbBoxModelo.Name = "cmbBoxModelo";
            this.cmbBoxModelo.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxModelo.TabIndex = 2;
            // 
            // lblMatricula
            // 
            this.lblMatricula.AutoSize = true;
            this.lblMatricula.Location = new System.Drawing.Point(30, 43);
            this.lblMatricula.Name = "lblMatricula";
            this.lblMatricula.Size = new System.Drawing.Size(52, 13);
            this.lblMatricula.TabIndex = 3;
            this.lblMatricula.Text = "Matrícula";
            // 
            // lblFabricante
            // 
            this.lblFabricante.AutoSize = true;
            this.lblFabricante.Location = new System.Drawing.Point(223, 42);
            this.lblFabricante.Name = "lblFabricante";
            this.lblFabricante.Size = new System.Drawing.Size(57, 13);
            this.lblFabricante.TabIndex = 4;
            this.lblFabricante.Text = "Fabricante";
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(465, 43);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(42, 13);
            this.lblModelo.TabIndex = 5;
            this.lblModelo.Text = "Modelo";
            // 
            // dgvModificacionAeronave
            // 
            this.dgvModificacionAeronave.AllowUserToAddRows = false;
            this.dgvModificacionAeronave.AllowUserToDeleteRows = false;
            this.dgvModificacionAeronave.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvModificacionAeronave.Location = new System.Drawing.Point(12, 178);
            this.dgvModificacionAeronave.Name = "dgvModificacionAeronave";
            this.dgvModificacionAeronave.ReadOnly = true;
            this.dgvModificacionAeronave.Size = new System.Drawing.Size(631, 150);
            this.dgvModificacionAeronave.TabIndex = 4;
            this.dgvModificacionAeronave.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvModificacionAeronave_CellContentClick);
            // 
            // FrmModificacionAeronave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(655, 352);
            this.Controls.Add(this.dgvModificacionAeronave);
            this.Name = "FrmModificacionAeronave";
            this.Text = "Modificación Aeronave";
            this.Controls.SetChildIndex(this.cmdLimpiar, 0);
            this.Controls.SetChildIndex(this.cmdBuscar, 0);
            this.Controls.SetChildIndex(this.grdFiltros, 0);
            this.Controls.SetChildIndex(this.dgvModificacionAeronave, 0);
            this.grdFiltros.ResumeLayout(false);
            this.grdFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvModificacionAeronave)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox txtBoxMatricula;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.Label lblFabricante;
        private System.Windows.Forms.Label lblMatricula;
        private System.Windows.Forms.ComboBox cmbBoxModelo;
        private System.Windows.Forms.ComboBox cmbBoxFabricante;
        private System.Windows.Forms.DataGridView dgvModificacionAeronave;
    }
}