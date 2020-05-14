<%@ Page Title="Home" Language="C#" MasterPageFile="~/Practice.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SimpleWebPage.WebForm4" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="main_content">
    <div class="topnav">
        <a class="active" href="Home.aspx">Home</a> <a href="Components.aspx">Components</a> <a href="Queries.aspx">RT Queries</a>
    </div>

    <hr />

    <div>
            <h1 align="center" style="color: #FFFFFF">Welcome to Rolling Thunder</h1>

            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="StoreID" DataSourceID="Retail_Store" Height="50px" Width="500px" BackColor="#CCCCCC" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="StoreID" HeaderText="StoreID" InsertVisible="False" ReadOnly="True" SortExpression="StoreID" />
                    <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ContactFirstName" HeaderText="ContactFirstName" SortExpression="ContactFirstName" />
                    <asp:BoundField DataField="ContactLastName" HeaderText="ContactLastName" SortExpression="ContactLastName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                    <asp:TemplateField HeaderText="CityID" SortExpression="CityID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Locations" DataTextField="Location" DataValueField="Location">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Locations" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT [City] + ', ' + [State] + ', ' + [Country] AS Location FROM City"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Locations" DataTextField="Location" DataValueField="Location">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Locations" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT [City] + ', ' + [State] + ', ' + [Country] AS Location FROM City"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="Retail_Store" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" DeleteCommand="DELETE FROM [RetailStore] WHERE [StoreID] = @StoreID" InsertCommand="INSERT INTO [RetailStore] ([StoreName], [Phone], [ContactFirstName], [ContactLastName], [Address], [ZipCode], [CityID]) VALUES (@StoreName, @Phone, @ContactFirstName, @ContactLastName, @Address, @ZipCode, @CityID)" SelectCommand="SELECT * FROM [RetailStore]" UpdateCommand="UPDATE [RetailStore] SET [StoreName] = @StoreName, [Phone] = @Phone, [ContactFirstName] = @ContactFirstName, [ContactLastName] = @ContactLastName, [Address] = @Address, [ZipCode] = @ZipCode, [CityID] = @CityID WHERE [StoreID] = @StoreID">
                <DeleteParameters>
                    <asp:Parameter Name="StoreID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StoreName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="ContactFirstName" Type="String" />
                    <asp:Parameter Name="ContactLastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="CityID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StoreName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="ContactFirstName" Type="String" />
                    <asp:Parameter Name="ContactLastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="CityID" Type="Int32" />
                    <asp:Parameter Name="StoreID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </div>
</asp:Content>


