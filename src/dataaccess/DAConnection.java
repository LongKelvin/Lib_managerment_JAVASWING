package dataaccess;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

public class DAConnection {
	private static Connection con = null;

	private static String db_url = null;


	private static String db_user = null;


	private static String db_password = null;


	private static String db_driver = null;


	private static Connection conn;
	private DAConnection() {
	}

	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Properties p = new Properties();
		try {
			p.load(new FileInputStream("database.properties"));
			db_url = p.getProperty("db_url");
			db_user = p.getProperty("db_user");
			db_password = p.getProperty("db_password");
			db_driver = p.getProperty("db_driver");
			Class.forName(db_driver);
			conn = DriverManager.getConnection(db_url, db_user, db_password);
		} catch (FileNotFoundException e) {
			System.err.println("Không thấy tệp tin database.properties.");
		} catch (IOException e) {
			System.err.println("Có lỗi khi thao tác với tệp tin.");
		} catch (ClassNotFoundException e) {
			System.err.println("Không tìm thấy class.");
		} catch (SQLException e) {
			System.err.println("Lỗi kết nối cơ sở dư liệu.");
		}
		if (conn == null) {
			throw new NullPointerException("Kết nối không thành công.");
		}
		return conn;
	}
}
