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
        String miConexion = AerolineaFrba.Properties.Settings.Default.GD2C2015ConnectionString;

        public Conexion()
        {
            
           // cn = new SqlConnection(@"Data Source=localhost\SQLSERVER2012;Initial Catalog=GD2C2015;User ID=gd;Password=gd2015");
            cn = new SqlConnection(miConexion);
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
            cmd.CommandText = "SELECT SFX." + nombreFuncion + "(@userName,@password);";
        }


        public void AgregarParametro(string parametro, object valor)
        {
            cmd.Parameters.AddWithValue(parametro, valor); 
        }

        public void EjecutarProcedimiento()
        {
            int resultado = cmd.ExecuteNonQuery();
            MessageBox.Show("Operacion realizada: " + resultado.ToString());
        }

        public int EjecutarFuncion()
        {
            int resultado = Convert.ToInt32(cmd.ExecuteScalar());
            
            return resultado;

        }
        public DataTable EjecutarConsulta(String query)
        {
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            DataSet _dataSet = new DataSet();

            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {

                adapter.Fill(_dataSet);
            }

            return _dataSet.Tables[0];
        }


        public SqlDataReader EjecutarDataReader(String query)
        {
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
                MessageBox.Show("El query recibido es: " + query);
                SqlDataReader dataReader = cmd.ExecuteReader();//new SqlDataReader();
                if (dataReader.Read() == true)
                {
                    return dataReader;
                }
                else
                {
                    MessageBox.Show("No hay datos para traer ");
                    return null;
                }
            
        }

        public void LoadDataGridView(DataGridView dgv)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo cargar el DataGridView " + ex.ToString());
            }
        }
    }
}
