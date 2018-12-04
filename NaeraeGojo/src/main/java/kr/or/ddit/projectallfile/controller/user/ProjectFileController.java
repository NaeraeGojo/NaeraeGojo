package kr.or.ddit.projectallfile.controller.user;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.projectallfile.service.IProjectFileService;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.ProjectAllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/profile/")
public class ProjectFileController {
	@Autowired
	private IProjectFileService service;
	
	@Autowired
	private AttachFileMapper mapper;
	
	@RequestMapping("profileDownload")
	public ModelAndView downloadFile(ModelAndView mav,String project_all_file_code
			, Map<String, String> params) throws Exception{
		params.put("project_all_file_code", project_all_file_code);
		ProjectAllFileVO pfv = service.getProjectFile(params);
		
		File targetFile = new File(GlobalConstant.PRO_SAVE_PATH, pfv.getProject_all_file_save_name()); 
		mav.addObject("downloadFile", targetFile);
		
		String encodedFilename = pfv.getProject_all_file_name();
//		encodedFilename = URLEncoder.encode(encodedFilename, "UTF-8");
//		String encodedFilename = "\"" + new String(sfv.getSuggfi_name().getBytes("UTF-8"), "8859_1") + "\"";
//        encodedFilename = URLDecoder.decode(encodedFilename);

		mav.addObject("downloadFileName", encodedFilename);
		mav.setViewName("downloadView");
		return mav;
	}
	
	@RequestMapping("profileList")
	public ModelAndView ProjectFileList(ModelAndView mav
										,ProjectAllFileVO pfv
										, Map<String, String> params 
									) throws Exception{
		params.put("project_code", pfv.getProject_code());
		params.put("doc_code", pfv.getDoc_code());
		params.put("doc_class", pfv.getDoc_class());
		
		List<ProjectAllFileVO> pfl = service.getProjectFileList(params);
		
		mav.addObject("pfl",pfl);
		mav.setViewName("jsonConvertView");
		
		
		return mav;
	}
	
	
	public Model ProjectFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertProjectFile(ProjectAllFileVO pfv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	@RequestMapping("profileDelete")
	public ModelAndView deleteProjectFile(ModelAndView mav
											, String project_all_file_code
											, Map<String, String> params) throws Exception{
		params.put("project_all_file_code", project_all_file_code);
		
		ProjectAllFileVO dpfv = service.getProjectFile(params);
		
		String fi = GlobalConstant.PRO_SAVE_PATH + "\\" +dpfv.getProject_all_file_save_name();

		File df = new File(fi);
        
        if( df.exists() ){
            if(df.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
		
		service.deleteProjectFile(params);
		
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
	@RequestMapping("profileUpdate")
	public ModelAndView updateProjectFile(ProjectAllFileVO pfv
									, MultipartFile file
									, HttpServletRequest request
									, ModelAndView mav
									, Map<String, String> params) throws Exception{
		params.put("project_all_file_code", pfv.getProject_all_file_code());
		ProjectAllFileVO dpfv = service.getProjectFile(params);
		
		String fi = GlobalConstant.PRO_SAVE_PATH + "\\" +dpfv.getProject_all_file_save_name();

		File df = new File(fi);
        
        if( df.exists() ){
            if(df.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }


		
		// mapping 이 multipart배열을 필요로하기 때문에 배열에 담아줌
		MultipartFile[] files = {file};
		
		// multipart배열, 게시글 코드, 게시글 분류, 프로젝트 코드
		List<ProjectAllFileVO> pfl = mapper.mapping(files, pfv.getDoc_code(), pfv.getDoc_class(), pfv.getProject_code()); 
		
		// 어차피 하나임 , where 절의 pk 값을 위해 pfv가 가진 projedt_all_file_code 세팅
		for(ProjectAllFileVO pfv1 : pfl){
			pfv1.setProject_all_file_code(pfv.getProject_all_file_code());
			
			// 여기서 서비스로 보냄 vo 하나를
			service.updateProjectFile(pfv1);
		}
		
		
		
		mav.setViewName("jsonConvertView");
		return mav;
	}
}
