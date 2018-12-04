package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.UserFileVO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
//
public class AttachPictureMapper {
	@Loggable
	private Logger logger;
	
	public List<UserFileVO> picture_mapping(MultipartFile[] files, String emp_code){
		List<UserFileVO> fileItemList = new ArrayList<UserFileVO>();
		if(files != null){
			UserFileVO userFileInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					userFileInfo = new UserFileVO();
					userFileInfo.setEmp_code(emp_code);
					
					//getName() : [찾아보기] 클릭 선택한 파일의 패스/파일명.확장자
					//			  [찾아보기] 클릭 선택한 파일의 파일명.확장자
					//file.getOriginalFilename(); [찾아보기] 클릭 선택한 파일의 패스/파일명.확장자
					String user_file_name = FilenameUtils.getName(file.getOriginalFilename());
					userFileInfo.setUser_file_name(user_file_name);
					
					//a.png => a
					String baseName = FilenameUtils.getBaseName(user_file_name);
					//a.png => png
					String extension = FilenameUtils.getExtension(user_file_name);
					
					String genID = UUID.randomUUID().toString().replace("-", "");
					
					//a412412412412412.png
					String saveFileName = baseName + genID + "." + extension;
					
					userFileInfo.setUser_file_save_name(saveFileName);
					userFileInfo.setUser_file_volume(String.valueOf(file.getSize()));
					
					fileItemList.add(userFileInfo);
					
					saveFile(saveFileName, file);
				}
			}
			
		}
		
		return fileItemList;
	}

	private void saveFile(String saveFileName, MultipartFile file) { //저장
		File saveFile = new File(GlobalConstant.SAVE_PATH, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
