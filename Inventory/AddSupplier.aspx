<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="Purchase.AddSupplier" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Supplier</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/datatables.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />



    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="js/plugins/flot/jquery.flot.time.js"></script>

   

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   
</head>
<body>

    <form id="form1" runat="server">
        <div class="wrapper wrapper-content">
            <div class="col-lg-12">
                <div class="ibox">
                    <div class="ibox-title text-center">
                        <h5>Add Supplier</h5>
                    </div>
                    <div class="ibox-content">

                        

                        <asp:Label ID="Label1" runat="server" Text="Supplier Name"></asp:Label>
                        <asp:TextBox ID="txtSname" runat="server" CssClass="form-control-sm form-control width" ></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtSphone" runat="server" CssClass="form-control-sm form-control width" style="margin-left: 51px"  TextMode="Phone"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtSaddress" runat="server" CssClass="form-control-sm form-control width" style="margin-left: 40px" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnAdd" runat="server" style="margin-left: 200px" class=" btn btn-success m-t-n-xs" Text="Add" OnClick="btnAdd_Click" />

                        

                    </div>
                </div>

            </div>
        </div>
    </form>
</body>

</html>
