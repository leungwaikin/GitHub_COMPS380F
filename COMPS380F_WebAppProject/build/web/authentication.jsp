<%-- 
    Document   : authentication
    Created on : 2018年3月14日, 下午09:29:50
    Author     : Kin
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication</title>
    </head>
    <body>
        <%
            String name=request.getParameter("username");
            String pw=request.getParameter("password");
            out.println(name);
            out.println(pw);
         %>
         <%
             try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?zeroDateTimeBehavior=convertToNull","root","");
               PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
               ps.setString(1,name);
               ps.setString(2,pw);
               ResultSet rs=ps.executeQuery();
               if (rs.next())
               {
                   response.sendRedirect("positive.html");
               }
               else
               {
                   response.sendRedirect("negative.html");
               }
             }catch(SQLException e){}
             
         %>
    </body>
</html>
