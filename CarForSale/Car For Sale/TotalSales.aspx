<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TotalSales.aspx.cs" Inherits="Car_For_Sale.TotalSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            font-size: x-large;
            text-decoration: underline;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style8 {
            text-align: center;
            text-decoration: underline;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style2">
        <table style="width:100%;">
            <tr>
                <td class="auto-style8"><strong><em>Total Sales</em></strong></td>
            </tr>
        </table>
        <span class="auto-style5"><strong>
        <br />
        <br />
        SALES RECORD<br />
        </strong></span><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="purcID,carID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical" Height="180px" Width="853px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="purcID" HeaderText="purcID" InsertVisible="False" ReadOnly="True" SortExpression="purcID" />
            <asp:BoundField DataField="purcName" HeaderText="purcName" SortExpression="purcName" />
            <asp:BoundField DataField="carID" HeaderText="carID" InsertVisible="False" ReadOnly="True" SortExpression="carID" />
            <asp:BoundField DataField="manufacturerName" HeaderText="manufacturerName" SortExpression="manufacturerName" />
            <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
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
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" DeleteCommand="DELETE FROM [purchasers] WHERE [purcID] = @purcID" InsertCommand="INSERT INTO [purchasers] ([purcName], [purcAddress], [purcPhone], [carID], [modelName]) VALUES (@purcName, @purcAddress, @purcPhone, @carID, @modelName)" SelectCommand="SELECT t2.purcID, t2.purcName, t1.carID, t1.manufacturerName, t1.modelName, t1.price
FROM carforsale AS t1 INNER JOIN purchasers AS t2 ON t1.carID = t2.carID" UpdateCommand="UPDATE [purchasers] SET [purcName] = @purcName, [purcAddress] = @purcAddress, [purcPhone] = @purcPhone, [carID] = @carID, [modelName] = @modelName WHERE [purcID] = @purcID">
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
<br />
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" SelectCommand="SELECT  FORMAT(SUM(t1.price), 'RM 0.00') AS TotalSales
FROM carforsale AS t1
INNER JOIN purchasers AS t2 ON t1.carID = t2.carID
"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="265px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="TotalSales" HeaderText="TotalSales" ReadOnly="True" SortExpression="TotalSales" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
<br />
    <br />
    <br />
    <span class="auto-style7">Find Purchaser Information:</span><span class="auto-style6"><br />
    <asp:Button ID="btnFind" runat="server" CssClass="oval-button" OnClick="btnFind_Click" Text="Find" />
    &nbsp;</span><asp:TextBox ID="txtFind" runat="server" CssClass="auto-style6" placeholder="enter purchaser ID" BorderStyle="Dashed" Width="200px"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtFind" CssClass="auto-style7" ErrorMessage="* enter valid ID" ForeColor="Red" MaximumValue="3999" MinimumValue="3000" Type="Integer"></asp:RangeValidator>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" SelectCommand="SELECT [purcID], [purcName], [purcAddress], [purcPhone], [modelName] FROM [purchasers]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="purcID" ForeColor="#333333" GridLines="None" Height="50px" Width="418px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="purcID" HeaderText="purcID" InsertVisible="False" ReadOnly="True" SortExpression="purcID" />
            <asp:BoundField DataField="purcName" HeaderText="purcName" SortExpression="purcName" />
            <asp:BoundField DataField="purcAddress" HeaderText="purcAddress" SortExpression="purcAddress" />
            <asp:BoundField DataField="purcPhone" HeaderText="purcPhone" SortExpression="purcPhone" />
            <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
</asp:Content>
