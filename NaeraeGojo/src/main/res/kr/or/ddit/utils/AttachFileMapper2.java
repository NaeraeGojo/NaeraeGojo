package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;



import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.VideoFileVO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttachFileMapper2 {
	@Loggable
	private Logger logger;
	
	
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
	
	
	public VideoFileVO mapping2(MultipartFile file, String doc_code){
		VideoFileVO fileItemInfo = null;
		if(file.getSize() > 0){
			fileItemInfo = getFile1(file, doc_code);
			saveFile(fileItemInfo.getVideo_file_save_name(), file);
		}
		return fileItemInfo;
	}
	
	private VideoFileVO getFile1(MultipartFile file, String doc_code) {
		VideoFileVO fileItemInfo = new VideoFileVO();
		
		fileItemInfo.setVideo_chat_room_code(doc_code);
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		fileItemInfo.setVideo_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setVideo_file_save_name(saveFileName);
		fileItemInfo.setVideo_file_volume(String.valueOf(file.getSize()));
		
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
