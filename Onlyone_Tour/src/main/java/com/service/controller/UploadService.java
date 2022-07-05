package com.service.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.service.model.ServiceDAO;
import com.service.model.ServiceFileDTO;


@Service
public class UploadService {

	@Autowired
	private ServiceDAO dao;
	
	public boolean fileUpload(MultipartHttpServletRequest mRequest ,
			ServiceFileDTO fileDto, int snum)	{
		
		boolean isUpload = false;
		
		//저장경로
		String file_path = "C:\\Users\\ubg11\\git\\ONLYONE-TOUR\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_service\\upload\\";
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		
		int month = cal.get(Calendar.MONTH) + 1;
		
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			//업로드한 파일의 이름을 구하는 메소드
			String originaleFileName = mFile.getOriginalFilename();
			
			//실제 폴더 생성
			// ........\\resources\\upload\\2022-05-30
			//String homedir = file_path + year + "-" + month + "-" + day;
			
			File path1 = new File(file_path);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			//실제 파일 생성
			String file_name = originaleFileName;
			
			if(file_name != null) {
				
				//만약 이름이 중복될 경우 현재 시간을 추가해 파일이름 생성
				file_name = System.currentTimeMillis() + "_" + file_name;
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					File origin = new File(file_path + "/" + file_name);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					mFile.transferTo(origin);
					
				}catch (Exception e) {
					// TODO: handle exception
				}
				
			}
			
			fileDto.setFile_path(file_path);
			fileDto.setFile_name(file_name);
			fileDto.setService_num(snum);
			
			System.out.println(snum + "/////");
			System.out.println(file_name + "/////");
			System.out.println(file_path);
			
			int check = this.dao.addFile(fileDto);
			
			if(check > 0 ) {
				System.out.println("파일 업로드도 성공");
			}
			
			
		}
		
		
		
		return isUpload;
	}
}
