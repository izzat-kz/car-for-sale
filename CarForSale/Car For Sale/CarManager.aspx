<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CarManager.aspx.cs" Inherits="Car_For_Sale.CarManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-size: large;
            text-decoration: underline;
        }
        .auto-style5 {
            font-size: medium;
        }
        .auto-style6 {
            color: red;
        }
        .auto-style7 {
            font-size: small;
        }
        .auto-style8 {
            font-size: x-large;
            text-align: center;
        }
        .auto-style9 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style11 {
            font-size: x-large;
        }
        .auto-style12 {
            font-size: medium;
            text-align: center;
            text-decoration: underline;
        }
        .auto-style13 {
            height: 49px;
        }
        .auto-style14 {
            height: 23px;
        }
        .auto-style15 {
            height: 23px;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <strong>
    <span class="auto-style9"><em>
    <p class:"a" class="auto-style12">manager page</p><br />
    CAR TABLE</em></span><span class="auto-style2"><br />
    </span>
    </strong>
    <span class="auto-style2">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="carID" DataSourceID="SqlCarForSale" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView2_SelectedIndexChanged" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="1155px" Height="278px">
        <Columns>
            <asp:BoundField DataField="carID" HeaderText="carID" InsertVisible="False" ReadOnly="True" SortExpression="carID" />
            <asp:BoundField DataField="manufacturerName" HeaderText="manufacturerName" SortExpression="manufacturerName" />
            <asp:BoundField DataField="modelName" HeaderText="modelName" SortExpression="modelName" />
            <asp:BoundField DataField="cc" HeaderText="cc" SortExpression="cc" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#C0EA6A" Font-Bold="True" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:Button ID="btnRefresh" runat="server" CssClass="oval-button" OnClick="btnRefresh_Click" Text="Refresh Table" />
    <asp:SqlDataSource ID="SqlCarForSale" runat="server" ConnectionString="<%$ ConnectionStrings:carforsaleDATABASEConnectionString1 %>" SelectCommand="SELECT * FROM [carforsale]">
    </asp:SqlDataSource>
    </span><br />
    <br />
    <br />
    <span class="auto-style3"><strong>NEW CAR DETAILS<br />
    <br />
    </strong></span><span class="auto-style5">Manufacturer Name<br />
    <asp:TextBox ID="txtMan" runat="server" Width="360px" placeholder="enter manufacturer name" BorderStyle="Groove"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvMan" runat="server" ControlToValidate="txtMan" ErrorMessage="*" ForeColor="Red" CssClass="auto-style8" ValidationGroup="group1"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    Model Name<br />
    <asp:TextBox ID="txtModel" runat="server" Width="360px"  placeholder="enter model name" BorderStyle="Groove"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvModel" runat="server" ControlToValidate="txtModel" ErrorMessage="*" ForeColor="Red" CssClass="auto-style8" ValidationGroup="group1"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    Cubic Centimetres (cc)<br />
    <asp:TextBox ID="txtCC" runat="server" Width="360px" placeholder="enter cc" BorderStyle="Groove"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvCC" runat="server" ControlToValidate="txtCC" ErrorMessage="*" ForeColor="Red" CssClass="auto-style8" ValidationGroup="group1"></asp:RequiredFieldValidator>
    <br />
    <asp:RangeValidator ID="rvCC" runat="server" ControlToValidate="txtCC" ErrorMessage="enter cc from 1.0 to 4.0" ForeColor="Red" MaximumValue="4.0" MinimumValue="1.0" Type="Double" CssClass="auto-style7"></asp:RangeValidator>
    <br />
    <br />
    Car Price<br />
    <asp:TextBox ID="txtPrice" runat="server" Width="360px" placeholder="enter car price" BorderStyle="Groove"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" CssClass="auto-style8" ValidationGroup="group1"></asp:RequiredFieldValidator>
    <br />
    <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="enter valid price" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Double" CssClass="auto-style7"></asp:RangeValidator>
    <br />
    <br />
    <span class="auto-style6">*</span> indicates required fields</span>
    <br />
    <br />
    <asp:Button ID="btnEnter" runat="server" CssClass="oval-button" OnClick="btnEnter_Click" Text="Enter" ValidationGroup="group1" />
    <br />
    <br />
    <br />
    <br />
    <span class="auto-style3"><strong><br />
    </strong></span>
    <span class="auto-style11">
    <table style="width:100%;">
        <tr>
            <td>
    <span class="auto-style3"><strong>UPDATE CAR PRICE</strong></span></td>
        </tr>
        </span><strong>
    <span class="auto-style3">
    <span class="auto-style11">
        <tr>
            <td><span class="auto-style2"><span class="auto-style5">Car ID</span></span></td>
        </tr>
        <tr>
            <td><span class="auto-style2">
    <asp:TextBox ID="txtCarID" runat="server" placeholder="insert car ID" BorderStyle="Inset" CssClass="auto-style5"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvCarID" runat="server" ControlToValidate="txtCarID" CssClass="auto-style11" ErrorMessage="*" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
    </span></td>
        </tr>
        <tr>
            <td class="auto-style14"><span class="auto-style2">
    <asp:RangeValidator ID="rvCarID" runat="server" ControlToValidate="txtCarID" CssClass="auto-style7" ErrorMessage="enter valid car ID" ForeColor="Red" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
    </span></td>
        </tr>
        <tr>
            <td><span class="auto-style5">New Price</span></td>
        </tr>
        <tr>
            <td>
    <asp:TextBox ID="txtUpdatePrice" runat="server" placeholder="insert new price" BorderStyle="Inset" CssClass="auto-style5"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUpdatePrice" runat="server" ControlToValidate="txtUpdatePrice" CssClass="auto-style11" ErrorMessage="*" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td>
    <asp:RangeValidator ID="rvUpdatePrice" runat="server" ControlToValidate="txtUpdatePrice" CssClass="auto-style7" ErrorMessage="enter valid price" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
    <span class="auto-style5">
    <span class="auto-style6">*</span> indicates required fields</span>
    </td>
        </tr>
        <tr>
            <td>
    <asp:Button ID="btnUpdate" runat="server" Text="Update Price" CssClass="oval-button" OnClick="btnUpdate_Click" ValidationGroup="group2"/>
            </td>
        </tr>
    </table>
    </span></span>
    </strong><span class="auto-style5"><br />
    </span>&nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
