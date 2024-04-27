<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-image: url('image/etool.jpg');
    background-size: cover;
    background-repeat: no-repeat;
}
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    h2{
    text-align: center;
    }
    </style>
</head>
<body>
	<body>
		
<%
String userOtp=request.getParameter("otpvalue");
String outputOtp=request.getParameter("outputOtp");
if(userOtp!=null && userOtp.equals(outputOtp)){
	out.println("<h2>User otp verified Successfully</h2>");
}
else{
	out.println("<h2>Your OTP Does Not Matched!</h2>");
}
%>

</body>

</body>
</html>