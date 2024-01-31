package ui;

import dao.CongNhan_Dao;
import dao.NhanVienHanhChinh_Dao;
import dao.PhongBan_Dao;
import entity.CongNhan;
import entity.NhanVienHanhChinh;
import entity.Phongban;
import table_model.CongNhan_Table;
import table_model.NhanVien_Table;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class    Form_TimNhanVien extends JPanel {
    JPanel pnNorth,pnCenter;
    JTextField txtTenNV,txtSDT, txtDiaChi;
    JRadioButton rdTenNV,rdSDT, rdDiaChi, rdPhongBan;
    JComboBox cbcPhongBan;
    ButtonGroup btnGR;
    JButton btnTim,btnThoat;
    public Form_TimNhanVien(){
        doShow();
    }
    public void doShow(){
        //pnNorth
        pnNorth = new JPanel();
        JPanel pnNorth_N = new JPanel();
        JLabel lblTieuDe = new JLabel("TÌM KIẾM THÔNG TIN NHÂN VIÊN HÀNH CHÍNH");
        lblTieuDe.setFont(new Font("arial",Font.BOLD,20));
        lblTieuDe.setForeground(Color.RED);
        pnNorth_N.add(lblTieuDe);

        JPanel pnNorth_C = new JPanel();
        Box b,b1,b2, b3;
        b = Box.createVerticalBox();
        b.setPreferredSize(new Dimension(700,160));
        b.add(Box.createVerticalStrut(20));
        b.add(b1 = Box.createHorizontalBox());
        b1.add(rdTenNV = new JRadioButton("Tên Nhân Viên"));
        b1.add(txtTenNV = new JTextField());
        b1.add(Box.createHorizontalStrut(30));
        b1.add(rdSDT = new JRadioButton("SĐT Nhân Viên"));
        b1.add(txtSDT = new JTextField());
        b.add(Box.createVerticalStrut(20));

        b.add(b3 = Box.createHorizontalBox());
        b3.add(rdDiaChi = new JRadioButton("Địa Chỉ"));
        b3.add(txtDiaChi = new JTextField());
        b3.add(Box.createHorizontalStrut(30));
        b3.add(rdPhongBan = new JRadioButton("Phòng Ban"));
        b3.add(cbcPhongBan = new JComboBox<>());
        PhongBan_Dao phongBan_dao = new PhongBan_Dao();
        for (Phongban phongban : phongBan_dao.getLS()) {
            cbcPhongBan.addItem(phongban.getTenPB());
        }
        cbcPhongBan.setPreferredSize(new Dimension(225, 20));
        b.add(Box.createVerticalStrut(20));

        b.add(b2 = Box.createHorizontalBox());
        b2.add(btnTim = new JButton("Tìm Kiếm"));
        btnTim.setIcon(new ImageIcon(getClass().getResource("/icons/search_client_icon.png")));
        btnTim.setBackground(Color.decode("#00bcd4"));
        btnTim.setForeground(Color.decode("#FFFFFF"));
        b2.add(Box.createHorizontalStrut(100));
        b2.add(btnThoat = new JButton("Thoát"));
        btnThoat.setIcon(new ImageIcon(getClass().getResource("/icons/cancle_icon.png")));
        btnThoat.setBackground(Color.decode("#ff0004"));
        btnThoat.setForeground(Color.decode("#FFFFFF"));
        b.add(Box.createVerticalStrut(60));


        rdPhongBan.setPreferredSize(rdSDT.getPreferredSize());
        rdDiaChi.setPreferredSize(rdSDT.getPreferredSize());
        rdTenNV.setPreferredSize(rdSDT.getPreferredSize());

        btnGR = new ButtonGroup();
        btnGR.add(rdTenNV);
        btnGR.add(rdSDT);
        btnGR.add(rdDiaChi);
        btnGR.add(rdPhongBan);
        pnNorth_C.add(b);

        pnNorth.setLayout(new BorderLayout());
        pnNorth.add(pnNorth_N,BorderLayout.NORTH);
        pnNorth.add(pnNorth_C,BorderLayout.CENTER);

        this.setLayout(new BorderLayout());
        pnNorth_C.setBorder(new TitledBorder("Tìm Kiếm Nhân Viên Theo"));


        //pnCenter
        pnCenter = new JPanel();
        java.util.List<NhanVienHanhChinh> ls = new ArrayList<>();
        NhanVien_Table model = new NhanVien_Table(ls);
        JTable table = new JTable();
        table.setModel(model);
        JScrollPane sc = new JScrollPane(table,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        sc.setPreferredSize(new Dimension(1100,300));
        pnCenter.add(sc);
        pnCenter.setBorder(new TitledBorder("Kết Quả Tìm Kiếm"));

        txtTenNV.setEditable(false);
        txtSDT.setEditable(false);
        txtDiaChi.setEditable(false);
        cbcPhongBan.setEnabled(false);

        rdTenNV.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                txtTenNV.setEditable(true);
                txtSDT.setEditable(false);
                txtDiaChi.setEditable(false);
                cbcPhongBan.setEnabled(false);
            }
        });

        rdSDT.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                txtTenNV.setEditable(false);
                txtSDT.setEditable(true);
                txtDiaChi.setEditable(false);
                cbcPhongBan.setEnabled(false);
            }
        });

        rdDiaChi.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                txtTenNV.setEditable(false);
                txtSDT.setEditable(false);
                txtDiaChi.setEditable(true);
                cbcPhongBan.setEnabled(false);
            }
        });

        rdPhongBan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                txtTenNV.setEditable(false);
                txtSDT.setEditable(false);
                txtDiaChi.setEditable(false);
                cbcPhongBan.setEnabled(true);
            }
        });

        btnTim.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (rdTenNV.isSelected()) {
                    if (!txtTenNV.getText().trim().equals("")) {
                        NhanVienHanhChinh_Dao nhanVienHanhChinh_dao = new NhanVienHanhChinh_Dao();
                        if (nhanVienHanhChinh_dao.TimKiemTenTD(txtTenNV.getText().trim()) != null) {
                            java.util.List<NhanVienHanhChinh> ls = nhanVienHanhChinh_dao.TimKiemTenTD(txtTenNV.getText().trim());
                            table.setModel(new NhanVien_Table(ls));
                        } else {
                            JOptionPane.showMessageDialog(null, "Không tìm thấy!");
                            table.setModel(new NhanVien_Table(ls));
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "Nhập tên cần tìm!");
                    }
                } else if (rdSDT.isSelected()) {
                    if (!txtSDT.getText().trim().equals("")) {
                        NhanVienHanhChinh_Dao nhanVienHanhChinh_dao = new NhanVienHanhChinh_Dao();
                        if (nhanVienHanhChinh_dao.TimKiemDTTD(txtSDT.getText().trim()) != null) {
                            java.util.List<NhanVienHanhChinh> ls = nhanVienHanhChinh_dao.TimKiemDTTD(txtSDT.getText().trim());
                            table.setModel(new NhanVien_Table(ls));
                        } else {
                            JOptionPane.showMessageDialog(null, "Không tìm thấy!");
                            table.setModel(new NhanVien_Table(ls));
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "Nhập số điện thoại cần tìm!");
                    }
                } else if (rdDiaChi.isSelected()) {
                    if (!txtDiaChi.getText().trim().equals("")) {
                        NhanVienHanhChinh_Dao nhanVienHanhChinh_dao = new NhanVienHanhChinh_Dao();
                        if (nhanVienHanhChinh_dao.TimKiemDCTD(txtDiaChi.getText().trim()) != null) {
                            java.util.List<NhanVienHanhChinh> ls = nhanVienHanhChinh_dao.TimKiemDCTD(txtDiaChi.getText().trim());
                            table.setModel(new NhanVien_Table(ls));
                        } else {
                            JOptionPane.showMessageDialog(null, "Không tìm thấy!");
                            table.setModel(new NhanVien_Table(ls));
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "Nhập Địa Chỉ cần tìm!");
                    }
                } else {
                    NhanVienHanhChinh_Dao nhanVienHanhChinh_dao = new NhanVienHanhChinh_Dao();
                    PhongBan_Dao phongBan_dao = new PhongBan_Dao();
                    Phongban phongban = phongBan_dao.TimKiemTen(cbcPhongBan.getSelectedItem().toString());
                    if (nhanVienHanhChinh_dao.TimKiemPBTD(phongban.getMaPB()) != null) {
                        java.util.List<NhanVienHanhChinh> ls = nhanVienHanhChinh_dao.TimKiemPBTD(phongban.getMaPB());
                        table.setModel(new NhanVien_Table(ls));
                    } else {
                        JOptionPane.showMessageDialog(null, "Không tìm thấy!");
                        table.setModel(new NhanVien_Table(ls));
                    }

                }
            }
        });


        this.add(pnNorth, BorderLayout.NORTH);
        this.add(pnCenter, BorderLayout.CENTER);
    }
}

