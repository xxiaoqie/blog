package tzc.blog.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;


public class DBUtils {
	
	private static DataSource ds;
	
	static {
			
		try {
			Properties properties = new Properties();
			properties.load(DBUtils.class.getResourceAsStream("/jdbc.properties"));
			ds = DruidDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static DataSource getDataSource() {
		return ds;
	}
	
	
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
}
