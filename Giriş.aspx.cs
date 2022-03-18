using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace lastik
{
    public partial class Giriş : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        public class Kullanıcı_Getir_Tablo
        {
            public string Durum { get; set; }
         

        }


        [System.Web.Services.WebMethod]
        public static string Kullanıcı_Getir(string Kullanıcı_Adı , string Şifre)
        {


            var queryWithForJson = "select Kullanıcı_Adı from Kullanıcı_Veritabanı where Kullanıcı_Adı COLLATE Latin1_general_CS_AS  =@1 and Şifre COLLATE Latin1_general_CS_AS  =@2 ";
           


            var conn = new SqlConnection(@"Server= localhost; Database=LastikProje; Integrated Security=True;");
            var cmd = new SqlCommand(queryWithForJson, conn);
            cmd.Parameters.AddWithValue("@1", Kullanıcı_Adı);
            cmd.Parameters.AddWithValue("@2", Şifre);


            conn.Open();



            List<Kullanıcı_Getir_Tablo> tablo_Doldur_Classes = new List<Kullanıcı_Getir_Tablo>();
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
                    var Tablo_Doldur_Class_ = new Kullanıcı_Getir_Tablo
                    {
                        Durum = "1",
                       
                    };
                    tablo_Doldur_Classes.Add(Tablo_Doldur_Class_);
                }
            }
            conn.Close();
            return JsonConvert.SerializeObject(tablo_Doldur_Classes);


        }
        [System.Web.Services.WebMethod]
        public static string getirkullanici(string Kullanıcı_Adı, string Şifre)
        {


            var queryWithForJson = "select Kullanıcı_Adı from Kullanıcı_Veritabanı where Kullanıcı_Adı COLLATE Latin1_general_CS_AS  =@1 and Şifre COLLATE Latin1_general_CS_AS  =@2 ";

            var conn = new SqlConnection(@"server=.;Database=LastikProje; ");
            var cmd = new SqlCommand(queryWithForJson, conn);
            cmd.Parameters.AddWithValue("@1", Kullanıcı_Adı);
            cmd.Parameters.AddWithValue("@2", Şifre);

            conn.Open();

            var jsonResult = new StringBuilder();
            var reader = cmd.ExecuteReader();
            if (!reader.HasRows)
            {
                jsonResult.Append("[]");
                return JsonConvert.SerializeObject(jsonResult);
            }
            else
            {
                while (reader.Read())
                {
                    //Session.Add("Kullanıcı_Adı", reader.GetValue(0).ToString());
                    //Response.Redirect("LastikAnasayfa.aspx");


                }
                return "1";
            }

            conn.Close();


        }

    }
}