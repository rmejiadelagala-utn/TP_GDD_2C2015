namespace AerolineaFrba.Principal
{
    partial class FrmPrincipal
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.funcionalidadesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tiposDeServiciosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ciudadesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaModificaciónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listadoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ayudaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bajaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listadoToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.realizarComprarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.funcionalidadesToolStripMenuItem,
            this.ayudaToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(684, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            this.menuStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menuStrip1_ItemClicked);
            // 
            // funcionalidadesToolStripMenuItem
            // 
            this.funcionalidadesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.rolesToolStripMenuItem,
            this.tiposDeServiciosToolStripMenuItem,
            this.ciudadesToolStripMenuItem,
            this.realizarComprarToolStripMenuItem});
            this.funcionalidadesToolStripMenuItem.Name = "funcionalidadesToolStripMenuItem";
            this.funcionalidadesToolStripMenuItem.Size = new System.Drawing.Size(94, 20);
            this.funcionalidadesToolStripMenuItem.Text = "&Funcionalidad";
            this.funcionalidadesToolStripMenuItem.Click += new System.EventHandler(this.funcionalidadesToolStripMenuItem_Click);
            // 
            // rolesToolStripMenuItem
            // 
            this.rolesToolStripMenuItem.Name = "rolesToolStripMenuItem";
            this.rolesToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.rolesToolStripMenuItem.Text = "Roles";
            this.rolesToolStripMenuItem.Click += new System.EventHandler(this.rolesToolStripMenuItem_Click);
            // 
            // tiposDeServiciosToolStripMenuItem
            // 
            this.tiposDeServiciosToolStripMenuItem.Name = "tiposDeServiciosToolStripMenuItem";
            this.tiposDeServiciosToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.tiposDeServiciosToolStripMenuItem.Text = "Usuarios";
            this.tiposDeServiciosToolStripMenuItem.Click += new System.EventHandler(this.tiposDeServiciosToolStripMenuItem_Click);
            // 
            // ciudadesToolStripMenuItem
            // 
            this.ciudadesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaModificaciónToolStripMenuItem,
            this.listadoToolStripMenuItem,
            this.bajaToolStripMenuItem,
            this.listadoToolStripMenuItem1});
            this.ciudadesToolStripMenuItem.Name = "ciudadesToolStripMenuItem";
            this.ciudadesToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.ciudadesToolStripMenuItem.Text = "Ciudades";
            this.ciudadesToolStripMenuItem.Click += new System.EventHandler(this.ciudadesToolStripMenuItem_Click);
            // 
            // altaModificaciónToolStripMenuItem
            // 
            this.altaModificaciónToolStripMenuItem.Name = "altaModificaciónToolStripMenuItem";
            this.altaModificaciónToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.altaModificaciónToolStripMenuItem.Text = "Alta";
            this.altaModificaciónToolStripMenuItem.Click += new System.EventHandler(this.altaModificaciónToolStripMenuItem_Click);
            // 
            // listadoToolStripMenuItem
            // 
            this.listadoToolStripMenuItem.Name = "listadoToolStripMenuItem";
            this.listadoToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.listadoToolStripMenuItem.Text = "Modificación";
            this.listadoToolStripMenuItem.Click += new System.EventHandler(this.listadoToolStripMenuItem_Click);
            // 
            // ayudaToolStripMenuItem
            // 
            this.ayudaToolStripMenuItem.Name = "ayudaToolStripMenuItem";
            this.ayudaToolStripMenuItem.Size = new System.Drawing.Size(53, 20);
            this.ayudaToolStripMenuItem.Text = "Ayuda";
            // 
            // bajaToolStripMenuItem
            // 
            this.bajaToolStripMenuItem.Name = "bajaToolStripMenuItem";
            this.bajaToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.bajaToolStripMenuItem.Text = "Baja";
            // 
            // listadoToolStripMenuItem1
            // 
            this.listadoToolStripMenuItem1.Name = "listadoToolStripMenuItem1";
            this.listadoToolStripMenuItem1.Size = new System.Drawing.Size(152, 22);
            this.listadoToolStripMenuItem1.Text = "Listado";
            // 
            // realizarComprarToolStripMenuItem
            // 
            this.realizarComprarToolStripMenuItem.Name = "realizarComprarToolStripMenuItem";
            this.realizarComprarToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.realizarComprarToolStripMenuItem.Text = "Realizar Comprar";
            // 
            // FrmPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(684, 662);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.Name = "FrmPrincipal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Principal";
            this.Load += new System.EventHandler(this.Principal_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem funcionalidadesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tiposDeServiciosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ayudaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ciudadesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaModificaciónToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listadoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem bajaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listadoToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem realizarComprarToolStripMenuItem;

    }
}