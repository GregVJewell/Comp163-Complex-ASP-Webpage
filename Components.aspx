<%@ Page Title="Components" Language="C#" MasterPageFile="~/Practice.Master" AutoEventWireup="true" CodeBehind="Components.aspx.cs" Inherits="SimpleWebPage.WebForm3" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="main_content">
    <div class="topnav">
        <a class="active" href="Home.aspx">Home</a> <a href="Components.aspx">Components</a> <a href="Queries.aspx">RT Queries</a>
    </div>
    <hr />
    <div>
        <h1 align="center" style="color: #FFFFFF">Rolling Thunder Components</h1>
        <asp:DetailsView ID="Bike" runat="server" Height="50px" Width="900px" AllowPaging="True" AutoGenerateRows="False" BackColor="#CCCCCC" DataKeyNames="ComponentID" DataSourceID="Bike_Source" HorizontalAlign="Center">
            <Fields>
                <asp:BoundField DataField="ComponentID" HeaderText="ComponentID" ReadOnly="True" SortExpression="ComponentID" />
                <asp:BoundField DataField="ProductNumber" HeaderText="ProductNumber" SortExpression="ProductNumber" />
                <asp:BoundField DataField="Road" HeaderText="Road" SortExpression="Road" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" DataFormatString="{0:c}" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="Bike_Source" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT [ComponentID], [ProductNumber], [Road], [Category], [Description], [ListPrice], [Year] FROM [Component] WHERE ([Year] = @Year)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2012" Name="Year" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <table style="width: 100%;">
                <tr>
                    <td>
                        <div style="text-align: center">
                            <h3 style="color: #FFFFFF; text-align: center;">
                                Bike Parts
                            </h3>
                            <asp:Label ID="ErrorLabel1" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                        </div>
                        <asp:GridView ID="Component_List" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" DataKeyNames="SerialNumber,ComponentID" DataSourceID="Bike_Parts" HorizontalAlign="Center" Width="1250px" AllowPaging="True" PageSize="15" ShowFooter="True">
                            <Columns>

                                <asp:TemplateField ShowHeader="False">
                                    <FooterTemplate>
                                        <asp:Button ID="Insert_Component" runat="server" Text="Insert" BorderStyle="Solid" OnClick="Insert_Component_Click" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Serial Number" SortExpression="SerialNumber">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_SerialNumber" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_SerialNumber" runat="server" Text='<%# Eval("SerialNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ComponentID" SortExpression="ComponentID">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_ComponentID" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_ComponentID" runat="server" Text='<%# Eval("ComponentID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="SubstituteID" SortExpression="SubstituteID">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_SubstituteID" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_SubstituteID" runat="server" Text='<%# Eval("SubstituteID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Location" SortExpression="Location">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_Location" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_Location" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_Quantity" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date Installed" SortExpression="DateInstalled">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_DateInstalled" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_DateInstalled" runat="server" Text='<%# Eval("DateInstalled") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="EmployeeID" SortExpression="EmployeeID">
                                    <FooterTemplate>
                                        <asp:TextBox ID="Insert_EmployeeID" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="View_EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="Bike_Parts" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT * FROM [BikeParts] WHERE ([ComponentID] = @ComponentID)" InsertCommand="INSERT INTO [BikeParts] ([SerialNumber], [ComponentID], [SubstituteID], [Location], [Quantity], [DateInstalled], [EmployeeID]) VALUES (@SerialNumber, @ComponentID, @SubstituteID, @Location, @Quantity, @DateInstalled, @EmployeeID)">
                            <InsertParameters>
                                <asp:Parameter Name="SerialNumber" Type="Int32" />
                                <asp:Parameter Name="ComponentID" Type="Int32" />
                                <asp:Parameter Name="SubstituteID" Type="Int32" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="DateInstalled" Type="DateTime" />
                                <asp:Parameter Name="EmployeeID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Bike" Name="ComponentID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            <tr>
                <td>
                    <div style="text-align: center">
                        <h3 style="color: #FFFFFF; text-align: center;">
                            Purchased Items
                        </h3>
                            <asp:Label ID="ErrorLabel2" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                    </div>
                    <asp:GridView ID="Purchased_Items" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" DataKeyNames="PurchaseID,ComponentID" DataSourceID="Purchased_Source" HorizontalAlign="Center" Width="1250px" AllowPaging="True" PageSize="15" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <FooterTemplate>
                                    <asp:Button ID="Insert2" runat="server" BorderStyle="Solid" Text="Insert" OnClick="Insert_Purchase_Click"/>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PurchaseID" SortExpression="PurchaseID">
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PurchaseID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ComponentID" SortExpression="ComponentID">
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ComponentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price Paid" SortExpression="PricePaid">
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PricePaid", "{0:c}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity Received" SortExpression="QuantityReceived">
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("QuantityReceived") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        </asp:GridView>
                    <asp:SqlDataSource ID="Purchased_Source" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT * FROM [PurchaseItem] WHERE ([ComponentID] = @ComponentID)" InsertCommand="INSERT INTO [PurchaseItem] ([PurchaseID], [ComponentID], [PricePaid], [Quantity], [QuantityReceived]) VALUES (@PurchaseID, @ComponentID, @PricePaid, @Quantity, @QuantityReceived)" DeleteCommand="DELETE FROM [PurchaseItem] WHERE [PurchaseID] = @PurchaseID AND [ComponentID] = @ComponentID" UpdateCommand="UPDATE [PurchaseItem] SET [PricePaid] = @PricePaid, [Quantity] = @Quantity, [QuantityReceived] = @QuantityReceived WHERE [PurchaseID] = @PurchaseID AND [ComponentID] = @ComponentID">
                        <DeleteParameters>
                            <asp:Parameter Name="PurchaseID" Type="Int32" />
                            <asp:Parameter Name="ComponentID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="PurchaseID" Type="Int32" />
                            <asp:Parameter Name="ComponentID" Type="Int32" />
                            <asp:Parameter Name="PricePaid" Type="Decimal" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter Name="QuantityReceived" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Bike" Name="ComponentID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PricePaid" Type="Decimal" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter Name="QuantityReceived" Type="Int32" />
                            <asp:Parameter Name="PurchaseID" Type="Int32" />
                            <asp:Parameter Name="ComponentID" Type="Int32" />
                        </UpdateParameters>
                        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

