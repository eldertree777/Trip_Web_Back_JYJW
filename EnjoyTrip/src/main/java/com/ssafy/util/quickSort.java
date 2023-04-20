package com.ssafy.util;

import java.util.LinkedList;
import java.util.List;

import com.ssafy.board.model.BoardDto;

public class quickSort {
	public static List<BoardDto> quickSort(List<BoardDto> list) {
		if (list.size() <= 1) return list;
		BoardDto pivot = list.get(list.size() / 2);

        List<BoardDto> lesserArr = new LinkedList<>();
        List<BoardDto> equalArr = new LinkedList<>();
        List<BoardDto> greaterArr = new LinkedList<>();
        List<BoardDto> retArr = new LinkedList<>();

        for (BoardDto dto : list) {
            if (dto.getHit() > pivot.getHit()) lesserArr.add(dto);
            else if (dto.getHit() < pivot.getHit()) greaterArr.add(dto);
            else equalArr.add(dto);
        }
        retArr.addAll(quickSort(lesserArr));
        retArr.addAll(equalArr);
        retArr.addAll(quickSort(greaterArr));
        
		return retArr;
        
	}
}
