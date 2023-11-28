package kr.co.jabusim.service;

import java.io.File;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jabusim.beans.ContentBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.dao.BoardDao;

//ContentBean�� ���޵� ���� ���
@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {

	@Value("${path.upload}")
	private String path_upload;

	/**/
	@Autowired
	private BoardDao boardDao;
	/**/

	/**/
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	/**/
	//�����ϴ� �޼ҵ�
	private String saveUploadFile(MultipartFile upload_file) {

		//String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		//��� �ý��ۿ�����(https://mvnrepository.com/artifact/commons-io/commons-io/2.6) <-pom.xml�� �߰�
		String file_name = System.currentTimeMillis() + "_" +  
				FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." + 
				FilenameUtils.getExtension(upload_file.getOriginalFilename());


		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public void addContentInfo(ContentBean writeContentBean) {
		/*
		System.out.println(writeContentBean.getContent_subject());
		System.out.println(writeContentBean.getContent_text());
		System.out.println(writeContentBean.getUpload_file().getSize());*/


		MultipartFile upload_file = writeContentBean.getUpload_file();


		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			//System.out.println(file_name);
			//÷������ ȣ��
			/**/writeContentBean.setContent_file(file_name);/**/
		}
		//�α��� �������� �������Ƿ� @Resource�� loginUserBean ���
		/**/writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());/**/

		/**/boardDao.addContentInfo(writeContentBean);/**/
	}

	public void modifyContentInfo(ContentBean modifyContentBean) {

		MultipartFile upload_file = modifyContentBean.getUpload_file();

		if(upload_file.getSize() > 0) { //upload�� �ִٸ�
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setContent_file(file_name);
		}

		boardDao.modifyContentInfo(modifyContentBean);
	}

	public ContentBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}
	
	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}
}






