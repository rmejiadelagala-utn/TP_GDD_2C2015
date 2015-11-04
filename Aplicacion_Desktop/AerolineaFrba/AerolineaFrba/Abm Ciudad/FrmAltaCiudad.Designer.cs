namespace AerolineaFrba.Abm_Ciudad
{
    partial class FrmAltaCiudad
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
            this.lblCiudad = new System.Windows.Forms.Label();
            this.txtCiudad = new System.Windows.Forms.TextBox();
            this.grdCampos.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(12, 199);
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Location = new System.Drawing.Point(274, 199);
            this.cmdGuardar.Click += new System.EventHandler(this.cmdGuardar_Click);
            // 
            // grdCampos
            // 
            this.grdCampos.Controls.Add(this.txtCiudad);
            this.grdCampos.Controls.Add(this.lblCiudad);
            this.grdCampos.Size = new System.Drawing.Size(350, 153);
            this.grdCampos.Enter += new System.EventHandler(this.grdCampos_Enter);
            // 
            // lblCiudad
            // 
            this.lblCiudad.AutoSize = true;
            this.lblCiudad.Location = new System.Drawing.Point(16, 58);
            this.lblCiudad.Name = "lblCiudad";
            this.lblCiudad.Size = new System.Drawing.Size(43, 13);
            this.lblCiudad.TabIndex = 3;
            this.lblCiudad.Text = "Ciudad:";
            // 
            // txtCiudad
            // 
            this.txtCiudad.Location = new System.Drawing.Point(89, 58);
            this.txtCiudad.Name = "txtCiudad";
            this.txtCiudad.Size = new System.Drawing.Size(138, 20);
            this.txtCiudad.TabIndex = 4;
            // 
            // FrmAltaModificacionCiudad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(378, 233);
            this.Name = "FrmAltaModificacionCiudad";
            this.Text = "";
            this.Load += new System.EventHandler(this.FrmAltaModificacion_Load);
            this.grdCampos.ResumeLayout(false);
            this.grdCampos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox txtCiudad;
        private System.Windows.Forms.Label lblCiudad;
    }
}