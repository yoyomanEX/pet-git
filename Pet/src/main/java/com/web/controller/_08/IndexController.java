package com.web.controller._08;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.model._08.index.AnnouncementBean;
import com.web.model._08.index.ContentBean;
import com.web.service.impl._08.index.AnnouncementService;
import com.web.service.impl._08.index.ContentService;

@Controller
@RequestMapping(value = "_08")
public class IndexController {
	//Backstage
	@RequestMapping(value = "/adminContent")
	public String backstage() {
		return "_08/AdminBackstage";
	}
	
	AnnouncementService annService;
	ContentService contService;
	ServletContext context;
	
	@Autowired
	public void setAnnService(AnnouncementService annService) {
		this.annService = annService;
	}
	@Autowired
	public void setContService(ContentService contService) {
		this.contService = contService;
	}
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
//------	Announcement Table Controller Start	-----//
	@RequestMapping(value = "/announcements", method = RequestMethod.GET, produces = "text/html")
	public String annlist(Model model) {
	List<AnnouncementBean> list = annService.qryAllAnnouncement();
	model.addAttribute("allAnnouncements", list);
	return "_08/announcements";
}
	@RequestMapping(value = "/announcements__Front", method = RequestMethod.GET, produces = "text/html")
	public String showAnnounceFront(Model model) {
	List<AnnouncementBean> list = annService.qryAllAnnouncement();
	model.addAttribute("allAnnouncements", list);
	return "index";
}
	@RequestMapping(value = "/announcements/{title}", method = RequestMethod.GET)
	public String getAnnByTitle(@PathVariable("title") String title, Model model) {
		List<AnnouncementBean> announcements = annService.qryAnnounceByTitle(title);
		model.addAttribute("announcements", announcements);
		return "_08/announcements";
	}
	
	@RequestMapping(value = "/announcements/add", method = RequestMethod.GET)
	public String getAddNewAnnounceForm(Model model) {
		AnnouncementBean ann = new AnnouncementBean();
		model.addAttribute("AnnouncementBean", ann);
		return "_08/addAnnounce";
	}
	@RequestMapping(value = "/announcements/add", method = RequestMethod.POST)
	public String processAddNewAnnounceForm(@ModelAttribute("AnnouncementBean") AnnouncementBean ann, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		MultipartFile annImage = ann.getAnnImg();
		String originalFilename = annImage.getOriginalFilename();
		ann.setAnnounce_fileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if(annImage != null && !annImage.isEmpty()) {
			try {
				byte[] b = annImage.getBytes();
				Blob blob = new SerialBlob(b);
				ann.setAnnounce_img(blob);
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		annService.insertAnnounce(ann);
		String rootDirectory = context.getRealPath("/");
		String ext = "";
		if(!originalFilename.isEmpty()) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			try {
				File imageFolder = new File(rootDirectory, "images");
				if(!imageFolder.exists()) imageFolder.mkdirs();
				File file = new File(imageFolder, "Announce-" + ann.getAnnounce_id() + ext);
				annImage.transferTo(file);
			}catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
//		else {}
		return "redirect:/_08/announcements";
	}
	@RequestMapping("/announcement")
	public String getAnnById(@RequestParam("annId") Integer annId, Model model) {
		model.addAttribute("announcement", annService.qryAnnouncementById(annId));
		return "_08/announce_single";
	}
	@RequestMapping(value = "/getAnnPicture/{announce_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer announce_id) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		AnnouncementBean bean = annService.qryAnnouncementById(announce_id);
		System.out.println("beanbean="+bean);
		if (bean != null) {
			Blob blob = bean.getAnnounce_img();
			filename = bean.getAnnounce_fileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("IndexController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
//------	Announcement Table Controller End	-----//

//------	Content Table Controller Start	-----//
	
	@RequestMapping(value = "/contents", method = RequestMethod.GET, produces = "text/html")
	public String contlist(Model model) {
	List<ContentBean> list = contService.qryAllContent();
	model.addAttribute("allcontents", list);
	return "_08/contents";
}
	@RequestMapping(value = "/contents_Front", method = RequestMethod.GET, produces = "text/html")
	public String showContentFront(Model model) {
	List<ContentBean> list = contService.qryAllContent();
	model.addAttribute("allcontents", list);
	return "_08/showContent";
}
	@RequestMapping(value = "/contents/{title}", method = RequestMethod.GET)
	public String getcontByTitle(@PathVariable("title") String title, Model model) {
		List<ContentBean> contents = contService.qryContentByTitle(title);
		model.addAttribute("contents", contents);
		return "_08/contents";
	}
	@RequestMapping(value = "/contents/add", method = RequestMethod.GET)
	public String getAddNewContentForm(Model model) {
		ContentBean c = new ContentBean();
		model.addAttribute("ContentBean", c);
		return "_08/addContent";
	}
	@RequestMapping(value = "/contents/add", method = RequestMethod.POST)
	public String processAddNewContentForm(@ModelAttribute("ContentBean") ContentBean cont, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		MultipartFile contentImg = cont.getContentImg();
		String originalFilename = contentImg.getOriginalFilename();
		cont.setContent_fileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if(contentImg != null && !contentImg.isEmpty()) {
			try {
				byte[] b = contentImg.getBytes();
				Blob blob = new SerialBlob(b);
				cont.setContent_img(blob);
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		contService.insertContent(cont);
		String rootDirectory = context.getRealPath("/");
		String ext = "";
		if(!originalFilename.isEmpty()) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			try {
				File imageFolder = new File(rootDirectory, "images");
				if(!imageFolder.exists()) imageFolder.mkdirs();
				File file = new File(imageFolder, "Content-" + cont.getContent_id() + ext);
				contentImg.transferTo(file);
			}catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
//		else {}
		return "redirect:/_08/contents";
	}
	@RequestMapping("/content")
	public String getcontById(@RequestParam("contId") Integer contId, Model model) {
		model.addAttribute("content", contService.qryContentById(contId));
		return "_08/contounce_single";
	}
	@RequestMapping(value = "/getContPicture/{content_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPictureCont(HttpServletResponse resp, @PathVariable Integer content_id) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ContentBean bean = contService.qryContentById(content_id);
		if (bean != null) {
			Blob blob = bean.getContent_img();
			filename = bean.getContent_fileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("IndexController的getPictureCont()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

//------	Content Table Controller End	-----//
}
