using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleWebPage
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Insert_Component_Click(object sender, EventArgs e)
        {
            Button tmp = (Button)sender;

            try
            {
                Bike_Parts.InsertParameters["CityID"].DefaultValue = Component_List.SelectedValue.ToString();    // No transfer to new/next page (single page)

                // Pass all the input information
                Bike_Parts.InsertParameters["SerialNumber"].DefaultValue = Component_List.FooterRow.FindControl("Insert_SerialNumber").ToString();
                Bike_Parts.InsertParameters["ComponentID"].DefaultValue = Component_List.FooterRow.FindControl("Insert_ComponentID").ToString();
                Bike_Parts.InsertParameters["SubstituteID"].DefaultValue = Component_List.FooterRow.FindControl("Insert_SubstituteID").ToString();
                Bike_Parts.InsertParameters["Location"].DefaultValue = Component_List.FooterRow.FindControl("Insert_Location").ToString();
                Bike_Parts.InsertParameters["Quantity"].DefaultValue = Component_List.FooterRow.FindControl("Insert_Quantity").ToString();
                Bike_Parts.InsertParameters["DateInstalled"].DefaultValue = Component_List.FooterRow.FindControl("Insert_DateInstalled").ToString();
                Bike_Parts.InsertParameters["EmployeeID"].DefaultValue = Component_List.FooterRow.FindControl("Insert_EmployeeID").ToString();

                Bike_Parts.Insert(); // Insert Operation

                tmp.Text = "Inserted!"; // User Feedback
            }
            catch (Exception ex) // Show error message on failure!
            {
                tmp.Text = "Failed!";
                ErrorLabel1.Text = ex.Message;
                ErrorLabel1.Visible = true;
            }

        }
        protected void Insert_Purchase_Click(object sender, EventArgs e)
        {
            Button tmp = (Button)sender;

            try
            {
                Purchased_Source.InsertParameters["CityID"].DefaultValue = Component_List.SelectedValue.ToString();    // No transfer to new/next page (single page)

                // Pass all the input information
                Purchased_Source.InsertParameters["PurchaseID"].DefaultValue = Purchased_Items.FooterRow.FindControl("TextBox1").ToString();
                Purchased_Source.InsertParameters["ComponentID"].DefaultValue = Purchased_Items.FooterRow.FindControl("Label2").ToString();
                Purchased_Source.InsertParameters["PricePaid"].DefaultValue = Purchased_Items.FooterRow.FindControl("TextBox5").ToString();
                Purchased_Source.InsertParameters["Quantity"].DefaultValue = Purchased_Items.FooterRow.FindControl("TextBox6").ToString();
                Purchased_Source.InsertParameters["QuantityReceived"].DefaultValue = Purchased_Items.FooterRow.FindControl("TextBox7").ToString();

                Purchased_Source.Insert(); // Insert Operation

                tmp.Text = "Inserted!"; // User Feedback
            }
            catch (Exception ex) // Show error message on failure!
            {
                tmp.Text = "Failed!";
                ErrorLabel2.Text = ex.Message;
                ErrorLabel2.Visible = true;
            }

        }
    }
}