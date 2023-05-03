package com.ssafy.web.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.web.dto.AttractionDto;
import com.ssafy.web.dto.SidoDto;
import com.ssafy.web.service.AttractionService;
import com.ssafy.web.service.SidoService;

@RestController
@RequestMapping("/api")
public class RestAttraction {
	
	@Autowired
	SidoService sidoService;
	
	@Autowired
	AttractionService attractionService;
	
	@GetMapping("/sido")
	public List<SidoDto> getsido(){
		System.out.println("sido");
		return sidoService.getAllSido();
	}
	
	@GetMapping("/listAttraction")
	public List<AttractionDto> listAttraction() throws SQLException{
		return attractionService.listAttraction();
	}
	
	//areaCode=5&contentTypeId=28&keyword=산
	@GetMapping("/listAttractionSearch")
	public List<AttractionDto> listAttractionSearch(@RequestParam int areaCode, @RequestParam("contentTypeId")int contentTypeId, @RequestParam("keyword")String keyword) throws SQLException{
		System.out.println("listAttractionSearch");
		System.out.println(areaCode + " " + contentTypeId + " " + keyword);
		return attractionService.listAttractionSearch(areaCode, contentTypeId, keyword);
	}
}
