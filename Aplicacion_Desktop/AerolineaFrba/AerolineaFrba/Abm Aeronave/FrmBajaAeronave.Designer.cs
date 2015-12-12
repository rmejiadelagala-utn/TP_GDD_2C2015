namespace AerolineaFrba.Abm_Aeronave
{
    partial class FrmBajaAeronave
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
            this.lblAeronaveMatricula = new System.Windows.Forms.Label();
            this.cmbBoxFabricante = new System.Windows.Forms.ComboBox();
            this.cmbBoxModelo = new System.Windows.Forms.ComboBox();
            this.lblFabricante = new System.Windows.Forms.Label();
            this.lblModelo = new System.Windows.Forms.Label();
            this.dgvBajaAeronave = new System.Windows.Forms.DataGridView();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBajaAeronave)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(39, 137);
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(598, 137);
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.lblModelo);
            this.grdFiltros.Controls.Add(this.lblFabricante);
            this.grdFiltros.Controls.Add(this.cmbBoxModelo);
            this.grdFiltros.Controls.Add(this.cmbBoxFabricante);
            this.grdFiltros.Controls.Add(this.lblAeronaveMatricula);
            this.grdFiltros.Controls.Add(this.txtBoxMatricula);
            this.grdFiltros.Size = new System.Drawing.Size(677, 96);
            this.grdFiltros.Text = "búsqueda Aeronave";
            // 
            // txtBoxMatricula
            // 
            this.txtBoxMatricula.Location = new System.Drawing.Point(92, 24);
            this.txtBoxMatricula.Name = "txtBoxMatricula";
            this.txtBoxMatricula.Size = new System.Drawing.Size(100, 20);
            this.txtBoxMatricula.TabIndex = 0;
            // 
            // lblAeronaveMatricula
            // 
            this.lblAeronaveMatricula.AutoSize = true;
            this.lblAeronaveMatricula.Location = new System.Drawing.Point(26, 27);
            this.lblAeronaveMatricula.Name = "lblAeronaveMatricula";
            this.lblAeronaveMatricula.Size = new System.Drawing.Size(50, 13);
            this.lblAeronaveMatricula.TabIndex = 1;
            this.lblAeronaveMatricula.Text = "Matricula";
            // 
            // cmbBoxFabricante
            // 
            this.cmbBoxFabricante.FormattingEnabled = true;
            this.cmbBoxFabricante.Location = new System.Drawing.Point(295, 27);
            this.cmbBoxFabricante.Name = "cmbBoxFabricante";
            this.cmbBoxFabricante.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxFabricante.TabIndex = 2;
            // 
            // cmbBoxModelo
            // 
            this.cmbBoxModelo.FormattingEnabled = true;
            this.cmbBoxModelo.Location = new System.Drawing.Point(521, 27);
            this.cmbBoxModelo.Name = "cmbBoxModelo";
            this.cmbBoxModelo.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxModelo.TabIndex = 3;
            // 
            // lblFabricante
            // 
            this.lblFabricante.AutoSize = true;
            this.lblFabricante.Location = new System.Drawing.Point(232, 31);
            this.lblFabricante.Name = "lblFabricante";
            this.lblFabricante.Size = new System.Drawing.Size(57, 13);
            this.lblFabricante.TabIndex = 4;
            this.lblFabricante.Text = "Fabricante";
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(473, 30);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(42, 13);
            this.lblModelo.TabIndex = 5;
            this.lblModelo.Text = "Modelo";
            // 
            // dgvBajaAeronave
            // 
            this.dgvBajaAeronave.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBajaAeronave.Location = new System.Drawing.Point(12, 167);
            this.dgvBajaAeronave.Name = "dgvBajaAeronave";
            this.dgvBajaAeronave.Size = new System.Drawing.Size(675, 150);
            this.dgvBajaAeronave.TabIndex = 4;
            this.dgvBajaAeronave.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvBajaAeronave_CellContentClick_1);
            // 
            // FrmBajaAeronave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(704, 323);
            this.Controls.Add(this.dgvBajaAeronave);
            this.Name = "FrmBajaAeronave";
            this.Text = "Baja Aeronave";
            this.Load += new System.EventHandler(this.FormBajaAeronave_Load);
            this.Controls.SetChildIndex(this.cmdLimpiar, 0);
            this.Controls.SetChildIndex(this.cmdBuscar, 0);
            this.Controls.SetChildIndex(this.grdFiltros, 0);
            this.Controls.SetChildIndex(this.dgvBajaAeronave, 0);
            this.grdFiltros.ResumeLayout(false);
            this.grdFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBajaAeronave)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblAeronaveMatricula;
        private System.Windows.Forms.TextBox txtBoxMatricula;
        private System.Windows.Forms.ComboBox cmbBoxModelo;
        private System.Windows.Forms.ComboBox cmbBoxFabricante;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.Label lblFabricante;
        private System.Windows.Forms.DataGridView dgvBajaAeronave;
    }
}