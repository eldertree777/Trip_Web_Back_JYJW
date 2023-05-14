package com.ssafy.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public int write(@RequestBody InfoBoardDto InfoBoardDto)
			throws Exception {
		
		System.out.println("Controller");
		int result = infoBoardService.writeArticle(InfoBoardDto);
		return result;
	}
	
//	public ResponseEntity<List<BoardDto>> listArticle(@ApiParam(value = "게시글을 얻기위한 부가정보.", required = true) BoardParameterDto boardParameterDto) throws Exception {
//		logger.info("listArticle - 호출");
//		return new ResponseEntity<List<BoardDto>>(boardService.listArticle(boardParameterDto), HttpStatus.OK);
//	}
	
	@GetMapping("/list")
	public ResponseEntity<List<InfoBoardDto>> list(@RequestParam(required=false) Map<String, String> map) throws Exception {
		Map<String, Object> sendMap = new HashMap();
		
		map = new HashMap<String, String>();
		map.put("pgno", 1 + "");
		map.put("key", "");
		map.put("word", "");
		
		List<InfoBoardDto> list = infoBoardService.listArticle(map);
		PageNavigation pageNavigation = infoBoardService.makePageNavigation(map);
		
//		sendMap.put("pgno", map.get("pgno"));
//		sendMap.put("key", map.get("key"));
//		sendMap.put("word", map.get("word"));
//		sendMap.put("navigation", pageNavigation);
//		sendMap.put("articles", list);
		
		
		
		return new ResponseEntity<List<InfoBoardDto>>(list, HttpStatus.OK);
	}

	@GetMapping("/view/{articleno}")
	public InfoBoardDto view(@PathVariable("articleno") String articleno) {
		System.out.println("rest_info_view");
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
	
//	@RequestParam Map<String, String> map
	@PutMapping("/modify")
	public int modify(@RequestBody InfoBoardDto baordDto) {
//		Map<String, Object> sendMap = new HashMap<String, Object>();
//		sendMap.put("pgno", map.get("pgno"));
//		sendMap.put("key", map.get("key"));
//		sendMap.put("word", map.get("word"));
		int result = -1;
		
		
		try {
			result = infoBoardService.modifyArticle(baordDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		sendMap.put("result", result);
		
		return result;
	}

	@DeleteMapping("/{articleno}")
	public int delete(@PathVariable("articleno") String articleno) throws Exception {
		int no = Integer.parseInt(articleno);
		System.out.println(no);
		int result = infoBoardService.deleteArticle(no);
		
		return result;
	}
}
