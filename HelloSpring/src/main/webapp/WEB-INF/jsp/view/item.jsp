<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Register Form</title>
</head>
<body>
    <h1>New Item</h1>
    <form:form name="itemsubmitForm" method="POST">
   <input type="hidden" name="userName" value="XXXX to be insert">
   <input type="hidden" name="status" value="available">
   <input type="hidden" name="bidnumbeer" value="0">
            <table>
                <tr>
                    <td>Item Description</td>
                    <td><input type="text" name="description" /></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" id="myPhoto"/></td>
                </tr>
                <tr>
                    <td>Expected Price</td>
                    <td><input type="text" name="price" /></td>
                </tr>   
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </table>
            <div style="color: red">${error}</div>
          
    </form:form>
</body>
</html>