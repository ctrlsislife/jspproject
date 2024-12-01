package model;
import java.sql.*;

public class InformationDAO {

    // DB 연결 정보
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    String sql = null;

    public InformationDAO() {
        String url = "jdbc:mariadb://gwedu.org:3306/team8";
        String username = "team8";
        String password = "a1234";

        try {
            // DB 드라이버 로딩
            Class.forName("org.mariadb.jdbc.Driver");
            // DB 연결
            con = DriverManager.getConnection(url, username, password);
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 사용자 정보 반환 메서드
    public InformationDTO getUserInfo(String username) {
        InformationDTO res = null;
        sql = "SELECT * FROM user_index WHERE username = '" + username + "'";

        try {
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                res = new InformationDTO();
                res.setUserId(rs.getInt("user_id"));
                res.setUsername(rs.getString("username"));
                res.setPassword(rs.getString("passwd"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    // 자원 해제 메서드
    private void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
