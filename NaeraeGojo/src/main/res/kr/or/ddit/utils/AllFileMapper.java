package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AllFileMapper {
	@Loggable
	private Logger logger;
	
	public List<AllFileVO> mapping(MultipartFile[] files, String all_file_board_code, String all_file_kind_code){
		List<AllFileVO> fileItemList = new ArrayList<AllFileVO>();
		if(files != null){
			AllFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, all_file_board_code,all_file_kind_code);
					
					fileItemList.add(fileItemInfo);
					
					saveFile(fileItemInfo.getAll_file_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
	private AllFileVO getFile(MultipartFile file, String all_file_board_code,
			String all_file_kind_code) {
		AllFileVO fileItemInfo = new AllFileVO();
		
		fileItemInfo.setAll_file_board_code(all_file_board_code);
		fileItemInfo.setAll_file_kind_code(all_file_kind_code);
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		fileItemInfo.setAll_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setAll_file_save_name(saveFileName);
		fileItemInfo.setAll_file_volume(String.valueOf(file.getSize()));
		
		return fileItemInfo;
	}

	public AllFileVO mapping(MultipartFile file, String all_file_board_code, String all_file_kind_code){
		AllFileVO fileItemInfo = null;
			if(file.getSize() > 0){
				fileItemInfo = getFile(file, all_file_board_code, all_file_kind_code);
				saveFile(fileItemInfo.getAll_file_save_name(), file);
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
