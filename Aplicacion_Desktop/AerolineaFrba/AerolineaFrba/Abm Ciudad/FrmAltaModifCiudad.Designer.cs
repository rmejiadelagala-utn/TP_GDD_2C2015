namespace AerolineaFrba.Abm_Ciudad
{
    partial class FrmAltaModifCiudad
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
            this.txtBoxNombreCiudad = new System.Windows.Forms.TextBox();
            this.lblNombreCiudad = new System.Windows.Forms.Label();
            this.txtBoxIDCiudad = new System.Windows.Forms.TextBox();
            this.lblIDCiudad = new System.Windows.Forms.Label();
            this.grdCampos.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Click += new System.EventHandler(this.cmdGuardar_Click);
            // 
            // grdCampos
            // 
            this.grdCampos.Controls.Add(this.lblIDCiudad);
            this.grdCampos.Controls.Add(this.txtBoxIDCiudad);
            this.grdCampos.Controls.Add(this.lblNombreCiudad);
            this.grdCampos.Controls.Add(this.txtBoxNombreCiudad);
            // 
            // txtBoxNombreCiudad
            // 
            this.txtBoxNombreCiudad.Location = new System.Drawing.Point(123, 99);
            this.txtBoxNombreCiudad.Name = "txtBoxNombreCiudad";
            this.txtBoxNombreCiudad.Size = new System.Drawing.Size(176, 20);
            this.txtBoxNombreCiudad.TabIndex = 0;
            // 
            // lblNombreCiudad
            // 
            this.lblNombreCiudad.AutoSize = true;
            this.lblNombreCiudad.Location = new System.Drawing.Point(22, 99);
            this.lblNombreCiudad.Name = "lblNombreCiudad";
            this.lblNombreCiudad.Size = new System.Drawing.Size(95, 13);
            this.lblNombreCiudad.TabIndex = 1;
            this.lblNombreCiudad.Text = "Nombre de Ciudad";
            // 
            // txtBoxIDCiudad
            // 
            this.txtBoxIDCiudad.Enabled = false;
            this.txtBoxIDCiudad.Location = new System.Drawing.Point(123, 53);
            this.txtBoxIDCiudad.Name = "txtBoxIDCiudad";
            this.txtBoxIDCiudad.Size = new System.Drawing.Size(176, 20);
            this.txtBoxIDCiudad.TabIndex = 2;
            // 
            // lblIDCiudad
            // 
            this.lblIDCiudad.AutoSize = true;
            this.lblIDCiudad.Location = new System.Drawing.Point(25, 53);
            this.lblIDCiudad.Name = "lblIDCiudad";
            this.lblIDCiudad.Size = new System.Drawing.Size(57, 13);
            this.lblIDCiudad.TabIndex = 3;
            this.lblIDCiudad.Text = "ID  Ciudad";
            this.lblIDCiudad.Click += new System.EventHandler(this.label1_Click);
            // 
            // FrmAltaModifCiudad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 352);
            this.Name = "FrmAltaModifCiudad";
            this.Text = "Modificar Ciudad";
            this.grdCampos.ResumeLayout(false);
            this.grdCampos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblNombreCiudad;
        private System.Windows.Forms.TextBox txtBoxNombreCiudad;
        private System.Windows.Forms.Label lblIDCiudad;
        private System.Windows.Forms.TextBox txtBoxIDCiudad;
    }
}