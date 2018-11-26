package kr.or.ddit.allfile.controller.user;


import java.io.File;
import java.util.Map;

import kr.or.ddit.allfile.service.IAllFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user/allfile/")
public class AllFileController {
	
	@Autowired
	IAllFileService service;
	
	private AllFileMapper fileMapper;
	
	@RequestMapping("allFileDownload")
	public ModelAndView downloadFile(ModelAndView andView,String all_file_code
			, Map<String, String> params) throws Exception{
		params.put("all_file_code", all_file_code);
		AllFileVO afv =service.getAllFile(params);
		
		File targetFile = new File(GlobalConstant.ALL_FILE_SAVE_PATH, afv.getAll_file_save_name()); 
		andView.addObject("downloadFile", targetFile);
		andView.addObject("downloadFileName",afv.getAll_file_name());
		andView.setViewName("downloadView");
		return andView;
	}
	
	@RequestMapping("allFileUpdate")
	public ModelAndView updateAllFile(ModelAndView andView ,MultipartFile file
			,String all_file_code ,Map<String, String> params) throws Exception{
		params.put("all_file_code", all_file_code);
		AllFileVO afv = service.getAllFile(params);
		
		AllFileVO uafv = fileMapper.mapping(file, afv.getAll_file_board_code(), afv.getAll_file_kind_code());
		
		afv.setAll_file_name(uafv.getAll_file_name());
		afv.setAll_file_save_name(uafv.getAll_file_save_name());
		afv.setAll_file_volume(uafv.getAll_file_volume());
		
		service.updateAllFile(afv);
		
		andView.addObject("all_file_name" , afv.getAll_file_name());
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
}
