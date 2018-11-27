package kr.or.ddit.chart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Chart1 {

	
	@RequestMapping("/chart1")
	public String chart1(){
		return "user/chart/chart1";
	}
	
	@RequestMapping("/Ganttchart2")
	public String Ganttchart2(){
		return "user/chart/Ganttchart2";
	}
	
	@RequestMapping("/Ganttchart")
	public String Ganttchart(){
		return "user/chart/Ganttchart";
	}
	
	@RequestMapping("/Ganttchart3")
	public String Ganttchart3(){
		return "user/chart/Ganttchart3";
	}
}
