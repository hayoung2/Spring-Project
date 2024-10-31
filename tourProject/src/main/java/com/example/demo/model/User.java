package com.example.demo.model;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "users")
public class User {
    
    @Id
    private String username; // 아이디
    private String password; // 비밀번호
    private String nickname; // 닉네임
    private String name; // 이름
    private String birthdate; // 생년월일
    private String gender; // 성별
    private String address; // 주소
    private String phone; // 핸드폰번호
    private String smsConsent; // SMS 수신 동의
    private String email; // 이메일
    private String emailConsent; // 이메일 수신 동의
    private String mbti; // MBTI
    private String introduction; // 간단한 소개


    public User() {
    }

    public User(String username, String password, String nickname, String name, String birthdate, String gender, String address, String phone, String smsConsent, String email, String emailConsent, String mbti, String introduction) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.name = name;
        this.birthdate = birthdate;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.smsConsent = smsConsent;
        this.email = email;
        this.emailConsent = emailConsent;
        this.mbti = mbti;
        this.introduction = introduction;
    }


    public User(String username) {
		this.username=username;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSmsConsent() {
		return smsConsent;
	}

	public void setSmsConsent(String smsConsent) {
		this.smsConsent = smsConsent;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailConsent() {
		return emailConsent;
	}

	public void setEmailConsent(String emailConsent) {
		this.emailConsent = emailConsent;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", birthdate='" + birthdate + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", smsConsent='" + smsConsent + '\'' +
                ", email='" + email + '\'' +
                ", emailConsent='" + emailConsent + '\'' +
                ", mbti='" + mbti + '\'' +
                ", introduction='" + introduction + '\'' +
                '}';
    }

  
}