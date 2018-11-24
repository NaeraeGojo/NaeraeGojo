package kr.or.ddit.suggestfile.controller.user;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.suggestfile.service.ISuggestFileService;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/suggfi/")
public class SuggestFileController {
	@Autowired
	ISuggestFileService service;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	public void SuggestFileForm(){}
	
	@RequestMapping("suggfiUpdateForm")
	public void suggfiUpdateForm(){}
	
	@RequestMapping("suggfiDownload")
	public ModelAndView downloadFile(ModelAndView mav,String suggfi_code
			, Map<String, String> params) throws Exception{
		params.put("suggfi_code", suggfi_code);
		SuggestFileVO sfv = service.getSuggestFile(params);
		
		File targetFile = new File(GlobalConstant.SUG_SAVE_PATH, sfv.getSuggfi_save_name()); 
		mav.addObject("downloadFile", targetFile);
		mav.addObject("downloadFileName",sfv.getSuggfi_name());
		mav.setViewName("downloadView");
		
		return mav;
	}
	
	
	public Model SuggestFileList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SuggestFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSuggestFile(SuggestFileVO sv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSuggestFile(String bo_no) throws Exception{
		
		return "";
	}
	
	@RequestMapping("suggfiUpdate")
	public ModelAndView updateSuggestFile(ModelAndView mav ,MultipartFile file
			,String suggfi_code ,Map<String, String> params) throws Exception{
		params.put("suggfi_code", suggfi_code);
		SuggestFileVO sfv = service.getSuggestFile(params);
		
		SuggestFileVO usfv = fileMapper.mapping(file, sfv.getSuggfi_doc_code(), sfv.getSuggfi_kind_code());
		
		sfv.setSuggfi_name(usfv.getSuggfi_name());
		sfv.setSuggfi_save_name(usfv.getSuggfi_save_name());
		sfv.setSuggfi_volume(usfv.getSuggfi_volume());
		
		service.updateSuggestFile(sfv);
		
		mav.addObject("suggfi_name" , sfv.getSuggfi_name());
		mav.setViewName("jsonConvertView");
		
		
		return mav;
	}
}
