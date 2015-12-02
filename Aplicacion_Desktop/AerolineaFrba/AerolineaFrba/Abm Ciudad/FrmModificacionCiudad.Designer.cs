namespace AerolineaFrba.Abm_Ciudad
{
    partial class FrmModificacionCiudad
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
            this.txtBoxCiudadModif = new System.Windows.Forms.TextBox();
            this.lblCiudadModif = new System.Windows.Forms.Label();
            this.dataGridViewCiudadModif = new System.Windows.Forms.DataGridView();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCiudadModif)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(365, 137);
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.lblCiudadModif);
            this.grdFiltros.Controls.Add(this.txtBoxCiudadModif);
            this.grdFiltros.Size = new System.Drawing.Size(429, 96);
            // 
            // txtBoxCiudadModif
            // 
            this.txtBoxCiudadModif.Location = new System.Drawing.Point(141, 29);
            this.txtBoxCiudadModif.Name = "txtBoxCiudadModif";
            this.txtBoxCiudadModif.Size = new System.Drawing.Size(166, 20);
            this.txtBoxCiudadModif.TabIndex = 0;
            // 
            // lblCiudadModif
            // 
            this.lblCiudadModif.AutoSize = true;
            this.lblCiudadModif.Location = new System.Drawing.Point(31, 36);
            this.lblCiudadModif.Name = "lblCiudadModif";
            this.lblCiudadModif.Size = new System.Drawing.Size(95, 13);
            this.lblCiudadModif.TabIndex = 1;
            this.lblCiudadModif.Text = "Ciudad a Modificar";
            // 
            // dataGridViewCiudadModif
            // 
            this.dataGridViewCiudadModif.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewCiudadModif.Location = new System.Drawing.Point(10, 184);
            this.dataGridViewCiudadModif.Name = "dataGridViewCiudadModif";
            this.dataGridViewCiudadModif.Size = new System.Drawing.Size(429, 153);
            this.dataGridViewCiudadModif.TabIndex = 4;
            this.dataGridViewCiudadModif.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewCiudadModif_CellContentClick_1);
            // 
            // FrmModificacionCiudad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(470, 349);
            this.Controls.Add(this.dataGridViewCiudadModif);
            this.Name = "FrmModificacionCiudad";
            this.Text = "Modificación de Ciudad";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Controls.SetChildIndex(this.cmdLimpiar, 0);
            this.Controls.SetChildIndex(this.cmdBuscar, 0);
            this.Controls.SetChildIndex(this.grdFiltros, 0);
            this.Controls.SetChildIndex(this.dataGridViewCiudadModif, 0);
            this.grdFiltros.ResumeLayout(false);
            this.grdFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCiudadModif)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblCiudadModif;
        private System.Windows.Forms.TextBox txtBoxCiudadModif;
        private System.Windows.Forms.DataGridView dataGridViewCiudadModif;
    }
}