<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="Car_For_Sale.Overview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: left;
        }
    .auto-style7 {
        font-size: x-large;
        color: #003300;
    }
        .auto-style8 {
            height: 22px;
            text-align: center;
            text-decoration: underline;
            font-size: medium;
        }
        .auto-style9 {
            color: #003300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style4">
        <div class="auto-style4">
            <table class="auto-style9" style="width:100%;">
                <tr>
                    <td class="auto-style8"><em><strong>Overview</strong></em></td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <span class="auto-style7"><strong>CAR FOR SALE</strong></span><br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="carID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Height="199px" Width="1137px">
            <Columns>
                <asp:BoundField DataField="carID" HeaderText="carID" ReadOnly="True" SortExpression="carID" />
                <asp:BoundField DataField="manufacturerName" HeaderText="manufacturerName" SortExpression="manufacturerName" />
                <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
                <asp:BoundField DataField="cc" HeaderText="cc" SortExpression="cc" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#C0EA6A" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <span class="auto-style7"><strong>PURCHASER DATA</strong></span><br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="purcID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." Height="209px" Width="1138px">
            <Columns>
                <asp:BoundField DataField="purcID" HeaderText="purcID" ReadOnly="True" SortExpression="purcID" />
                <asp:BoundField DataField="purcName" HeaderText="purcName" SortExpression="purcName" />
                <asp:BoundField DataField="purcAddress" HeaderText="purcAddress" SortExpression="purcAddress" />
                <asp:BoundField DataField="purcPhone" HeaderText="purcPhone" SortExpression="purcPhone" />
                <asp:BoundField DataField="carID" HeaderText="carID" SortExpression="carID" />
                <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#C0EA6A" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" DeleteCommand="DELETE FROM [purchasers] WHERE [purcID] = @purcID" InsertCommand="INSERT INTO [purchasers] ([purcName], [purcAddress], [purcPhone], [carID], [modelName]) VALUES (@purcName, @purcAddress, @purcPhone, @carID, @modelName)" SelectCommand="SELECT [purcID], [purcName], [purcAddress], [purcPhone], [carID], [modelName] FROM [purchasers]" UpdateCommand="UPDATE [purchasers] SET [purcName] = @purcName, [purcAddress] = @purcAddress, [purcPhone] = @purcPhone, [carID] = @carID, [modelName] = @modelName WHERE [purcID] = @purcID">
            <DeleteParameters>
                <asp:Parameter Name="purcID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="purcName" Type="String" />
                <asp:Parameter Name="purcAddress" Type="String" />
                <asp:Parameter Name="purcPhone" Type="Int32" />
                <asp:Parameter Name="carID" Type="Int32" />
                <asp:Parameter Name="modelName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="purcName" Type="String" />
                <asp:Parameter Name="purcAddress" Type="String" />
                <asp:Parameter Name="purcPhone" Type="Int32" />
                <asp:Parameter Name="carID" Type="Int32" />
                <asp:Parameter Name="modelName" Type="String" />
                <asp:Parameter Name="purcID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
