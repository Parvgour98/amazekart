package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="verifyotp")
public class VerifyOTP {
	
	@Id // While making Entity class in hibernate, always use @Id annotation
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="otp_id",length=9)
	private int id;
	@Column(length=90, name="email")
	private String email;
	@Column(length=100, name="otp")
	private String otp;
	
	@Override
	public String toString() {
		return "VerifyOTP [email=" + email + ", otp=" + otp + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public VerifyOTP(String email, String otp) {
		super();
		this.email = email;
		this.otp = otp;
	}

	public VerifyOTP() {
		super();
	}

	public VerifyOTP(int id, String email, String otp) {
		super();
		this.id = id;
		this.email = email;
		this.otp = otp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
