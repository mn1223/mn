package com.ram.boardex;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class testJdbc {
	@Autowired	//spring전용 , @Inject : 자바에서 지원
	private DataSource dataSource;
	//DataSource = new DataSource();
	
	@Test
	public void testConn() {
		try {
		Connection conn = dataSource.getConnection();
		System.out.println(conn);
					
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
