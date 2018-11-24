package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.SuggestFileVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttachFileMapper {
	@Loggable
	private Logger logger;
	
	public List<SuggestFileVO> mapping(MultipartFile[] files, String doc_code, String doc_class){
		List<SuggestFileVO> fileItemList = new ArrayList<SuggestFileVO>();
		if(files != null){
			SuggestFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, doc_code,doc_class);
					
					fileItemList.add(fileItemInfo);
					
					saveFile(fileItemInfo.getSuggfi_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
	private SuggestFileVO getFile(MultipartFile file, String doc_code,
			String doc_class) {
		SuggestFileVO fileItemInfo = new SuggestFileVO();
		
		fileItemInfo.setSuggfi_doc_code(doc_code);
		fileItemInfo.setSuggfi_kind_code(doc_class);
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		fileItemInfo.setSuggfi_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setSuggfi_save_name(saveFileName);
		fileItemInfo.setSuggfi_volume(String.valueOf(file.getSize()));
		
		return fileItemInfo;
	}

	public SuggestFileVO mapping(MultipartFile file, String doc_code, String doc_class){
		SuggestFileVO fileItemInfo = null;
			if(file.getSize() > 0){
				fileItemInfo = getFile(file, doc_code, doc_class);
				saveFile(fileItemInfo.getSuggfi_save_name(), file);
			}
		return fileItemInfo;
	}
	
	private void saveFile(String saveFileName, MultipartFile file) {
		File saveFile = new File(GlobalConstant.SUG_SAVE_PATH, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
