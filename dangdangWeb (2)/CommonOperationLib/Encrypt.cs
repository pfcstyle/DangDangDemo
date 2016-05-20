using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;
using System.Security.Cryptography;

namespace CommonOperationLib
{
    public class Encrypt
    {
        private static String EncryptString(String text, String key)
        {
            DESCryptoServiceProvider desp = new DESCryptoServiceProvider();
            byte[] inputtextbytearray = Encoding.Default.GetBytes(text);
            desp.Key = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(key, "md5").Substring(0, 8));
            desp.IV = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(key, "md5").Substring(0, 8));
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, desp.CreateEncryptor(), CryptoStreamMode.Write);
            cs.Write(inputtextbytearray, 0, inputtextbytearray.Length);
            cs.FlushFinalBlock();

            StringBuilder sb = new StringBuilder();
            foreach (byte b in ms.ToArray())
            {
                sb.AppendFormat("{0:X2}", b);
            }
            return sb.ToString();
        }

        public static String EncryptString(String text)
        {
            return EncryptString(text, "haha");
        }
    }
}

