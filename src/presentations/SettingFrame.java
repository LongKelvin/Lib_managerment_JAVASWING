package presentations;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

import javax.swing.*;

import dataaccess.DAConnection;
import net.miginfocom.swing.MigLayout;

public class SettingFrame extends JDialog   {

	private JPanel contentPane;
	private JTextField tfUrl;
	private JTextField tfUsername;
	private JPasswordField tfPassword;
	private JComboBox cbThemes;
	private String getSelectedItem;

	private Scanner sc;
	/**
	 * Create the dialog.
	 */
	public SettingFrame() {
		setModal(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		String file = new String("src/text/themes.txt");
		List<String> lines = Collections.emptyList();
		try { lines = Files.readAllLines(Paths.get(file), StandardCharsets.UTF_8);
		} catch (IOException e) { }


		contentPane = new JPanel();
		setContentPane(contentPane);
		contentPane.setLayout(new MigLayout("", "[][grow]", "[][][][][]"));
		//contentPane.setLayout(new MigLayout("", "[][grow]", "[][][109.00,grow,baseline][]"));

		JLabel lblDatabaseUrl = new JLabel("Lựa chọn giao diện");
		contentPane.add(lblDatabaseUrl, "cell 0 0,alignx trailing");

		cbThemes = new JComboBox();

		for(String line : lines){
			cbThemes.addItem(line);
		}
		contentPane.add(cbThemes);
		cbThemes.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (e.getSource() == cbThemes) {

					getSelectedItem = (cbThemes.getSelectedItem().toString() );
					System.out.println(getSelectedItem);
					try {

						FrameManager frameManager = new FrameManager();
						UIManager.setLookAndFeel(getSelectedItem);

						for (Frame frame : Frame.getFrames()) {
							SwingUtilities.updateComponentTreeUI(frame);
						}

						try {
							String filedefault =  new String("src/text/themes_default.txt");
							Writer writer = new BufferedWriter(new FileWriter(filedefault));
							writer.write(getSelectedItem);
							writer.close();
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();

						} catch (Exception ex) {
							ex.printStackTrace();
						}


					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				dispose();

			}
		});
		pack();

		//tfUrl = new JTextField();
		//if (sc.hasNextLine()) {
		//	tfUrl.setText(sc.nextLine());
		//}
		//contentPane.add(tfUrl, "cell 1 0,growx");
		//tfUrl.setColumns(10);

//		JLabel lblDatabaseUsername = new JLabel("Database Username");
//		contentPane.add(lblDatabaseUsername, "cell 0 1,alignx trailing");
//
//		tfUsername = new JTextField();
//		if (sc.hasNextLine()) {
//			tfUsername.setText(sc.nextLine());
//		}
//
//		contentPane.add(tfUsername, "cell 1 1,growx");
//		tfUsername.setColumns(10);
//
//		JLabel lblDatabasePassword = new JLabel("Database Password");
//		contentPane.add(lblDatabasePassword, "cell 0 2,alignx trailing");
//
//		tfPassword = new JPasswordField();
//		if (sc.hasNextLine()) {
//			tfPassword.setText(sc.nextLine());
//		}
//		sc.close();
//		contentPane.add(tfPassword, "cell 1 2,growx,aligny top");
//		tfPassword.setColumns(10);

//		JButton btnOk = new JButton("Xác Nhận");
//		btnOk.addActionListener(new ActionListener() {
//
//			@Override
//			public void actionPerformed(ActionEvent e) {
//				try {
//					Writer writer = new BufferedWriter(new FileWriter(file));
//					writer.write(tfUrl.getText() + '\n' + tfUsername.getText() + '\n' + tfPassword.getText());
//					writer.close();
//				} catch (IOException e1) {
//					// TODO Auto-generated catch block
//					e1.printStackTrace();
//				}
//				dispose();
//
//			}
//		});
//		contentPane.add(btnOk, "flowx,cell 1 4");

		JButton btnCancel = new JButton("Thoát");
		btnCancel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		contentPane.add(btnCancel, "cell 1 4");
		setTitle("Thay đổi giao diện phần mềm");
		pack();
	}



}
