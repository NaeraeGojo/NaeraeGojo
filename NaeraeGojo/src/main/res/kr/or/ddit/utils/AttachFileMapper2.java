package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.MeetFileVO;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttachFileMapper2 {
	@Loggable
	private Logger logger;
	
	public List<MeetFileVO> mapping(MultipartFile[] files, String doc_code){
		List<MeetFileVO> fileItemList = new ArrayList<MeetFileVO>();
		if(files != null){
			MeetFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, doc_code);
					
					fileItemList.add(fileItemInfo);
					
					saveFile(fileItemInfo.getMeeting_file_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
	private MeetFileVO getFile(MultipartFile file, String doc_code) {
		MeetFileVO fileItemInfo = new MeetFileVO();
		
		fileItemInfo.setMeeting_code(doc_code);
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		fileItemInfo.setMeeting_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setMeeting_file_save_name(saveFileName);
		fileItemInfo.setMeeting_file_volume(String.valueOf(file.getSize()));
		
		return fileItemInfo;
	}

	public MeetFileVO mapping(MultipartFile file, String doc_code){
		MeetFileVO fileItemInfo = null;
			if(file.getSize() > 0){
				fileItemInfo = getFile(file, doc_code);
				saveFile(fileItemInfo.getMeeting_file_save_name(), file);
			}
		return fileItemInfo;
	}
	
	private void saveFile(String saveFileName, MultipartFile file) {
		File saveFile = new File(GlobalConstant.MEETING_SAVE_PATH, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
