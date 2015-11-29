namespace AerolineaFrba.Abm_Aeronave
{
    partial class FrmListadoAeronave
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
            this.SuspendLayout();
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(289, 137);
            // 
            // FrmListadoAeronave
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(380, 262);
            this.Name = "FrmListadoAeronave";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.FrmListadoAeronave_Load);
            this.ResumeLayout(false);

        }

        #endregion
    }
}