using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace ClubBAIST.BAISTClubWebsite.TechnicalServices
{
    public class Applications
    {

        public bool DenyApplication(int ApplicationID)
        {

            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "DenyApplication";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = ApplicationID;
            parameter.ParameterName = "@ApplicationID";
            command.Parameters.Add(parameter);

            command.ExecuteNonQuery();

            return success;
        }

        public bool HoldApplication(int ApplicationID)
        {

            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "HoldApplication";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = ApplicationID;
            parameter.ParameterName = "@ApplicationID";
            command.Parameters.Add(parameter);

            command.ExecuteNonQuery();

            return success;
        }

        public bool WaitlistApplication(int ApplicationID)
        {

            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "WaitlistApplication";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = ApplicationID;
            parameter.ParameterName = "@ApplicationID";
            command.Parameters.Add(parameter);

            command.ExecuteNonQuery();

            return success;
        }

        public bool AcceptApplication(int ApplicationID)
        {

            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "AcceptApplication";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = ApplicationID;
            parameter.ParameterName = "@ApplicationID";
            command.Parameters.Add(parameter);

            command.ExecuteNonQuery();

            return success;
        }

        public bool AddApplication(Application NewApplication)
        {
            bool success = true;

            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "AddApplication";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.LastName;
            parameter.ParameterName = "@LastName";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.FirstName;
            parameter.ParameterName = "@FirstName";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.Address;
            parameter.ParameterName = "@Address";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = NewApplication.PostalCode;
            parameter.ParameterName = "@PostalCode";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = NewApplication.Phone;
            parameter.ParameterName = "@Phone";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = NewApplication.AltPhone;
            parameter.ParameterName = "@AltPhone";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.Email;
            parameter.ParameterName = "@Email";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewApplication.BirthDate.Date;
            parameter.ParameterName = "@BirthDate";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.Occupation;
            parameter.ParameterName = "@Occupation";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.CompanyName;
            parameter.ParameterName = "@CompanyName";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.CompanyAddress;
            parameter.ParameterName = "@CompanyAddress";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.CompanyPostalCode;
            parameter.ParameterName = "@CompanyPostalCode";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = NewApplication.CompanyPhone;
            parameter.ParameterName = "@CompanyPhone";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewApplication.SubmitDate;
            parameter.ParameterName = "@SubmitDate";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Char;
            parameter.Value = NewApplication.Sex;
            parameter.ParameterName = "@Sex";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.Password;
            parameter.ParameterName = "@Password";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Bit;
            parameter.Value = NewApplication.WantsShare;
            parameter.ParameterName = "@WantsShare";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.ShareholderName1;
            parameter.ParameterName = "@ShareholderName1";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewApplication.ShareholderDate1.Date;
            parameter.ParameterName = "@ShareholderDate1";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewApplication.ShareholderName2;
            parameter.ParameterName = "@ShareholderName2";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewApplication.ShareholderDate2.Date;
            parameter.ParameterName = "@ShareholderDate2";
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

    }
}