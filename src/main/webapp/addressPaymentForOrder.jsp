<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<title>Home</title>
</head>
<body>
<br>
<table>
<thead>
<%
	String email=session.getAttribute("email").toString();
    int total=0;
    int sno=0;
    try
    {
    	Connection con=ConnectionProvider.getCon();
    	Statement st=con.createStatement();
    	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
    	while(rs1.next()){
    		total=rs1.getInt(1);
    	}
    
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fa-solid fa-circle-arrow-left'>Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
          <%
        ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'and cart.address is NULL");
          while(rs.next()){
        	  
        %>
          <tr>
                   <%sno=sno+1; %>
          
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
            <td><%=rs.getString(8)%> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(10)%></td>
            </tr>
         <%}
          ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
          while(rs2.next()){
        	  
          %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post"> 

 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name ="address" value="<%=rs2.getString(7)%>" Placeholder="Enter Address" required>

 </div>

<div class="right-div">
<h3>Enter city</h3>
 <input class="input-style" type="text" name ="city" value="<%=rs2.getString(8)%>" Placeholder="Enter City" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
 <input class="input-style" type="text" name ="state" value="<%=rs2.getString(9)%>" Placeholder="Enter State" required>

</div>

<div class="right-div">
<h3>Enter country</h3>
 <input class="input-style" type="text" name ="country" value="<%=rs2.getString(10)%>" Placeholder="Enter Country" required>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set your address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="paymentMethod">
<option value="Cash on delivery(COD)">Cash On delivery(COD)</option>
<option value="Online Payment">Online Payment</option>
</select>
 
</div>

<div class="right-div">
<h3>Pay online on this Lakshya@oksbi</h3>
<input class="input-style" type="text" name ="transactionId" Placeholder="Enter Transaction ID">


<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name ="mobileNumber" value="<%=rs2.getString(3)%>" Placeholder="Enter Mobile Number" required>


<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="Submit">Proceed to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>

<%
          }
    }
catch(Exception e){
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>