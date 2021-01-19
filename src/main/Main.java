package main;

import java.sql.SQLException;

import javax.swing.*;

import dataaccess.DAConnection;
import de.javasoft.plaf.synthetica.SyntheticaAluOxideLookAndFeel;
import presentations.FrameManager;
import presentations.LoginFrame;
import presentations.TroubleshootFrame;


public class Main {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
//		try {
//			//UIManager.setLookAndFeel(new SyntheticaAluOxideLookAndFeel());
//			//UIManager.setLookAndFeel("de.javasoft.plaf.synthetica.SyntheticaStandardLookAndFeel");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			DAConnection.getConnection();
			FrameManager frame = new FrameManager();
			frame.setVisible(true);

			LoginFrame dialog = new LoginFrame(frame);
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
			dialog.setLocationRelativeTo(frame);
		} catch (ClassNotFoundException | SQLException e) {
//			TroubleshootFrame frame = new TroubleshootFrame();
//			frame.setLocationRelativeTo(null);
//			frame.setTitle("Cài đặt kết nối tới cơ sở dữ liệu");
//			frame.pack();
//			frame.setVisible(true);
			System.err.println("Hệ Thống Chưa Có Kết Nối CSDL");
		}
		
	}

}
