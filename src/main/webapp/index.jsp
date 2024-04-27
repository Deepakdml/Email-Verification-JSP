<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Verification</title>
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
	
    <div class="container">
        <h2>Enter Your Name and Email</h2>
        <form method="post" action="SendEmail.jsp">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>

            <input type="submit" name="save" value="Submit">
        </form>
    </div>

</body>
</html>