namespace AerolineaFrba.Abm_Ciudad
{
    partial class FrmBaja
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
            this.txtCiudadEliminar = new System.Windows.Forms.TextBox();
            this.lblCiudadEliminar = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(448, 137);
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.lblCiudadEliminar);
            this.grdFiltros.Controls.Add(this.txtCiudadEliminar);
            this.grdFiltros.Size = new System.Drawing.Size(512, 96);
            this.grdFiltros.Enter += new System.EventHandler(this.grdFiltros_Enter);
            // 
            // txtCiudadEliminar
            // 
            this.txtCiudadEliminar.ForeColor = System.Drawing.SystemColors.InactiveCaption;
            this.txtCiudadEliminar.Location = new System.Drawing.Point(171, 33);
            this.txtCiudadEliminar.Name = "txtCiudadEliminar";
            this.txtCiudadEliminar.Size = new System.Drawing.Size(131, 20);
            this.txtCiudadEliminar.TabIndex = 0;
            // 
            // lblCiudadEliminar
            // 
            this.lblCiudadEliminar.AutoSize = true;
            this.lblCiudadEliminar.Location = new System.Drawing.Point(66, 36);
            this.lblCiudadEliminar.Name = "lblCiudadEliminar";
            this.lblCiudadEliminar.Size = new System.Drawing.Size(88, 13);
            this.lblCiudadEliminar.TabIndex = 1;
            this.lblCiudadEliminar.Text = "Ciudad a Eliminar";
            this.lblCiudadEliminar.Click += new System.EventHandler(this.label1_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1});
            this.dataGridView1.Location = new System.Drawing.Point(18, 197);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(504, 150);
            this.dataGridView1.TabIndex = 4;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Column1
            // 
            this.Column1.HeaderText = "Botones";
            this.Column1.Name = "Column1";
            this.Column1.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column1.Text = "Baja";
            this.Column1.UseColumnTextForButtonValue = true;
            // 
            // FrmBaja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(548, 359);
            this.Controls.Add(this.dataGridView1);
            this.Name = "FrmBaja";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.FrmBaja_Load);
            this.Controls.SetChildIndex(this.cmdLimpiar, 0);
            this.Controls.SetChildIndex(this.cmdBuscar, 0);
            this.Controls.SetChildIndex(this.grdFiltros, 0);
            this.Controls.SetChildIndex(this.dataGridView1, 0);
            this.grdFiltros.ResumeLayout(false);
            this.grdFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblCiudadEliminar;
        private System.Windows.Forms.TextBox txtCiudadEliminar;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewButtonColumn Column1;
    }
}