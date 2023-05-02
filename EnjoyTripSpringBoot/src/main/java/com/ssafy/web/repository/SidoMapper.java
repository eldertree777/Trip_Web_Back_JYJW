package com.ssafy.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ssafy.web.dto.SidoDto;

@Mapper
public interface SidoMapper {
	
	@Select("select * from sido")
	List<SidoDto> getAllSido();
}
