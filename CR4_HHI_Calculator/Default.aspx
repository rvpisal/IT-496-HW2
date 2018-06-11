<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CR4_HHI_Calculator.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="Css_file.css" rel="stylesheet" />--%>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <style type="text/css">
        .txtbox {
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50px;
            width: 150px;
            text-align: center;
        }
    </style>

</head>
<body style="background-color: lightgray">
    <div style="border-style: double; width: 70%; margin: auto; margin-top: 3%">
        <form id="form1" runat="server">
            <div style="border-style: double">
                <h1 style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">CR4 & HHI Calculator</h1>
            </div>
            <div style="padding-top: 3%; padding-left: 2%">
                <b><i>Firm 1 Market Share : </i></b>
                <asp:TextBox ID="fr1" CssClass="txtbox" runat="server"></asp:TextBox>
                %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><i>Firm 2 Market Share : </i></b>

                <asp:TextBox ID="fr2" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            <br />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="fr2" runat="server" ErrorMessage="Required for CR4 calculation"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="fr1" runat="server" ErrorMessage="Required for CR4 calculation"></asp:RequiredFieldValidator>
                <br />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
                <b><i>Firm 3 Market Share : </i></b>
                <asp:TextBox ID="fr3" CssClass="txtbox" runat="server"></asp:TextBox>
                %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><i>Firm 4 Market Share : </i></b>
                <asp:TextBox ID="fr4" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            <br />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="fr3" runat="server" ErrorMessage="Required for CR4 calculation"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="fr4" runat="server" ErrorMessage="Required for CR4 calculation"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br />

                <b><i>Firm 5 Market Share : </i></b>
                <asp:TextBox ID="fr5" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><i>Firm 6 Market Share : </i></b>
                <asp:TextBox ID="fr6" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            <br />
                <br />
                <br />

                <b><i>Firm 7 Market Share : </i></b>
                <asp:TextBox ID="fr7" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><i>Firm 8 Market Share : </i></b>
                <asp:TextBox ID="fr8" CssClass="txtbox" runat="server"></asp:TextBox>
                %
            <br />
                <br />
                <div style="padding-left: 25%">
                    <asp:Button ID="calc" runat="server" CssClass="btn-success btn-lg" Text="Calculate" OnClick="calc_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="reset" runat="server" CssClass="btn-success btn-lg" Text="Reset" OnClick="reset_Click"/>
                </div>
                <div class="alert alert-danger" role="alert">
                    <asp:Label ID="tot_label" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <br />

                <asp:Label ID="new_CR4" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="old_CR4" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="diff_CR4" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Label ID="new_HHI" runat="server" Text=""></asp:Label>
                &nbsp;<asp:Label ID="new_mk_stat" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="old_HHI" runat="server" Text=""></asp:Label>
                &nbsp;<asp:Label ID="old_mk_stat" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="diff_HHI" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Label ID="stmt_HHI" runat="server" Text=""></asp:Label>
                <br />
            </div>

        </form>
    </div>
</body>
</html>
