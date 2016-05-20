using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ModeLib
{
    public class Order
    {
        private string orderid;
        private string useremail;
        private string ordername;
        private string orderdate;
        private string orderaddress;
        private string orderphone;
        private string orderpostcode;
        private string ordersend;
        private string orderpay;
        private string orderstate;
        private int orderyunfei;
        private double orderjine;
        private string orderbackup;

        public Order(string email, string name, string address, string phone, string postcode, string send, string pay, int yunfei, double jine) {
            this.useremail = email;
            this.ordername = name;
            this.orderaddress = address;
            this.orderphone = phone;
            this.orderpostcode = postcode;
            this.ordersend = send;
            this.orderpay = pay;
            this.orderyunfei = yunfei;
            this.orderjine = jine;
        }
        public Order(string email, string name, string address, string phone, string postcode, string send, string pay, int yunfei, double jine, string state, string id, string date,string backup):this( email,  name,  address,  phone,  postcode,  send,  pay,  yunfei,  jine)
        {
            this.orderstate = state;
            this.orderid = id;
            this.orderdate = date;
            this.orderbackup = backup;
        }
        public string OrderId { get { return this.orderid; } set { this.orderid = value; } }
        public string UserEmail { get { return this.useremail; } set { this.useremail = value; } }
        public string OrderName { get { return this.ordername; } set { this.ordername = value; } }
        public string OrderDate { get { return this.orderdate; } set { this.orderdate = value; } }
        public string OrderAddress { get { return this.orderaddress; } set { this.orderaddress = value; } }
        public string OrderPhone { get { return this.orderphone; } set { this.orderphone = value; } }
        public string OrderPostcode { get { return this.orderpostcode; } set { this.orderpostcode = value; } }
        public string OrderSend { get { return this.ordersend; } set { this.ordersend = value; } }
        public string OrderPay { get { return this.orderpay; } set { this.orderpay = value; } }
        public string OrderState { get { return this.orderstate; } set { this.orderstate = value; } }
        public int OrderYunfei { get { return this.orderyunfei; } set { this.orderyunfei = value; } }
        public double OrderJine { get { return this.orderjine; } set { this.orderjine = value; } }
        public string OrderBackup { get { return this.orderbackup; } set { this.orderbackup = value; } }
    }
}
