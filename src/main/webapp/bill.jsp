  <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="css/bill.css">
    <title>Bill</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();

try {
    int total = 0, sno = 0;
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

   
    String latestOrderDate = "";
    ResultSet rsDate = st.executeQuery("SELECT orderDate FROM cart WHERE email='" + email + "' AND status='bill' ORDER BY orderDate DESC LIMIT 1");
    if (rsDate.next()) {
        latestOrderDate = rsDate.getString("orderDate");
    }

  
    ResultSet rsTotal = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND orderDate='" + latestOrderDate + "'");
    if (rsTotal.next()) {
        total = rsTotal.getInt(1);
    }

    
    ResultSet rs2 = st.executeQuery("SELECT * FROM users INNER JOIN cart ON users.email=cart.email WHERE cart.email='" + email + "' AND cart.orderDate='" + latestOrderDate + "'");
    if (rs2.next()) {
%>

<h3>Online Shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%= rs2.getString("name") %></h3></div>
<div class="right-div-right"><h3>Email: <%= email %></h3></div>
<div class="right-div"><h3>Mobile Number: <%= rs2.getString("mobileNumber") %></h3></div>

<div class="left-div"><h3>Order Date: <%= rs2.getString("orderDate") %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%= rs2.getString("paymentMethod") %></h3></div>
<div class="right-div"><h3>Expected Delivery: <%= rs2.getString("deliveryDate") %></h3></div>

<div class="left-div"><h3>Transaction ID: <%= rs2.getString("transactionId") %></h3></div>
<div class="right-div-right"><h3>City: <%= rs2.getString("city") %></h3></div>
<div class="right-div"><h3>Address: <%= rs2.getString("address") %></h3></div>

<div class="left-div"><h3>State: <%= rs2.getString("state") %></h3></div>
<div class="right-div-right"><h3>Country: <%= rs2.getString("country") %></h3></div>
<hr><br>

<table id="customers">
    <h3>Product Details</h3>
    <tr>
        <th>S.No</th>
        <th>Product Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Sub Total</th>
    </tr>
<%
    ResultSet rs1 = st.executeQuery("SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.email='" + email + "' AND cart.orderDate='" + latestOrderDate + "'");
    while (rs1.next()) {
        sno++;
%>
    <tr>
        <td><%= sno %></td>
        <td><%= rs1.getString("name") %></td>
        <td><%= rs1.getString("category") %></td>
        <td><%= rs1.getString("price") %></td>
        <td><%= rs1.getString("quantity") %></td>
        <td><%= rs1.getString("total") %></td>
    </tr>
<% } %>
</table>

 <h3>Total: <%= total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

<%
    } else {
%>
    <h3>No recent order found.</h3>
<%
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>

 
 
 
 
 