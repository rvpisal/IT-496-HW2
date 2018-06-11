using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CR4_HHI_Calculator
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void calc_Click(object sender, EventArgs e)
        {
            double new_CR4_tot, new_HHI_tot, total, cr1, cr2, cr3, cr4, cr5, cr6, cr7, cr8, old_HHI_tot = 0, old_CR4_tot = 0;
            string HHI_Finalstmt = "";

            if (fr1.Text != "")
                cr1 = Convert.ToDouble(fr1.Text);
            else
                cr1 = 0;

            if (fr2.Text != "")
                cr2 = Convert.ToDouble(fr2.Text);
            else
                cr2 = 0;

            if (fr3.Text != "")
                cr3 = Convert.ToDouble(fr3.Text);
            else
                cr3 = 0;

            if (fr4.Text != "")
                cr4 = Convert.ToDouble(fr4.Text);
            else
                cr4 = 0;

            if (fr5.Text != "")
                cr5 = Convert.ToDouble(fr5.Text);
            else
                cr5 = 0;

            if (fr6.Text != "")
                cr6 = Convert.ToDouble(fr6.Text);
            else
                cr6 = 0;

            if (fr7.Text != "")
                cr7 = Convert.ToDouble(fr7.Text);
            else
                cr7 = 0;

            if (fr8.Text != "")
                cr8 = Convert.ToDouble(fr8.Text);
            else
                cr8 = 0;

            total = cr1 + cr2 + cr3 + cr4 + cr5 + cr6 + cr7 + cr8;

            //if (Page.IsPostBack)
            //    tot_label.Visible = false;

            if (total != 100)
            {
                tot_label.Visible = true;
                new_CR4.Visible = false;
                old_CR4.Visible = false;
                diff_CR4.Visible = false;
                new_HHI.Visible = false;
                new_mk_stat.Visible = false;
                old_HHI.Visible = false;
                old_mk_stat.Visible = false;
                diff_HHI.Visible = false;
                stmt_HHI.Visible = false;

                tot_label.Text = "Please make sure the total share is 100%";

            }
            else
            {
                tot_label.Visible = false;
              
                new_CR4_tot = cr1 + cr2 + cr3 + cr4;

                new_HHI_tot = Math.Pow(cr1, 2) + Math.Pow(cr2, 2) + Math.Pow(cr3, 2) + Math.Pow(cr4, 2) + Math.Pow(cr5, 2) +
                    Math.Pow(cr6, 2) + Math.Pow(cr7, 2) + Math.Pow(cr8, 2);

                new_CR4.Visible = true;
                new_HHI.Visible = true;

                new_CR4.Text = "<b>Current CR4 = </b>" + Convert.ToString(new_CR4_tot);
                new_HHI.Text = "<b>Current HHI = </b>" + Convert.ToString(new_HHI_tot);


                new_mk_stat.Visible = true;

                if (new_HHI_tot < 1500)
                    new_mk_stat.Text = "(Unconcentrated Markets)";
                else if (new_HHI_tot >= 1500 && new_HHI_tot <= 2500)
                    new_mk_stat.Text = "(Moderately Concentrated Markets)";
                else if (new_HHI_tot > 2500)
                    new_mk_stat.Text = "(Highly Concentrated Markets)";
                else if (new_HHI_tot == 10000)
                    new_mk_stat.Text = "(Monopoly)";
                
                if (Session["oldCR4"] != null)
                {
                    old_CR4_tot = Convert.ToDouble(Session["oldCR4"]);

                    old_CR4.Visible = true;

                    old_CR4.Text = "<b>Previous CR4 = </b>" + Convert.ToString(Session["oldCR4"]);

                    diff_CR4.Visible = true;

                    diff_CR4.Text = "<b>CR4 Difference after Merger = </b>" + Convert.ToString(new_CR4_tot - old_CR4_tot);
                }

                if (Session["oldHHI"] != null)
                {
                    old_HHI_tot = Convert.ToDouble(Session["oldHHI"]);

                    old_mk_stat.Visible = true;

                    if (old_HHI_tot < 1500)
                        old_mk_stat.Text = "(Unconcentrated Markets)";
                    else if (old_HHI_tot >= 1500 && old_HHI_tot <= 2500)
                        old_mk_stat.Text = "(Moderately Concentrated Markets)";
                    else if (old_HHI_tot > 2500)
                        old_mk_stat.Text = "(Highly Concentrated Markets)";
                    else if (old_HHI_tot == 10000)
                        old_mk_stat.Text = "(Monopoly)";

                    old_HHI.Visible = true;

                    old_HHI.Text = "<b>Previous HHI = </b>" + Convert.ToString(Session["oldHHI"]);

                    diff_HHI.Visible = true;

                    diff_HHI.Text = "<b>HHI Difference after Merger = </b>" + Convert.ToString(new_HHI_tot - old_HHI_tot);

                    if ((new_HHI_tot - old_HHI_tot) > 0)
                    {
                        if (new_HHI_tot < 1500)
                            HHI_Finalstmt = "Unconcentrated Market and is unlikely to have adverse competitive effects and ordinarily require no further analysis.";

                        if ((new_HHI_tot >= 1500 && new_HHI_tot <= 2500) && (new_HHI_tot - old_HHI_tot) > 100)
                            HHI_Finalstmt = "Moderately Concentrated Market and potentially raises significant competitive concerns and warrants scrutiny.";
                        else
                            HHI_Finalstmt = "Moderately Concentrated Market.";

                        if ((new_HHI_tot > 2500) && ((new_HHI_tot - old_HHI_tot) >= 100 && (new_HHI_tot - old_HHI_tot) <= 200))
                            HHI_Finalstmt = "Highly Concentrated Market and potentially raises significant competitive concerns and warrants scrutiny.";
                        else
                            HHI_Finalstmt = "Highly Concentrated Market.";


                        if ((new_HHI_tot > 2500) && (new_HHI_tot - old_HHI_tot) > 200)
                            HHI_Finalstmt = "Highly Concentrated Market and will be presumed to be likely to enhance market power.";
                        else
                            HHI_Finalstmt = "Highly Concentrated Market.";

                        stmt_HHI.Visible = true;

                        stmt_HHI.Text = "<I>Since the merger produces a difference of <b>" + Convert.ToString(new_HHI_tot - old_HHI_tot) + "</b>, it has resulted in <b>" + HHI_Finalstmt + "</b></I>";
                    }
                    
                }

                Session["oldHHI"] = new_HHI_tot;
                Session["oldCR4"] = new_CR4_tot;
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            fr1.Text = "";
            fr2.Text = "";
            fr3.Text = "";
            fr4.Text = "";
            fr5.Text = "";
            fr6.Text = "";
            fr7.Text = "";
            fr8.Text = "";

            new_CR4.Visible = false;
            old_CR4.Visible = false;
            diff_CR4.Visible = false;
            new_HHI.Visible = false;
            new_mk_stat.Visible = false;
            old_HHI.Visible = false;
            old_mk_stat.Visible = false;
            diff_HHI.Visible = false;
            stmt_HHI.Visible = false;
            tot_label.Visible = false;

            Session.Remove("oldHHI");
            Session.Remove("oldCR4");
            //Session["oldHHI"] = null;
            //Session["oldCR4"] = null;
        }
    }
}