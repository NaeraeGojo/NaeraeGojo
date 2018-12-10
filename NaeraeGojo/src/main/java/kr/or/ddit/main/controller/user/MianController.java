package kr.or.ddit.main.controller.user;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.main.service.IMainService;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/main/")
public class MianController {

	@Resource
	private IMainService mainService;
	
	
	@RequestMapping("fullcalendar")
	public ModelAndView fullcalendar(ModelAndView andView) throws Exception {
		
		List<ProjectVO> projectTimeInfo = mainService.getProjectTime();
		
		String data = "[";
		
		
		String[] array = new String[100];
		String color =null ;
		
		for (int i = 0; i < projectTimeInfo.size(); i++) {
			color = String.valueOf((int)(Math.random() * 16777216));
			array[i] = color;
//			System.out.println("색깔 ㅁㄴㅇㄹㄴㅁㅇㄹ:: " + array[i]);
		}
		
		for(int i = 0; i< projectTimeInfo.size(); i++){
			
			if(i>0){
				data += ",";
			}
			data += "{title:'" + "시: " +projectTimeInfo.get(i).getProject_name()
					+ "',start:'" + projectTimeInfo.get(i).getProject_start()
					+ "',color :'" + "#"+ array[i]
					+ "'}";
		}
		data += ",";
		for(int i = 0; i< projectTimeInfo.size(); i++){
			
			if(i>0){
				data += ",";
			}
			data += "{title:'" + "종: "  +projectTimeInfo.get(i).getProject_name()
					+ "',start:'" + projectTimeInfo.get(i).getProject_end()
					+ "',color :'" + "#"+ array[i]
					+ "'}";
		}
		data += "]";
		andView.addObject("data", data);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
}
