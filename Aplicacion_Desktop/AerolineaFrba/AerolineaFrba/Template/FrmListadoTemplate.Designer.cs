﻿namespace AerolineaFrba.Template
{
    partial class FrmListadoTemplate
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
            this.cmdBuscar = new System.Windows.Forms.Button();
            this.grdFiltros = new System.Windows.Forms.GroupBox();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(10, 137);
            this.cmdLimpiar.Name = "cmdLimpiar";
            this.cmdLimpiar.Size = new System.Drawing.Size(76, 24);
            this.cmdLimpiar.TabIndex = 1;
            this.cmdLimpiar.Text = "&Limpiar";
            this.cmdLimpiar.UseVisualStyleBackColor = true;
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(290, 137);
            this.cmdBuscar.Name = "cmdBuscar";
            this.cmdBuscar.Size = new System.Drawing.Size(74, 24);
            this.cmdBuscar.TabIndex = 2;
            this.cmdBuscar.Text = "&Buscar";
            this.cmdBuscar.UseVisualStyleBackColor = true;
            // 
            // grdFiltros
            // 
            this.grdFiltros.Location = new System.Drawing.Point(10, 29);
            this.grdFiltros.Name = "grdFiltros";
            this.grdFiltros.Size = new System.Drawing.Size(353, 96);
            this.grdFiltros.TabIndex = 3;
            this.grdFiltros.TabStop = false;
            this.grdFiltros.Text = "Filtros de búsqueda";
            this.grdFiltros.Enter += new System.EventHandler(this.grdFiltros_Enter);
            // 
            // FrmListadoTemplate
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 352);
            this.Controls.Add(this.grdFiltros);
            this.Controls.Add(this.cmdBuscar);
            this.Controls.Add(this.cmdLimpiar);
            this.Name = "FrmListadoTemplate";
            this.Text = "Listado";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.FrmListado_Load);
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.Button cmdLimpiar;
        public System.Windows.Forms.Button cmdBuscar;
        public System.Windows.Forms.GroupBox grdFiltros;

    }
}