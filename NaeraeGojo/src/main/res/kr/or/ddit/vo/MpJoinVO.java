package kr.or.ddit.vo;

import lombok.Data;

public class MpJoinVO {
	
	// 인력 등급 
	private String mp_code;
	private String mp_begin;
	private String mp_inter;
	private String mp_high;
	private String mp_spec;
	private String rqpps_name;
	private String rqpps_code;
	private String emp_name;
	private String emp_code;
	
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getRqpps_code() {
		return rqpps_code;
	}
	public void setRqpps_code(String rqpps_code) {
		this.rqpps_code = rqpps_code;
	}
	public String getMp_code() {
		return mp_code;
	}
	public void setMp_code(String mp_code) {
		this.mp_code = mp_code;
	}
	public String getMp_begin() {
		return mp_begin;
	}
	public void setMp_begin(String mp_begin) {
		this.mp_begin = mp_begin;
	}
	public String getMp_inter() {
		return mp_inter;
	}
	public void setMp_inter(String mp_inter) {
		this.mp_inter = mp_inter;
	}
	public String getMp_high() {
		return mp_high;
	}
	public void setMp_high(String mp_high) {
		this.mp_high = mp_high;
	}
	public String getMp_spec() {
		return mp_spec;
	}
	public void setMp_spec(String mp_spec) {
		this.mp_spec = mp_spec;
	}
	public String getRqpps_name() {
		return rqpps_name;
	}
	public void setRqpps_name(String rqpps_name) {
		this.rqpps_name = rqpps_name;
	}
	
	
}
