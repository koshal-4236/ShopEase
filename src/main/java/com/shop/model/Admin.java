package com.shop.model;

import javax.persistence.*;

@Entity
@Table(name="admins")
public class Admin {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(unique=true,nullable=false)
	private String mail;
	
	@Column(nullable=false)
	private String password;
	
	private String name;
	
	public Admin() {}

	public Admin(String mail, String password, String name) {
		super();
		this.mail = mail;
		this.password = password;
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
