using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace ClubBAIST.BAISTClubWebsite.TechnicalServices
{
    public class Reservations
    {

        public bool AddReservation(DateTime Date, DateTime Time, int NumberOfPlayers,string MemberName1 ,string MemberName2, string MemberName3, string MemberName4, int NumberOfCarts, string PhoneNumber, int MemberNumber)
        {
            bool Success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            //CONN.ConnectionString = @"Integrated Security = true;Persist Security Info = False;Server = (localdb)\v11.0;Database = BAISTClubDatabase;";
            CONN.Open();

            SqlCommand AddCommand = new SqlCommand();
            AddCommand.CommandText = "AddTeeTime";
            AddCommand.CommandType = CommandType.StoredProcedure;
            AddCommand.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = Date.Date;
            parameter.ParameterName = "@Date";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Time;
            parameter.Value = Time.TimeOfDay;
            parameter.ParameterName = "@Time";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName1;
            parameter.ParameterName = "@MemberName1";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName2;
            parameter.ParameterName = "@MemberName2";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName3;
            parameter.ParameterName = "@MemberName3";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName4;
            parameter.ParameterName = "@MemberName4";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber;
            parameter.ParameterName = "@MemberNumber";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = NumberOfPlayers;
            parameter.ParameterName = "@NumberOfPlayers";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = PhoneNumber;
            parameter.ParameterName = "@PhoneNumber";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = NumberOfCarts;
            parameter.ParameterName = "@NumberOfCarts";
            AddCommand.Parameters.Add(parameter);

            try
            {
                AddCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                Success = false;
            }

            CONN.Close();
            return Success;
        }
        public bool CancelReservation(DateTime Date, DateTime Time,int MemberNumber)
        {
            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = @"Integrated Security = true;Persist Security Info = False;Server = (localdb)\v11.0;Database = BAISTClubDatabase;";
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "CancelTeeTime";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@Date";
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = Date.Date;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@Time";
            parameter.SqlDbType = SqlDbType.Time;
            parameter.Value = Time.TimeOfDay;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@MemberNumber";
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber;
            command.Parameters.Add(parameter);

            try
            {
                command.ExecuteNonQuery();
            }
            catch (Exception)
            {
                success = false;
            }
               
            return success;
        }

        public bool CreateStandingReservation(DateTime StartDate, DateTime EndDate, DateTime RequestedTime,string DayOfWeek,
            int MemberNumber1, int MemberNumber2, int MemberNumber3, int MemberNumber4, string MemberName1, string MemberName2, 
            string MemberName3, string MemberName4)
        {
            bool success = true;

            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = @"Integrated Security = true;Persist Security Info = False;Server = (localdb)\v11.0;Database = BAISTClubDatabase;";
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "AddStandingReservation";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = StartDate.Date;
            parameter.ParameterName = "@StartDate";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = EndDate.Date;
            parameter.ParameterName = "@EndDate";
            command.Parameters.Add(parameter);


            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Time;
            parameter.Value = RequestedTime.TimeOfDay;
            parameter.ParameterName = "@RequestedTime";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = DayOfWeek;
            parameter.ParameterName = "@DayOfWeek";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber1;
            parameter.ParameterName = "@MemberNumber1";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber2;
            parameter.ParameterName = "@MemberNumber2";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber3;
            parameter.ParameterName = "@MemberNumber3";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Value = MemberNumber4;
            parameter.ParameterName = "@MemberNumber4";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName1;
            parameter.ParameterName = "@MemberName1";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName2;
            parameter.ParameterName = "@MemberName2";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName3;
            parameter.ParameterName = "@MemberName3";
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = MemberName4;
            parameter.ParameterName = "@MemberName4";
            command.Parameters.Add(parameter);

            try
            {
                command.ExecuteNonQuery();
                CONN.Close();
            }
            catch (Exception)
            {
                success = false;
                CONN.Close();
            }

            return success;
        }

        public bool CancelStandingReservation(int MemberNumber, int Year)
        {
            bool success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = @"Integrated Security = true;Persist Security Info = False;Server = (localdb)\v11.0;Database = BAISTClubDatabase;";
            CONN.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "CancelStandingReservation";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@MemberNumber";
            parameter.Value = MemberNumber;
            parameter.SqlDbType = SqlDbType.Int;
            command.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.ParameterName = "@Year";
            parameter.Value = Year;
            parameter.SqlDbType = SqlDbType.Int;
            command.Parameters.Add(parameter);

            try
            {
                command.ExecuteNonQuery();
                CONN.Close();
            }
            catch (Exception)
            {
                CONN.Close();
                success = false;
            }

            return success;
        }

        public bool AddTournament(Tournament NewTournament)
        {

            bool Success = true;
            SqlConnection CONN = new SqlConnection();
            CONN.ConnectionString = ConfigurationManager.ConnectionStrings["ClubBAIST Database"].ConnectionString;
            CONN.Open();

            SqlCommand AddCommand = new SqlCommand();
            AddCommand.CommandText = "AddTournament";
            AddCommand.CommandType = CommandType.StoredProcedure;
            AddCommand.Connection = CONN;

            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.NVarChar;
            parameter.Value = NewTournament.Name;
            parameter.ParameterName = "@Name";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewTournament.StartDate.Date;
            parameter.ParameterName = "@StartDate";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Time;
            parameter.Value = NewTournament.StartTime.TimeOfDay;
            parameter.ParameterName = "@StartTime";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Date;
            parameter.Value = NewTournament.EndDate.Date;
            parameter.ParameterName = "@EndDate";
            AddCommand.Parameters.Add(parameter);

            parameter = new SqlParameter();
            parameter.SqlDbType = SqlDbType.Time;
            parameter.Value = NewTournament.EndTime.TimeOfDay;
            parameter.ParameterName = "@EndTime";
            AddCommand.Parameters.Add(parameter);

            AddCommand.ExecuteNonQuery();
            CONN.Close();
            return Success;
            

        }

    }
}