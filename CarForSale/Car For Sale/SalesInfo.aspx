<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SalesInfo.aspx.cs" Inherits="Car_For_Sale.RecordPurchaser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
        font-size: medium;
    }
        .auto-style6 {
            text-decoration: underline;
            font-size: x-large;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            font-size: x-large;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <span class="auto-style6"><strong>SALES INFORMATION</strong></span><br />
    <br />
    <br />
    <strong><span class="auto-style5">Purchaser</span>:</strong><br />
    <br />
    <asp:TextBox ID="txtName" runat="server" Width="520px" placeholder="enter purchaser's name" CssClass="auto-style7"></asp:TextBox>
    <span class="auto-style7">
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" CssClass="auto-style3" ErrorMessage="*" ForeColor="Red" style="font-size: x-large"></asp:RequiredFieldValidator>
    <br />
    <br />
    </span>
    <asp:TextBox ID="txtAddress" runat="server" Width="520px" placeholder="enter purchaser's address" CssClass="auto-style7"></asp:TextBox>
    <span class="auto-style7">
    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="auto-style3" ErrorMessage="*" ForeColor="Red" style="font-size: x-large"></asp:RequiredFieldValidator>
    <br />
    <br />
    </span>
    <asp:TextBox ID="txtPhone" runat="server" Width="520px" placeholder="enter purchaser's telephone number" CssClass="auto-style7"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" CssClass="auto-style3" ErrorMessage="*" ForeColor="Red" style="font-size: x-large"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="enter a valid phone number" ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
<br />
<br />
<strong><span class="auto-style5">Car</span>:<br />
</strong>
    <br />
    <asp:DropDownList ID="ddlCar" runat="server" DataSourceID="SqlDataSource1" DataTextField="modelName" DataValueField="carID" CssClass="auto-style7" Width="199px">
    
    </asp:DropDownList>
    <br />
<br />
    <span class="auto-style5">
    <span class="auto-style8">*</span> indicates required fields</span>
    <br />
<br />
<asp:Button ID="btnRecord" runat="server" CssClass="oval-button" OnClick="btnRecord_Click" Text="Record Sales" />
    <br />
</asp:Content>
