package com.team.sharemap.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.team.sharemap.vo.TripsList;

public class TripsDAO {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@211.238.142.58:1521:orcl";
	private String user = "HR";
	private String pwd = "1234";

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

	public int addTrips(TripsList t) {
		PreparedStatement ps = null;
		Connection con =null;

		String sql="INSERT INTO TRIPSLIST(CNUM, CNAME, CID, CON, CLIKE, CDATE) VALUES ((SELECT NVL(MAX(ROWNUM),0)+1 FROM TRIPSLIST), ?, 1, 1, 1,SYSDATE)";
		con=getConn();
		int af=0;
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, t.getCname());
			//ps.setString(2,t.getId());
			//ps.setString(3,t.getOn());
			//ps.setInt(4, t.getLike());

			af=ps.executeUpdate();
			if(af == 1){
				System.out.println("여행 일정 추가에 성공했습니다.");
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

	public Vector<TripsList> getTripsList() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TripsList> tlist = new Vector<TripsList>();
		con=getConn();

		try {
			sql = "SELECT * FROM TRIPSLIST ORDER BY CDATE";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				TripsList t= new TripsList();
				t.setCname(rs.getString("cname"));
				t.setCdate(rs.getString("cdate"));
				tlist.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return tlist;
	}
	
	   public int tripslistDelete(TripsList t){
		      
		      PreparedStatement ps = null;
		      Connection con =null;
		      String sql="DELETE TRIPSLIST WHERE CNAME = ?";
		      
		      con=getConn();
		      int af=0;
		      try {
		         ps=con.prepareStatement(sql);
		         ps.setString(1, t.getCname());
		         af=ps.executeUpdate();
		         if(af==1){
		            System.out.println("삭제되었습니다.");
		         }else{
		            System.out.println("삭제 실패.");
		         }	         
		      } catch (SQLException e) {
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
