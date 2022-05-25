using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication4
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Unesite podatke')", true);
            }
            else
            {

                try
                {
                    SqlConnection veza = Konekcija.Connect();
                    SqlCommand komanda = new SqlCommand("SELECT * FROM Osoba where email = @username", veza);
                    komanda.Parameters.AddWithValue("@username", TextBox1.Text);
                    SqlDataAdapter adapter = new SqlDataAdapter(komanda);
                    DataTable tabela = new DataTable();
                    adapter.Fill(tabela);
                    int brojac = tabela.Rows.Count;


                    if (brojac == 1)
                    {
                        if (string.Compare(tabela.Rows[0]["pass"].ToString(), TextBox2.Text) == 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login uspesan. Dobro dosli.')", true);
                            Korisnik.email = tabela.Rows[0]["email"].ToString();
                            Korisnik.lozinka = tabela.Rows[0]["lozinka"].ToString();
                            Korisnik.id = (int)tabela.Rows[0]["id"];
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Pogresna lozinka')", true);
                        }

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Pogresan e-mail')", true);
                    }

                }
                catch (Exception greska)
                {
                    Console.WriteLine(greska.Message);
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}