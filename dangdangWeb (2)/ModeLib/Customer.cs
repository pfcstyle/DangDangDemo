using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ModeLib
{
    public class Customer
    {
        private string username;
        private string userpass;
        private int userstate;
        private string userbackup;

        public Customer(string name, string pass)
        { 
            this.username=name;
            this.userpass=pass;
        }
        public Customer(string name, string pass, int state, string backup):this(name,pass)
        {
            this.userstate = state;
            this.userbackup = backup;
        }
        public string UserName
        {
            get { return this.username; }
            set { this.username = value; }
        }
        public string UserPass
        {
            get { return this.userpass; }
            set { this.userpass = value; }
        }
        public int UserState
        {
            get { return this.userstate; }
            set { this.userstate = value; }
        }
        public string UserBackUp
        {
            get { return this.userbackup; }
            set { this.userbackup = value; }
        }
    }
}
