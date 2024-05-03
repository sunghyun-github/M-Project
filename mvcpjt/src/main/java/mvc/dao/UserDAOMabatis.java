package mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mvc.common.JDBCConnect;
import mvc.common.SqlSessionManager;
import mvc.dto.UserDTO;

public class UserDAOMabatis {
	
	private SqlSession sqlSession;
	
	public UserDAOMabatis() {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		this.sqlSession = sqlSessionFactory.openSession();
	}	
	
	public List<UserDTO> getUsers(){
		// list
		return sqlSession.selectList("userMapper.getUsers");
	}
	
	public List<UserDTO> getUsers(Map<String, Integer> map){
		
		return sqlSession.selectList("userMapper.getUsersPage", map);
	}
	
	public int getUserCount(){
		
		return sqlSession.selectOne("userMapper.getUserCount");
	}
	
	
	public UserDTO getUser(UserDTO dto) {
		return sqlSession.selectOne("userMapper.getUser", dto);
	}
	
	public int insertUser(UserDTO dto){
		return sqlSession.insert("userMapper.insertUser", dto);
	}
	
	
	public int update(UserDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0; 

		try{
			// 2. connection
			conn = JDBCConnect.getConnection();
			
			// 3. sql 창
			String sql = "update users set password=?, name=?, role=? where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPassword());
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getRole());
			pstmt.setString(4,dto.getId());
			// 4. execute
			rs = pstmt.executeUpdate();	// insert, update, delete
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCConnect.close(pstmt, conn);
		}
		return rs;
	}

	
	public int delete(UserDTO dto) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select

		try {
			// 2. connection
			conn = JDBCConnect.getConnection();
			
			// 3. sql 창,  탙퇴 처리
			String	sql = "delete from users where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// 4. execute
			result = pstmt.executeUpdate(); // insert, update, delete


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnect.close(pstmt, conn);
			
		}
		
		return result;
	}

	

}
