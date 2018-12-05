package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.ReportFileVO;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ReportFileMapper {
	@Loggable
	private Logger logger;
	
	public List<ReportFileVO> mapping(MultipartFile[] files, String report_code){
		List<ReportFileVO> fileItemList = new ArrayList<ReportFileVO>();
		if(files != null){
			ReportFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, report_code);
					
					fileItemList.add(fileItemInfo);
					
					saveFile(fileItemInfo.getReport_file_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
	private ReportFileVO getFile(MultipartFile file, String report_code) {
		ReportFileVO fileItemInfo = new ReportFileVO();
		
		fileItemInfo.setReport_code(report_code); 
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());

		fileItemInfo.setReport_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setReport_file_save_name(saveFileName);
		fileItemInfo.setReport_file_volume(String.valueOf(file.getSize()));
		
		return fileItemInfo;
	}

	public ReportFileVO mapping(MultipartFile file, String report_code){
		ReportFileVO fileItemInfo = null;
			if(file.getSize() > 0){
				fileItemInfo = getFile(file, report_code);
				saveFile(fileItemInfo.getReport_file_save_name(), file);
			}
		return fileItemInfo;
	}
	
	private void saveFile(String saveFileName, MultipartFile file) {
		File saveFile = new File(GlobalConstant.SAVE_REPORT, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
