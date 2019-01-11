package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.java.teamproject.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class MySQLConnectionTest {
 
    static final String DRIVER = "com.mysql.jdbc.Driver";
    static final String URL = "jdbc:mysql://54.180.2.3:3306/test?useSSL=false";
    static final String USERNAME = "scott";
    static final String PASSWORD = "tiger";
    
    @Autowired BCryptPasswordEncoder passwordEncoder;
 
    @Test
    public void doTest() {
//    	getMySQLConnectionTest();
    	setPwEncryptioning();
    }
    
    public void setPwEncryptioning() {
    	
    	
    	Connection conn = null;
        Statement stmt = null;
        
        try {
            
            System.out.println("==================== MySQL Connection START ====================");
            
            Class.forName(DRIVER);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
 
//            String sql = "SELECT * FROM test.User";
 
            User user = new User("twon123", "xodnjs2973", "twon123@gmail.com", null, "엄태원찐", null, 0, null, null, 0);
            
//            BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
//            System.out.println(user.toString());
            
            String pw = passwordEncoder.encode(user.getPassword());
            
            user.setPassword(pw);
            System.out.println(user.toString());
            
            /*String sql = "INSERT INTO User (id, password, email, nickname) VALUES " + 
            		"(" + user.getId() + "," + user.getPassword() + "," + user.getEmail() + "," + user.getNickname() + ")";*/
            
            String sql_1 = String.format("INSERT INTO test.User (id, password, email, nickname) VALUES ('%s', '%s', '%s', '%s')", user.getId(), user.getPassword(), user.getEmail(), user.getNickname());
            
            System.out.println(sql_1);
            if(stmt.executeUpdate(sql_1) == 1) {
            	System.out.println("DB Insert Success");
            } else {
            	System.out.println("DB Insert Fail");
            }
 
            stmt.close();
            conn.close();
 
        } catch (SQLException se1) {
            se1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        
        System.out.println("==================== MySQL Connection END ====================");
    	
    }
    
    public void getMySQLConnectionTest() {
    	
        
        Connection conn = null;
        Statement stmt = null;
        
        try {
            
            System.out.println("==================== MySQL Connection START ====================");
            
            Class.forName(DRIVER);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
 
            String sql = "SELECT * from test.Board";
 
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                
                String boardSubject = rs.getString("BOARD_SUBJECT");
                String boardContent = rs.getString("BOARD_CONTENT");
                String boardWriter = rs.getString("BOARD_WRITER");
 
                System.out.print("boardSubject : " + boardSubject + ", ");
                System.out.print("boardContent: " + boardContent + ", ");
                System.out.println("boardWriter: " + boardWriter);
            }
 
            rs.close();
            stmt.close();
            conn.close();
 
        } catch (SQLException se1) {
            se1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        
        System.out.println("==================== MySQL Connection END ====================");
    }
}
