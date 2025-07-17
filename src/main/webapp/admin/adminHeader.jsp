<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../css/home-style.css">
 
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
 


</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String email=session.getAttribute("email").toString(); %>
   
            <center><h2>Online shopping </h2></center>
            <a href="addNewProduct.jsp">Add New Product <i class='fa fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fa fa-box'></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class='fa fa-comment'></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fa fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancel Orders <i class='fa fa-window-close'></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class='fa fa-truck'></i></a>
            <a href="../logout.jsp">Logout <i class='fa fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
