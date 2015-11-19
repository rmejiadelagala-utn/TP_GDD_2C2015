namespace AerolineaFrba.Compra
{
    partial class FrmPasaje
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
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.cmbBoxCiudadOrigen = new System.Windows.Forms.ComboBox();
            this.cmbBoxCiudadDestino = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dataGridViewViajes = new System.Windows.Forms.DataGridView();
            this.grdFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewViajes)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdLimpiar
            // 
            this.cmdLimpiar.Location = new System.Drawing.Point(514, 137);
            this.cmdLimpiar.Size = new System.Drawing.Size(93, 24);
            this.cmdLimpiar.Click += new System.EventHandler(this.cmdLimpiar_Click);
            // 
            // cmdBuscar
            // 
            this.cmdBuscar.Location = new System.Drawing.Point(648, 137);
            this.cmdBuscar.Size = new System.Drawing.Size(112, 24);
            this.cmdBuscar.Click += new System.EventHandler(this.cmdBuscar_Click);
            // 
            // grdFiltros
            // 
            this.grdFiltros.Controls.Add(this.cmbBoxCiudadOrigen);
            this.grdFiltros.Controls.Add(this.cmbBoxCiudadDestino);
            this.grdFiltros.Controls.Add(this.label3);
            this.grdFiltros.Controls.Add(this.label2);
            this.grdFiltros.Controls.Add(this.label1);
            this.grdFiltros.Controls.Add(this.dateTimePicker1);
            this.grdFiltros.Location = new System.Drawing.Point(12, 12);
            this.grdFiltros.Size = new System.Drawing.Size(748, 113);
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(9, 47);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(245, 20);
            this.dateTimePicker1.TabIndex = 0;
            this.dateTimePicker1.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
            // 
            // cmbBoxCiudadOrigen
            // 
            this.cmbBoxCiudadOrigen.FormattingEnabled = true;
            this.cmbBoxCiudadOrigen.Location = new System.Drawing.Point(502, 35);
            this.cmbBoxCiudadOrigen.Name = "cmbBoxCiudadOrigen";
            this.cmbBoxCiudadOrigen.Size = new System.Drawing.Size(190, 21);
            this.cmbBoxCiudadOrigen.TabIndex = 2;
            this.cmbBoxCiudadOrigen.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // cmbBoxCiudadDestino
            // 
            this.cmbBoxCiudadDestino.FormattingEnabled = true;
            this.cmbBoxCiudadDestino.Location = new System.Drawing.Point(502, 86);
            this.cmbBoxCiudadDestino.Name = "cmbBoxCiudadDestino";
            this.cmbBoxCiudadDestino.Size = new System.Drawing.Size(190, 21);
            this.cmbBoxCiudadDestino.TabIndex = 3;
            this.cmbBoxCiudadDestino.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(6, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(107, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "Fecha de Vuelo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(499, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(74, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Ciudad Origen";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(499, 70);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(79, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Ciudad Destino";
            // 
            // dataGridViewViajes
            // 
            this.dataGridViewViajes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewViajes.Location = new System.Drawing.Point(12, 167);
            this.dataGridViewViajes.Name = "dataGridViewViajes";
            this.dataGridViewViajes.Size = new System.Drawing.Size(748, 194);
            this.dataGridViewViajes.TabIndex = 4;
            // 
            // FrmPasaje
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(772, 373);
            this.Controls.Add(this.dataGridViewViajes);
            this.Name = "FrmPasaje";
            this.Text = "Busquede de Vuelos";
            this.Controls.SetChildIndex(this.cmdLimpiar, 0);
            this.Controls.SetChildIndex(this.cmdBuscar, 0);
            this.Controls.SetChildIndex(this.grdFiltros, 0);
            this.Controls.SetChildIndex(this.dataGridViewViajes, 0);
            this.grdFiltros.ResumeLayout(false);
            this.grdFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewViajes)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.ComboBox cmbBoxCiudadOrigen;
        private System.Windows.Forms.ComboBox cmbBoxCiudadDestino;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dataGridViewViajes;
    }
}