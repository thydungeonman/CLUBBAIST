using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.TechnicalServices;

namespace ClubBAIST.BAISTClubWebsite.Domain
{
    public class BAISTClubCodeHandler
    {
        public bool ReserveTeeTime(DateTime Date, DateTime Time, int NumberOfPlayers, string MemberName1, string MemberName2, string MemberName3, string MemberName4, int NumberOfCarts, string PhoneNumber, int MemberNumber)
        {
            bool Confirmation;
            Reservations ReservationManager = new Reservations();
            Confirmation = ReservationManager.AddReservation(Date, Time, NumberOfPlayers,MemberName1,MemberName2,MemberName3,MemberName4, NumberOfCarts, PhoneNumber, MemberNumber);
            return Confirmation;
        }

        public void DisplayReservations(int MemberNumber, ListBox lb)
        {
            Members MemberManager = new Members();
            MemberManager.GetReservations(MemberNumber, lb);
        }
        public bool CancelReservation(DateTime Date, DateTime Time, int MemberNumber)
        {
            bool Confirmation = true;
            Reservations ReservationManager = new Reservations();
            Confirmation = ReservationManager.CancelReservation(Date, Time, MemberNumber);
            return Confirmation;
        }

        public bool CreateStandingReservation(DateTime StartDate, DateTime EndDate, DateTime RequestedTime, string DayOfWeek,
            int MemberNumber1, int MemberNumber2, int MemberNumber3, int MemberNumber4, string MemberName1, string MemberName2,
            string MemberName3, string MemberName4)
        {
            Reservations ReservationManager = new Reservations();
            bool Confirmation = ReservationManager.CreateStandingReservation(StartDate, EndDate, RequestedTime, DayOfWeek,
            MemberNumber1, MemberNumber2, MemberNumber3, MemberNumber4, MemberName1, MemberName2,
            MemberName3, MemberName4);
            return Confirmation;
        }

        public bool CancelStandingReservation(int MemberNumber, int Year)
        {
            Reservations ReservationManager = new Reservations();
            bool Confirmation = ReservationManager.CancelStandingReservation(MemberNumber, Year);
            return Confirmation;
        }

        public void ViewTransactions(int MemberNumber, Table tb)
        {
            Members TransactionManager = new Members();
            TransactionManager.GetTransactions(MemberNumber, tb);
        }

        public double ViewBalance(int MemberNumber)
        {
            Members TransactionManager = new Members();
            return TransactionManager.GetCurrentBalance(MemberNumber);
        }

        public bool AddTransaction(int MemberNumber, DateTime ActivityDate,string Description,double Amount)
        {
            Members TransactionManager = new Members();
            return TransactionManager.AddTransaction(MemberNumber, ActivityDate, Description, Amount);
        }

        public bool AddApplication(Application NewApplication)
        {
            Applications ApplicationManager = new Applications();
            return ApplicationManager.AddApplication(NewApplication);
        }

        public List<Application> GetApplications()
        {
            Members ApplicationManager = new Members();
            return ApplicationManager.GetApplications();
        }

        public bool DenyApplication(int ApplicationID)
        {
            Applications ApplicationManager = new Applications();
            return ApplicationManager.DenyApplication(ApplicationID);
        }

        public bool HoldApplication(int ApplicationID)
        {
            Applications ApplicationManager = new Applications();
            return ApplicationManager.HoldApplication(ApplicationID);
        }

        public bool WaitlistApplication(int ApplicationID)
        {
            Applications ApplicationManager = new Applications();
            return ApplicationManager.WaitlistApplication(ApplicationID);
        }

        public bool AcceptApplication(int ApplicationID)
        {
            Applications ApplicationManager = new Applications();
            return ApplicationManager.AcceptApplication(ApplicationID);
        }

        public List<TeeTime> ViewTeeTimes(DateTime Date)
        {
            Members TeeTimeManager = new Members();
            return TeeTimeManager.GetTeeTimes(Date);
        }

        public bool RecordScore(int MemberNumber, Score score)
        {
            Scores ScoreManager = new Scores();
            return ScoreManager.AddScore(MemberNumber, score);
        }

        public float GetCurrentHandicap(int membernumber)
        {
            Scores HandicapManager = new Scores();
            return HandicapManager.GetCurrentHandicap(membernumber);
        }

        public bool AddTournament(Tournament T)
        {
            Reservations TournamentManager = new Reservations();
            return TournamentManager.AddTournament(T);
        }

    }
}