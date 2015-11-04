using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Forms;
using System;

namespace AerolineaFrba
{
    class Conexion
    {
        SqlConnection cn;
        SqlCommand cmd = new SqlCommand();

        public Conexion()
        {
            cn = new SqlConnection(@"Data Source=localhost\SQLSERVER2012;Initial Catalog=GD2C2015;User ID=gd;Password=gd2015");
        }

        public void Abrir()
        {
            cn.Open();
        }

        public void Cerrar()
        {
            cn.Close();
        }

        public void ArmarProcedimiento(string nombreProceso)
        {
            cmd = new SqlCommand(nombreProceso, cn);
            cmd.CommandType = CommandType.StoredProcedure;
        }

        public void ArmarFuncion(string nombreFuncion)
        {
            cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT dbo." + nombreFuncion + "(@userName,@password);";
        }


        public void AgregarParametro(string parametro, object valor)
        {
            cmd.Parameters.AddWithValue(parametro, valor); 
        }

        public void EjecutarProcedimiento()
        {
            int resultado = cmd.ExecuteNonQuery();
            MessageBox.Show("Datos insertados: " + resultado.ToString());
        }

        public int EjecutarFuncion()
        {
            int resultado = Convert.ToInt32(cmd.ExecuteScalar());
            
            return resultado;

        }


    }
}
