package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.ProjectAllFileVO;
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
	
	/**
	 * 프로젝트 관련 게시판의 파일 매핑시켜주는 메서드
	 * parmeter로 project_code를 포함하고 있음.
	 * @param files 매핑시킬 multipart배열
	 * @param doc_code 해당 게시글 코드
	 * @param doc_class 어느 게시판인지 (1: 자료실 2: 자유게시판 3: 공지사항)
	 * @param project_code 어느프로젝트의 파일인지
	 * @return
	 */
	public List<ProjectAllFileVO> mapping(MultipartFile[] files, String doc_code
			, String doc_class,String project_code){
		List<ProjectAllFileVO> fileItemList = new ArrayList<ProjectAllFileVO>();
		if(files != null){
			ProjectAllFileVO fileItemInfo = null;
			for(MultipartFile file : files){
				if(file.getSize() > 0){
					fileItemInfo = getFile(file, doc_code,doc_class,project_code);
					
					fileItemList.add(fileItemInfo);
					
					saveProFile(fileItemInfo.getProject_all_file_save_name(), file);
				}
			}
		}
		return fileItemList;
	}
	
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
	
	private ProjectAllFileVO getFile(MultipartFile file, String doc_code,
			String doc_class, String project_code) {
		ProjectAllFileVO fileItemInfo = new ProjectAllFileVO();
		
		fileItemInfo.setDoc_code(doc_code);
		fileItemInfo.setDoc_class(doc_class);
		
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		fileItemInfo.setProject_all_file_name(fileName);
		
		// a.png => a
		String baseName = FilenameUtils.getBaseName(fileName);
		// a.png => png
		String extension = FilenameUtils.getExtension(fileName);
		// 마이너스 랜덤값에서 마이너스는 제거
		String genID = UUID.randomUUID().toString().replace("-", "");
		// a12314123124123.png
		String saveFileName = baseName + genID + "." + extension;
		
		fileItemInfo.setProject_all_file_save_name(saveFileName);
		fileItemInfo.setProject_all_file_volume(String.valueOf(file.getSize()));
		fileItemInfo.setProject_all_file_contype(file.getContentType());
		fileItemInfo.setProject_code(project_code);
		
		return fileItemInfo;
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
		upload(saveFile, file);
	}

	/**
	 * 프로젝트 별 파일 저장소 설정하는 메서드
	 * @param saveFileName
	 * @param file
	 */
	private void saveProFile(String saveFileName, MultipartFile file) {
		File saveFile = new File(GlobalConstant.PRO_SAVE_PATH, saveFileName);
		upload(saveFile, file);
	}

	/**
	 * 설정된 저장소, 저장할 파일을 받아서 실제 업로드하는 메서드
	 * @param saveFile
	 * @param file
	 */
	private void upload(File saveFile ,MultipartFile file) {
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
