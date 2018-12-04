package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class NoticeFileMapper {
	@Loggable
	private Logger logger;
	
	public List<NoticeFileVO> mapping(MultipartFile[] files, String notice_code){
		List<NoticeFileVO> fileItemList = new ArrayList<NoticeFileVO>();
		if(files != null){
			NoticeFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, notice_code);
					
					fileItemList.add(fileItemInfo);
					
					saveFile(fileItemInfo.getNotice_file_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
	private NoticeFileVO getFile(MultipartFile file, String notice_code) {
		NoticeFileVO fileItemInfo = new NoticeFileVO();
		
		fileItemInfo.setNotice_file_code(notice_code); 
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());

		fileItemInfo.setNotice_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setNotice_file_save_name(saveFileName);
		fileItemInfo.setNotice_file_volume(String.valueOf(file.getSize()));
		
		return fileItemInfo;
	}

	public NoticeFileVO mapping(MultipartFile file, String notice_code){
		NoticeFileVO fileItemInfo = null;
			if(file.getSize() > 0){
				fileItemInfo = getFile(file, notice_code);
				saveFile(fileItemInfo.getNotice_file_save_name(), file);
			}
		return fileItemInfo;
	}
	
	private void saveFile(String saveFileName, MultipartFile file) {
		File saveFile = new File(GlobalConstant.ALL_FILE_SAVE_PATH, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
