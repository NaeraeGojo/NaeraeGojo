package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.UserFileVO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
//
public class AttachPictureMapper {
	@Loggable
	private Logger logger;
	
	public UserFileVO picture_mapping(MultipartFile file){
		UserFileVO userFileInfo = null;
		
		
		if(file.getSize() > 0){
			userFileInfo = new UserFileVO();
			
			String fileName = FilenameUtils.getName(file.getOriginalFilename());
			userFileInfo.setUser_file_name(fileName);
			
			// a.png => a
			String baseName = FilenameUtils.getBaseName(fileName);
			// a.png => png
			String extension = FilenameUtils.getExtension(fileName);
			// 마이너스 랜덤값에서 마이너스는 제거
			String genID = UUID.randomUUID().toString().replace("-", "");
			// a12314123124123.png
			String saveFileName = baseName + genID + "." + extension;
			
			userFileInfo.setUser_file_save_name(saveFileName);
			userFileInfo.setUser_file_volume(String.valueOf(file.getSize()));
			
			saveUserFile(userFileInfo.getUser_file_save_name(), file);
		}
		
		return userFileInfo;
	}

	private void saveUserFile(String saveFileName, MultipartFile file) {
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
