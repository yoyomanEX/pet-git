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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model._08.index.AnnouncementBean;
import com.web.model._08.index.ContentBean;
import com.web.service.impl._08.index.AnnouncementService;
import com.web.service.impl._08.index.ContentService;

@Controller
@RequestMapping(value = "_08")
public class IndexController {
	//Backstage
	@RequestMapping(value = "/admin0123")
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
	@RequestMapping(value = "/announcements/{title}", method = RequestMethod.GET)
	public String getAnnByTitle(@PathVariable("title") String title, Model model) {
		List<AnnouncementBean> announcements = annService.qryAnnounceByTitle(title);
		model.addAttribute("announcements", announcements);
		return "_08/announcements";
	}
	@RequestMapping("/announcement")
	public String getAnnById(@RequestParam("annId") Integer annId, Model model) {
		model.addAttribute("announcement", annService.qryAnnouncementById(annId));
		return "_08/announce_single";
	}
	@RequestMapping(value = "/getPicture/{annId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer annId) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		AnnouncementBean bean = annService.qryAnnouncementById(annId);
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
	@RequestMapping(value = "/contents/{title}", method = RequestMethod.GET)
	public String getcontByTitle(@PathVariable("title") String title, Model model) {
		List<ContentBean> contents = contService.qryContentByTitle(title);
		model.addAttribute("contents", contents);
		return "_08/contents";
	}
	@RequestMapping("/content")
	public String getcontById(@RequestParam("contId") Integer contId, Model model) {
		model.addAttribute("content", contService.qryContentById(contId));
		return "_08/contounce_single";
	}
	@RequestMapping(value = "/getPicture/{contId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPictureCont(HttpServletResponse resp, @PathVariable Integer contId) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ContentBean bean = contService.qryContentById(contId);
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
