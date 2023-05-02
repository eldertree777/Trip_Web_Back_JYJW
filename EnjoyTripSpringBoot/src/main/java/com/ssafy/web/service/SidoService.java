package com.ssafy.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.SidoDto;
import com.ssafy.web.repository.SidoMapper;

@Service
public class SidoService {
	
	@Autowired
	private SidoMapper sidomapper;
	
	public List<SidoDto> getAllSido(){
		return sidomapper.getAllSido();
	}
}
