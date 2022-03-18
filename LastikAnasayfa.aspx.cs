using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lastik
{
    public partial class LastikAnasayfa : System.Web.UI.Page
    {
        public class Lastik_Getir_Tablo
        {
            public string Lastik_Id { get; set; }
            public string Lastik_Cinsi { get; set; }
            public string Lastik_Markası { get; set; }
            public string Lastik_Boyutu { get; set; }
            public string Alındığı_Tarih { get; set; }


        }


        [System.Web.Services.WebMethod]

        public string addLastik(string cins, string marka, string boyut, string calendar)
        {
            var queryWithForJson = "select * from Lastik_Veritabanı";


            var conn = new SqlConnection(@"Server= localhost; Database=LastikProje; Integrated Security=True;");
            var cmd = new SqlCommand(queryWithForJson, conn);



            conn.Open();



            List<Lastik_Getir_Tablo> tablo_Doldur_Classes = new List<Lastik_Getir_Tablo>();
            var jsonResult = new StringBuilder();
            var reader = cmd.ExecuteReader();
            if (!reader.HasRows)
            {
                jsonResult.Append("[]");
            }
            else
            {
                while (reader.Read())
                {
                    var Tablo_Doldur_Class_ = new Lastik_Getir_Tablo
                    {
                        Lastik_Id = reader.GetValue(0).ToString(),
                    };
                    tablo_Doldur_Classes.Add(Tablo_Doldur_Class_);
                }
            }
            conn.Close();
            return JsonConvert.SerializeObject(tablo_Doldur_Classes);
        }
        public static string Lastik_Getir()
        {



            var queryWithForJson = "select * from Lastik_Veritabanı";


            var conn = new SqlConnection(@"Server= localhost; Database=LastikProje; Integrated Security=True;");
            var cmd = new SqlCommand(queryWithForJson, conn);



            conn.Open();



            List<Lastik_Getir_Tablo> tablo_Doldur_Classes = new List<Lastik_Getir_Tablo>();
            var jsonResult = new StringBuilder();
            var reader = cmd.ExecuteReader();
            if (!reader.HasRows)
            {
                jsonResult.Append("[]");
            }
            else
            {
                while (reader.Read())
                {
                    var Tablo_Doldur_Class_ = new Lastik_Getir_Tablo
                    {
                        Lastik_Id = reader.GetValue(0).ToString(),
                        Lastik_Cinsi = reader.GetValue(1).ToString(),
                        Lastik_Markası = reader.GetValue(2).ToString(),
                        Lastik_Boyutu = reader.GetValue(3).ToString(),
                        Alındığı_Tarih = reader.GetValue(4).ToString(),
                    };
                    tablo_Doldur_Classes.Add(Tablo_Doldur_Class_);
                }
            }
            conn.Close();
            return JsonConvert.SerializeObject(tablo_Doldur_Classes);


        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]

        public static string denemepost(string parametre)
        {
            return parametre;
        }
    }
}