package model;

public class InformationDTO {
    private int userId;      // 사용자 ID (Primary Key)
    private String username; // 사용자 이름 (Username)
    private String password; // 사용자 비밀번호 (Password)

    // 기본 생성자
    public InformationDTO() {}

    // userId, username, password를 초기화하는 생성자
    public InformationDTO(int userId, String username, String password) {
        this.userId = userId;
        this.username = username;
        this.password = password;
    }

    // Getter & Setter

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
