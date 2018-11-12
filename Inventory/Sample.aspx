<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="Purchase.Sample" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Order | Details</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

 
    <script src="js/plugins/steps/jquery.steps.min.js"></script>
   
    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content">
           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Order Details</h5>
                            </div>
                            <div class="ibox-content">
                                
                                <form id="form1" runat="server">
                                   
                                <div class="row">
                                        <div class="col-lg-8">
                                            <asp:Label ID="lblOrderProduct" runat="server" Text="Order Product" Font-Bold="True" Font-Size="Larger"></asp:Label><br />
                                            <div class="form-group" style="margin-top: 21px" >
                                                <asp:Label ID="lblOrder" runat="server" Text="Order No."></asp:Label> 
                                                <asp:Label ID="lblProd" runat="server" Text="Product Name" style="margin-left:171px"></asp:Label>
                                                <asp:Label ID="lblPqty" runat="server" Text="Quantity" style="margin-left:202px"></asp:Label>
                                               <br />
                                                 <p style="display:flex;">
                                                      <asp:TextBox runat="server" ID="txtOrder" TextMode="SingleLine" CssClass="form-control width"/><br />
                                                       <asp:DropDownList ID="ddlProd" runat="server" CssClass="form-control ddlht" style="margin-left:46px;width:251px" OnSelectedIndexChanged="ddlProd_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:TextBox runat="server" ID="txtPqty" TextMode="SingleLine" CssClass=" form-control width" style="margin-left:42px" />
                                                        <button runat="server" class="btn btn-success" style="margin-left:25px" onserverclick="addOrder"><i class="fa fa-plus "></i></button>
                                                 </p>
                                                <p>
                                                <asp:RequiredFieldValidator ID="required" runat="server" style="margin-left:529px" ControlToValidate="txtPqty" ErrorMessage="Enter the quantity" ForeColor="Red" />
                                                
                                                </p>
                                            </div>

                                            <div class="col-lg-10">        
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr>
                                                                     <th>No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Qty</th>
                                                                     <th>Unit Price</th>
                                                                     <th>Total</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                        <tr class="gradeX">
                                                            
                                                             <td><%# ++count%></td>
                                                             <td><%# Eval("P_name")%></td>
                                                             <td><%# Eval("P_qty")%></td>
                                                             <td><%# Eval("P_price")%></td>
                                                             <td><%# Eval("P_tot")%></td>
                                                             <td><asp:LinkButton runat="server" ID="btnDelete" Text="Delete" OnCommand="btnDelete_Command" CommandName="Delete" CommandArgument='<%# Eval("No") %>'></asp:LinkButton></td>
                                                            <asp:HiddenField runat="server" ID="hid" Value='<%# Eval("No") %>' />
                                                            
                                                       </tr>
                                                   </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                       
                                </table>
                                        
                                        </FooterTemplate>
                                                    
                                </asp:Repeater>
                                    </div>

                                </div>
                        
                          
                                            <div>
                                              <asp:button runat="server" ID="btnOrder" text="Order" CssClass="btn btn-success" OnClick="btnOrder_Click" Visible="false" />
                                          </div>
                                        </div>
                                        </div>
                                       

                                  
                                </form>
                              
                            </div>
                        </div>
                    </div>

                </div>
           </div> 
        </div>

 </body>  


</html>

