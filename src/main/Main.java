package main;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

import javax.swing.*;

import dataaccess.DAConnection;
import de.javasoft.plaf.synthetica.SyntheticaAluOxideLookAndFeel;
import presentations.FrameManager;
import presentations.LoginFrame;
import presentations.TroubleshootFrame;


public class Main {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Scanner sc = null;
        File file = new File("src/text/themes_default.txt");
        try {
            sc = new Scanner(file);
        } catch (FileNotFoundException e2) {
            // TODO Auto-generated catch block
            e2.printStackTrace();
        }
        try {
            if (sc.hasNextLine())
                UIManager.setLookAndFeel(sc.nextLine());
            else
                UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");

        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            DAConnection.getConnection();
            FrameManager frame = new FrameManager();
            frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
            frame.setVisible(true);

//			LoginFrame dialog = new LoginFrame(frame);
//			dialog.setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
//			dialog.setVisible(true);
//			dialog.setLocationRelativeTo(frame);
        } catch (ClassNotFoundException | SQLException e) {
//			TroubleshootFrame frame = new TroubleshootFrame();
//			frame.setLocationRelativeTo(null);
//			frame.setTitle("Cài đặt kết nối tới cơ sở dữ liệu");
//			frame.pack();
//			frame.setVisible(true);
            System.err.println("Hệ Thống Chưa Có Kết Nối CSDL");
        }

        UIManager.LookAndFeelInfo[] looks = UIManager.getInstalledLookAndFeels();
        for (UIManager.LookAndFeelInfo look : looks) {
            System.out.println(look.getClassName());
        }

    }

}
