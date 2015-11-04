namespace AerolineaFrba.Abm_Ciudad
{
    partial class FrmListadoCiudad
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.lblCiudad = new System.Windows.Forms.Label();
            this.txtCiudad = new System.Windows.Forms.TextBox();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.txtCiudad);
            this.grdFiltros.Controls.Add(this.lblCiudad);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.ColumnHeader;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(10, 187);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(352, 170);
            this.dataGridView1.TabIndex = 4;
            // 
            // lblCiudad
            // 
            this.lblCiudad.AutoSize = true;
            this.lblCiudad.Location = new System.Drawing.Point(21, 47);
            this.lblCiudad.Name = "lblCiudad";
            this.lblCiudad.Size = new System.Drawing.Size(43, 13);
            this.lblCiudad.TabIndex = 0;
            this.lblCiudad.Text = "Ciudad:";
            // 
            // txtCiudad
            // 
            this.txtCiudad.Location = new System.Drawing.Point(84, 44);
            this.txtCiudad.Name = "txtCiudad";
            this.txtCiudad.Size = new System.Drawing.Size(192, 20);
            this.txtCiudad.TabIndex = 1;
            // 
            // FrmListadoCiudad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(372, 371);
            this.Controls.Add(this.dataGridView1);
            this.Name = "FrmListadoCiudad";
            this.Text = "FrmListadoCiudad";
            this.Load += new System.EventHandler(this.FrmListadoCiudad_Load);
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

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TextBox txtCiudad;
        private System.Windows.Forms.Label lblCiudad;
    }
}