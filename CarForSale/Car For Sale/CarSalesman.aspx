<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CarSalesman.aspx.cs" Inherits="Car_For_Sale.CarSalesman" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        font-size: xx-large;
        text-align: center;
    }
        .auto-style8 {
            font-size: medium;
            text-align: center;
        }
        .auto-style9 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <strong>    
    <em>
    <span class="auto-style8">
    <p class:"a" class="auto-style9">salesman page</p>
    </span>
    <br />
    <br />
    <span class="auto-style6">CAR LISTS<br />
    </span></em></strong><br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="carID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical" Width="1025px" Height="244px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="carID" HeaderText="carID" ReadOnly="True" SortExpression="carID" InsertVisible="False" />
        <asp:BoundField DataField="manufacturerName" HeaderText="manufacturerName" SortExpression="manufacturerName" />
        <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
        <asp:BoundField DataField="cc" HeaderText="cc" SortExpression="cc" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
    </Columns>
    <FooterStyle BackColor="#CCCC99" />
    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <RowStyle BackColor="#F7F7DE" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FBFBF2" />
    <SortedAscendingHeaderStyle BackColor="#848384" />
    <SortedDescendingCellStyle BackColor="#EAEAD3" />
    <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
<br />
<asp:DropDownList ID="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" Width="80px">
    <asp:ListItem Value="1.0">cc 1.0</asp:ListItem>
    <asp:ListItem Value="1.5">cc 1.5</asp:ListItem>
    <asp:ListItem Value="2.0">cc 2.0</asp:ListItem>
    <asp:ListItem Value="2.5">cc 2.5</asp:ListItem>
    <asp:ListItem Value="3.0">cc 3.0</asp:ListItem>
    <asp:ListItem Value="3.5">cc 3.5</asp:ListItem>
    <asp:ListItem Value="4.0">cc 4.0</asp:ListItem>
</asp:DropDownList>
<asp:Button ID="btnFilter" runat="server" BorderStyle="Solid" OnClick="btnFilter_Click" Text="Filter" Width="67px" />
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" DeleteCommand="DELETE FROM [carforsale] WHERE [carID] = @carID" InsertCommand="INSERT INTO [carforsale] ([manufacturerName], [modelName], [cc], [price]) VALUES (@manufacturerName, @modelName, @cc, @price)" SelectCommand="SELECT [carID], [manufacturerName], [modelName], [cc], [price] FROM [carforsale]" UpdateCommand="UPDATE [carforsale] SET [manufacturerName] = @manufacturerName, [modelName] = @modelName, [cc] = @cc, [price] = @price WHERE [carID] = @carID">
    <DeleteParameters>
        <asp:Parameter Name="carID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="manufacturerName" Type="String" />
        <asp:Parameter Name="modelName" Type="String" />
        <asp:Parameter Name="cc" Type="Decimal" />
        <asp:Parameter Name="price" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="manufacturerName" Type="String" />
        <asp:Parameter Name="modelName" Type="String" />
        <asp:Parameter Name="cc" Type="Decimal" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="carID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="carID">
        <AlternatingItemTemplate>
            <li style="background-color: #FFF8DC;">carID:
                <asp:Label ID="carIDLabel" runat="server" Text='<%# Eval("carID") %>' />
                <br />
                manufacturerName:
                <asp:Label ID="manufacturerNameLabel" runat="server" Text='<%# Eval("manufacturerName") %>' />
                <br />
                modelName:
                <asp:Label ID="modelNameLabel" runat="server" Text='<%# Eval("modelName") %>' />
                <br />
                cc:
                <asp:Label ID="ccLabel" runat="server" Text='<%# Eval("cc") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #008A8C;color: #FFFFFF;">carID:
                <asp:Label ID="carIDLabel1" runat="server" Text='<%# Eval("carID") %>' />
                <br />
                manufacturerName:
                <asp:TextBox ID="manufacturerNameTextBox" runat="server" Text='<%# Bind("manufacturerName") %>' />
                <br />
                modelName:
                <asp:TextBox ID="modelNameTextBox" runat="server" Text='<%# Bind("modelName") %>' />
                <br />
                cc:
                <asp:TextBox ID="ccTextBox" runat="server" Text='<%# Bind("cc") %>' />
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">manufacturerName:
                <asp:TextBox ID="manufacturerNameTextBox" runat="server" Text='<%# Bind("manufacturerName") %>' />
                <br />modelName:
                <asp:TextBox ID="modelNameTextBox" runat="server" Text='<%# Bind("modelName") %>' />
                <br />cc:
                <asp:TextBox ID="ccTextBox" runat="server" Text='<%# Bind("cc") %>' />
                <br />price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #DCDCDC;color: #000000;">carID:
                <asp:Label ID="carIDLabel" runat="server" Text='<%# Eval("carID") %>' />
                <br />
                manufacturerName:
                <asp:Label ID="manufacturerNameLabel" runat="server" Text='<%# Eval("manufacturerName") %>' />
                <br />
                modelName:
                <asp:Label ID="modelNameLabel" runat="server" Text='<%# Eval("modelName") %>' />
                <br />
                cc:
                <asp:Label ID="ccLabel" runat="server" Text='<%# Eval("cc") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">carID:
                <asp:Label ID="carIDLabel" runat="server" Text='<%# Eval("carID") %>' />
                <br />
                manufacturerName:
                <asp:Label ID="manufacturerNameLabel" runat="server" Text='<%# Eval("manufacturerName") %>' />
                <br />
                modelName:
                <asp:Label ID="modelNameLabel" runat="server" Text='<%# Eval("modelName") %>' />
                <br />
                cc:
                <asp:Label ID="ccLabel" runat="server" Text='<%# Eval("cc") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
<br />
    <br />
    <br />
    <asp:Button ID="btnSales" runat="server" Text="Record Sales" class="oval-button" OnClick="btnPurchaser_Click"/>
</asp:Content>
