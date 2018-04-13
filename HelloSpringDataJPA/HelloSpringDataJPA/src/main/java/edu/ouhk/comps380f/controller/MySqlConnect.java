/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ouhk.comps380f.controller;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Kin
 */
public class MySqlConnect {
    Connection conn=null;
    public static  Connection connectDB(){
        try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Account","NBUSER","NBUSER");
             return conn;
        }catch (Exception e){return null;}
    }
}
