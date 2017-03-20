using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ClubBAIST.BAISTClubWebsite.TechnicalServices
{
    public class Members
    {
        public void GetReservations(int membernumber, ListBox lb)
        {
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "GetMembersReservations";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = membernumber;
            parameter.ParameterName = "@MemberNumber";
            command.Parameters.Add(parameter);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string s = reader[0].ToString();
                s = s.Remove(10);
                s += " ";
                s += reader[1].ToString();
                ListItem item = new ListItem(s.Insert(11, "at "), s);
                lb.Items.Add(item);
            }
            reader.Close();
            CONN.Close();
        }

        public void GetTransactions(int membernumber, Table tb)
        {
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "GetTransactions";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@MemberNumber";
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = membernumber;
            command.Parameters.Add(parameter);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TableRow Row = new TableRow();

                    TableCell cell = new TableCell();
                    cell.Text = DateTime.Parse(reader["PostDate"].ToString()).ToShortDateString();
                    Row.Cells.Add(cell);

                    cell = new TableCell();
                    cell.Text = DateTime.Parse(reader["ActivityDate"].ToString()).ToShortDateString();
                    Row.Cells.Add(cell);

                    cell = new TableCell();
                    cell.Text = reader["Description"].ToString();
                    Row.Cells.Add(cell);

                    cell = new TableCell();
                    cell.Text = reader["Amount"].ToString();
                    Row.Cells.Add(cell);

                    tb.Rows.Add(Row);
                }
            }
            reader.Close();
            CONN.Close();
        }

        public double GetCurrentBalance(int membernumber)
        {
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "GetCurrentBalance";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@MemberNumber";
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = membernumber;
            command.Parameters.Add(parameter);

            SqlParameter balance = new SqlParameter();
            balance.ParameterName = "@CurrentBalance";
            balance.SqlDbType = SqlDbType.Money;
            balance.Value = 0.00;
            balance.Direction = ParameterDirection.Output;
            command.Parameters.Add(balance);

            command.ExecuteNonQuery();
            CONN.Close();
            return double.Parse(balance.Value.ToString());
        }

        public bool AddTransaction(int membernumber,DateTime ActivityDate,string Description,double Amount)
        {
            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "AddTransactionQuick";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@MemberNumber";
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = membernumber;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@ActivityDate";
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = ActivityDate.Date;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@Description";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = Description;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@Amount";
            parameter.SqlDbType = SqlDbType.Money;
            parameter.Value = Amount;
            command.Parameters.Add(parameter);

            try
            {
                command.ExecuteNonQuery();
            }
            catch (Exception)
            {
                success = false;
            }
            finally
            {
                CONN.Close();
            }

            return success;
        }


        public List<Application> GetApplications()
        {
            List<Application> Applications = new List<Application>();
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "GetApplications";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Application a = new Application();
                    a.ApplicationID = int.Parse(reader["ApplicationID"].ToString());
                    a.LastName = reader["LastName"].ToString();
                    a.FirstName = reader["FirstName"].ToString();
                    a.Address = reader["Address"].ToString();
                    a.PostalCode = reader["PostalCode"].ToString();
                    a.Phone = reader["Phone"].ToString();
                    a.AltPhone = reader["AltPhone"].ToString();
                    a.Email = reader["Email"].ToString();
                    a.BirthDate = DateTime.Parse(reader["BirthDate"].ToString());
                    a.Occupation = reader["Occupation"].ToString();
                    a.CompanyName = reader["CompanyName"].ToString();
                    a.CompanyAddress = reader["CompanyAddress"].ToString();
                    a.CompanyPostalCode = reader["CompanyPostalCode"].ToString();
                    a.CompanyPhone = reader["CompanyPhone"].ToString();
                    a.SubmitDate = DateTime.Parse(reader["SubmitDate"].ToString());
                    a.Sex = char.Parse(reader["Sex"].ToString());
                    a.WantsShare = bool.Parse(reader["WantsShare"].ToString());
                    a.Waitlisted = bool.Parse(reader["IsWaitlisted"].ToString());
                    a.Onhold = bool.Parse(reader["IsOnhold"].ToString());
                    a.ShareholderName1 = reader["ShareholderName1"].ToString();
                    a.ShareholderName2 = reader["ShareholderName2"].ToString();
                    a.ShareholderDate1 = DateTime.Parse(reader["ShareholderDate1"].ToString());
                    a.ShareholderDate2 = DateTime.Parse(reader["ShareholderDate2"].ToString());
                    Applications.Add(a);
                }
            }
            reader.Close();
            CONN.Close();
            return Applications;
        }

        public List<TeeTime> GetTeeTimes(DateTime Date)
        {
            List<TeeTime> TeeTimes = new List<TeeTime>();
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "GetTeeTimes";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@Date";
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = Date.Date;
            command.Parameters.Add(parameter);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TeeTimes.Add(new TeeTime(DateTime.Parse(reader[0].ToString()),DateTime.Parse(reader[1].ToString()),reader[2].ToString(),reader[3].ToString(),reader[4].ToString(),reader[5].ToString()));
                }
            }
            reader.Close();
            CONN.Close();
            return TeeTimes;
        }
    }
}