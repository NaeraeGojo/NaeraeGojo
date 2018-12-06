package kr.or.ddit.vo;

import java.util.List;

public class ReportVO {

	// 보고서 관리
	
	private String report_code;
	private String report_title;
	private String report_day;
	private String report_content;
	private String report_rc;
	private String report_date;
	private String report_delete;
	private String emp_code;
	private String pw_code;
	private String report_pl_status;
	private String report_pm_status;
	private String emp_code_pl;
	private String emp_code_pm;
	private String rnum;
	private String position_name;
	private String emp_name;
	private String emp_department;
	private String emp_level;
	private String project_code;
	private String pw_function;
	private String project_name;
	private String report_feed_code;
	private String report_feed_title;
	private String report_feed_content;
	
	
	public String getReport_feed_code() {
		return report_feed_code;
	}
	public void setReport_feed_code(String report_feed_code) {
		this.report_feed_code = report_feed_code;
	}
	public String getReport_feed_title() {
		return report_feed_title;
	}
	public void setReport_feed_title(String report_feed_title) {
		this.report_feed_title = report_feed_title;
	}
	public String getReport_feed_content() {
		return report_feed_content;
	}
	public void setReport_feed_content(String report_feed_content) {
		this.report_feed_content = report_feed_content;
	}
	private List<ReportFileVO> items;
	
	//PL뷰
	private String pm_position;
	private String pm_level;
	private String pm_name;
	private String pl_position;
	private String pl_level;
	private String pl_name;
	
	
	
	
	public String getPm_position() {
		return pm_position;
	}
	public void setPm_position(String pm_position) {
		this.pm_position = pm_position;
	}
	public String getPm_level() {
		return pm_level;
	}
	public void setPm_level(String pm_level) {
		this.pm_level = pm_level;
	}
	public String getPm_name() {
		return pm_name;
	}
	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public String getPl_position() {
		return pl_position;
	}
	public void setPl_position(String pl_position) {
		this.pl_position = pl_position;
	}
	public String getPl_level() {
		return pl_level;
	}
	public void setPl_level(String pl_level) {
		this.pl_level = pl_level;
	}
	public String getPl_name() {
		return pl_name;
	}
	public void setPl_name(String pl_name) {
		this.pl_name = pl_name;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_code() {
		return project_code;
	}
	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}
	public String getPw_function() {
		return pw_function;
	}
	public void setPw_function(String pw_function) {
		this.pw_function = pw_function;
	}
	public List<ReportFileVO> getItems() {
		return items;
	}
	public void setItems(List<ReportFileVO> items) {
		this.items = items;
	}
	public String getEmp_level() {
		return emp_level;
	}
	public void setEmp_level(String emp_level) {
		this.emp_level = emp_level;
	}
	public String getEmp_department() {
		return emp_department;
	}
	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getPw_code() {
		return pw_code;
	}
	public void setPw_code(String pw_code) {
		this.pw_code = pw_code;
	}
	public String getReport_pl_status() {
		return report_pl_status;
	}
	public void setReport_pl_status(String report_pl_status) {
		this.report_pl_status = report_pl_status;
	}
	public String getReport_pm_status() {
		return report_pm_status;
	}
	public void setReport_pm_status(String report_pm_status) {
		this.report_pm_status = report_pm_status;
	}
	public String getEmp_code_pl() {
		return emp_code_pl;
	}
	public void setEmp_code_pl(String emp_code_pl) {
		this.emp_code_pl = emp_code_pl;
	}
	public String getEmp_code_pm() {
		return emp_code_pm;
	}
	public void setEmp_code_pm(String emp_code_pm) {
		this.emp_code_pm = emp_code_pm;
	}
	public String getReport_code() {
		return report_code;
	}
	public void setReport_code(String report_code) {
		this.report_code = report_code;
	}
	public String getReport_day() {
		return report_day;
	}
	public void setReport_day(String report_day) {
		this.report_day = report_day;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReport_rc() {
		return report_rc;
	}
	public void setReport_rc(String report_rc) {
		this.report_rc = report_rc;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReport_delete() {
		return report_delete;
	}
	public void setReport_delete(String report_delete) {
		this.report_delete = report_delete;
	}
}
