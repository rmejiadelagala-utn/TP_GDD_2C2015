namespace AerolineaFrba.Template
{
    partial class FrmAltaModificacion
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
            this.cmdLimpiar = new System.Windows.Forms.Button();
            this.cmdGuardar = new System.Windows.Forms.Button();
            this.grdCampos = new System.Windows.Forms.GroupBox();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(12, 302);
            this.cmdLimpiar.Name = "cmdLimpiar";
            this.cmdLimpiar.Size = new System.Drawing.Size(88, 24);
            this.cmdLimpiar.TabIndex = 0;
            this.cmdLimpiar.Text = "&Limpiar";
            this.cmdLimpiar.UseVisualStyleBackColor = true;
            // 
            // cmdGuardar
            // 
            this.cmdGuardar.Location = new System.Drawing.Point(274, 302);
            this.cmdGuardar.Name = "cmdGuardar";
            this.cmdGuardar.Size = new System.Drawing.Size(88, 24);
            this.cmdGuardar.TabIndex = 1;
            this.cmdGuardar.Text = "&Guardar";
            this.cmdGuardar.UseVisualStyleBackColor = true;
            // 
            // grdCampos
            // 
            this.grdCampos.Location = new System.Drawing.Point(12, 13);
            this.grdCampos.Name = "grdCampos";
            this.grdCampos.Size = new System.Drawing.Size(350, 273);
            this.grdCampos.TabIndex = 2;
            this.grdCampos.TabStop = false;
            // 
            // FrmAltaModificacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 352);
            this.Controls.Add(this.grdCampos);
            this.Controls.Add(this.cmdGuardar);
            this.Controls.Add(this.cmdLimpiar);
            this.Name = "FrmAltaModificacion";
            this.Text = "AltaModificacion";
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.Button cmdLimpiar;
        public System.Windows.Forms.Button cmdGuardar;
        public System.Windows.Forms.GroupBox grdCampos;

    }
}