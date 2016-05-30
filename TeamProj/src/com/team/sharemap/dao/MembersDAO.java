package com.team.sharemap.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.team.sharemap.vo.Members;

public class MembersDAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@211.238.142.139:1521:orcl";
	private String user = "Scott";
	private String pwd = "1111";
	
	public Connection getConn(){
		Connection con = null;

		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드에 실패하였습니다.");
			e.printStackTrace();
		}

		
		try {
			con = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			System.out.println("연결에 실패하였습니다.");
			e.printStackTrace();
		}
		return con;
	}
	
	 public Members getMember(String id){

	      Connection con=null;
	      //Statement st=null;
	      PreparedStatement ps=null;   
	      ResultSet rs=null;
	      Members member=null;

	      String sql="SELECT * FROM MEMBERS WHERE ID=?";
	      con=getConn();//드라이버 로드, 연결.

	      try {
	         ps=con.prepareStatement(sql);
	         ps.setString(1, id);
	         rs=ps.executeQuery();

	         if(rs.next()){//한 행씩 얻어옴

	            member=new Members();
	            member.setId(rs.getString("id"));
	            member.setPwd(rs.getString("pwd"));
	            member.setEmail(rs.getString("email"));
	            member.setGender(rs.getString("gender"));
	            member.setAge(rs.getInt("age"));
	            member.setProimg(rs.getString("promg"));
	            member.setRegdate(rs.getString("regdate"));

	         }

	      } catch (SQLException e) {
	         System.out.println("회원 조회 중에 오류가 발생했습니다.");
	         e.printStackTrace();
	      }finally{
	         try {
	            rs.close();
	            ps.close();
	            con.close();
	         } catch (SQLException e) {
	            System.out.println("접속해제에 실패하였습니다.");
	            e.printStackTrace();
	         }

	      }

	      return member;


	   }


	   public int addMember(Members m) {
	      PreparedStatement ps = null;
	      Connection con =null;
	      String sql="INSERT INTO MEMBERS (ID,PWD,EMAIL,GENDER,AGE,PROIMG,REGDATE) VALUES(?,?,?,?,?,?,SYSDATE)";
	      con=getConn();
	         int af=0;
	      try {

	         ps = con.prepareStatement(sql);
	         ps.setString(1,m.getId());
	         ps.setString(2,m.getPwd());
	         ps.setString(3,m.getEmail());
	         ps.setString(4,m.getGender());
	         ps.setInt(5,m.getAge());
	         ps.setString(6,m.getProimg());
	       
	         af=ps.executeUpdate();
	         
	         if(af==1){
	            System.out.println("회원가입에 성공했습니다.");
	         }

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally{
	         try {
	            ps.close();
	            con.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }

	      }
	      return af;
	       
	   }
	   
	   public int updateMember(Members m){
	        PreparedStatement ps = null;
	         Connection con = null;
	         
	         String sql = "UPDATE MEMBERS SET PWD=?,PROIMG=?,AGE=?,EMAIL=? WHERE ID=?";
	         con = getConn();
	      int af=0;
	         try {
	            ps = con.prepareStatement(sql);
	            ps.setString(1, m.getPwd());
	            ps.setString(2, m.getProimg());
	            ps.setInt(3,m.getAge());
	            ps.setString(4,m.getEmail());
	            ps.setString(5,m.getId());
	             af = ps.executeUpdate();
	             
	            if (af == 1) {
	               System.out.println("회원정보 수정에 성공하였습니다.");
	            } else {
	            	
	               System.out.println("회원정보 수정에 실패하였습니다.");
	            }
	         } catch (SQLException e) {
	            System.out.println("회원정보 수정중에 오류가 발생했습니다.");
	            e.printStackTrace();
	         } finally { // 예외가 일어나도 실행
	            try {
	               ps.close();
	               con.close();
	            } catch (SQLException e) {
	               System.out.println("접속해제에 실패하였습니다.");
	               e.printStackTrace();
	            }
	         }
	         
	         return af;
	   }

	   public int memberDelete(String id){
	      
	      PreparedStatement ps = null;
	      Connection con =null;
	      String sql="DELETE MEMBERS WHERE ID=?";
	      
	      con=getConn();
	      int af=0;
	      try {
	         ps=con.prepareStatement(sql);
	         ps.setString(1, id);
	         af=ps.executeUpdate();
	         if(af==1){
	            System.out.println("탈퇴되었습니다.");
	         }else{
	            System.out.println("탈퇴 실패.");
	         }	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally{
	         try {
	            ps.close();
	            con.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         
	      }
	      return af;
	   }
}
