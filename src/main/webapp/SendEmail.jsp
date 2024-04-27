<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Random"%>
    <%@ page import="java.util.Properties" %>
    <%@ page import="javax.mail.*" %>
    <%@ page import="javax.mail.Authenticator" %>
    <%@ page import="javax.mail.Session" %>
    <%@ page import="javax.mail.PasswordAuthentication" %>
 	<%@ page import="javax.mail.Message" %>
 	<%@ page import="javax.mail.internet.MimeMessage" %>
 	<%@ page import="javax.mail.internet.InternetAddress" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Email</title>
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
    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: #9EA1D5;
        border-radius: 5px;
        box-shadow:
    inset 0 -3em 3em rgb(0 200 0 / 30%),
    0 0 0 2px blue,
    0.3em 0.3em 1em rgb(200 0 0 / 60%);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 5px;
    }

    input[type="text"] {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        padding: 10px;
        background-color: #6504b0;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<%
	Random random = new Random();
	int min = 100000;
	int max = 999999;
	int genOtp = min + random.nextInt((max - min) + 1);

	String outPut = String.valueOf(genOtp);
	String toEmail=request.getParameter("email");
	String myEmail = "deepakkumaradhikari007@outlook.com";
    String password = "dmldml007";

    try{
    Properties prop = new Properties();
	prop.setProperty("mail.smtp.host", "smtp.office365.com");
	prop.setProperty("mail.smtp.port","587");
	prop.setProperty("mail.smtp.auth","true");
	prop.setProperty("mail.smtp.starttls.enable","true");
	prop.put("mail.smtp.socketFactory.port","587");
	prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
   /*  prop.put("mail.smtp.port", "465");
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.socketFactory.port", "465");
    prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); */
    
    
    Session s1 = Session.getInstance(prop, new Authenticator(){
		@Override
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(myEmail,password);
		 }
		
	});  
	
	Message mess= new MimeMessage(s1);
	
	mess.setFrom(new InternetAddress(myEmail));
	
	mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	
	
	mess.setSubject("User Email Verification");
	
	mess.setText("Hi! Your Account is Registered Successfully, Please verify your account using this code : "+genOtp);
	
	Transport.send(mess);
	
	
}
catch(Exception e){
	e.printStackTrace();
}
	%>
	<div class="container">
		<h2>Verify OTP</h2>
		<form action="Verify.jsp" method="post">
			<input type="hidden" name="outputOtp" value="<%=outPut%>">
			<label for="otpvalue">Enter OTP:</label> <input type="text"
				id="otpvalue" name="otpvalue" required> <input type="submit"
				value="Submit">
		</form>
	</div>

</body>
</html>