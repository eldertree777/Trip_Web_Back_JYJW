package com.ssafy.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.web.dto.InfoBoardDto;
import com.ssafy.web.service.InfoBoardService;
import com.ssafy.web.util.PageNavigation;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/restInfo")
@Api(value="InfoBoard")
public class RestInfoBoardController {

	@Autowired
	@Qualifier("InfoBoardServiceImpl")
	private InfoBoardService infoBoardService;

	@PostMapping("/write")
	public int write(InfoBoardDto InfoBoardDto)
			throws Exception {
		
		int result = infoBoardService.writeArticle(InfoBoardDto);
		return result;
	}

	@GetMapping("/list")
	public Map list(@RequestParam Map<String, String> map) throws Exception {
		Map<String, Object> sendMap = new HashMap();

		List<InfoBoardDto> list = infoBoardService.listArticle(map);
		PageNavigation pageNavigation = infoBoardService.makePageNavigation(map);
		
		sendMap.put("pgno", map.get("pgno"));
		sendMap.put("key", map.get("key"));
		sendMap.put("word", map.get("word"));
		sendMap.put("navigation", pageNavigation);
		sendMap.put("articles", list);
		
		return sendMap;
	}

	@GetMapping("/view")
	public InfoBoardDto view(String articleno) {
		System.out.println(articleno);
		InfoBoardDto dto = null;
		
		try {
			dto = infoBoardService.getArticle(Integer.parseInt(articleno));
			System.out.println(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;
	}

	@PutMapping("/modify")
	public Map modify(InfoBoardDto baordDto, @RequestParam Map<String, String> map) {
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("pgno", map.get("pgno"));
		sendMap.put("key", map.get("key"));
		sendMap.put("word", map.get("word"));
		int result = -1;
		
		
		try {
			result = infoBoardService.modifyArticle(baordDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendMap.put("result", result);
		
		return sendMap;
	}

	@DeleteMapping("/delete")
	public int delete(String articleno) throws Exception {
		int no = Integer.parseInt(articleno);
		int result = infoBoardService.deleteArticle(no);
		
		return result;
	}
}
