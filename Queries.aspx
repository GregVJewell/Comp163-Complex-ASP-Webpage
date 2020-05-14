<%@ Page Title="Queries" Language="C#" MasterPageFile="~/Practice.Master" AutoEventWireup="true" CodeBehind="Queries.aspx.cs" Inherits="SimpleWebPage.WebForm1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="main_content">
    <div class="topnav">
        <a class="active" href="Home.aspx">Home</a> <a href="Components.aspx">Components</a> <a href="Queries.aspx">RT Queries</a>
    </div>
    <hr />
    <div>
        <h1 align="center" style="color: #FFFFFF">RT Queries</h1>
        <hr />
        <div>
            <h3 style="color: #FFFFFF">Highest Earning Employee ID</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Height="50px" Width="350px" BackColor="#CCCCCC">
                <Fields>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Most Paid Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                </Fields>
            </asp:DetailsView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT  TOP 1 [EmployeeID] FROM [Employee] ORDER BY [Salary] DESC"></asp:SqlDataSource>
        <hr />
        <div>
            <h3 style="color: #FFFFFF">2010 Bicycle Sales Information</h3>
            <asp:DetailsView ID="DetailsView5" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource5" Height="50px" Width="350px" BackColor="#CCCCCC">
                <Fields>
                    <asp:BoundField DataField="ModelType" HeaderText="ModelType" SortExpression="ModelType" />
                    <asp:BoundField DataField="Total Sale Price" HeaderText="Total Sale Price" ReadOnly="True" SortExpression="Total Sale Price" />
                    <asp:BoundField DataField="Total List Price" HeaderText="Total List Price" ReadOnly="True" SortExpression="Total List Price" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" 
                SelectCommand="SELECT
	                                ModelType, sum(SalePrice) as 'Total Sale Price', sum(ListPrice) 'Total List Price'
                                FROM
	                                Bicycle
                                WHERE
	                                year(OrderDate) = 2010
                                GROUP BY
	                                ModelType">
            </asp:SqlDataSource>
        </div>
        <hr />
        <div>
            <h3 style="color: #FFFFFF">March 2007 Most Popular Paint Name</h3>
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="350px" BackColor="#CCCCCC">
                <Fields>
                    <asp:BoundField DataField="ColorName" HeaderText="ColorName" SortExpression="ColorName" />
                    <asp:BoundField DataField="Total Orders" HeaderText="Total Orders" ReadOnly="True" SortExpression="Total Orders" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT TOP 1
	Paint.ColorName, count(SerialNumber) as 'Total Orders'
FROM
	Bicycle left join Paint on Bicycle.PaintID = Paint.PaintID
WHERE
	year(Bicycle.OrderDate) = 2007 and month(Bicycle.OrderDate) = 3
GROUP BY
	Paint.ColorName
ORDER BY
	'Total Orders' DESC"></asp:SqlDataSource>
        </div>
        <hr />
        <div>
            <h3 style="color: #FFFFFF">Top Outstanding Manufacturer Bill</h3>
            <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="350px" BackColor="#CCCCCC">
                <Fields>
                    <asp:BoundField DataField="ManufacturerName" HeaderText="ManufacturerName" SortExpression="ManufacturerName" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT TOP 1
	Manufacturer.ManufacturerName
FROM
	PurchaseOrder left join Manufacturer on PurchaseOrder.ManufacturerID = Manufacturer.ManufacturerID
ORDER BY
	AmountDue DESC"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

