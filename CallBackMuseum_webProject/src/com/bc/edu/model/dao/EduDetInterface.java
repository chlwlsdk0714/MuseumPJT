package com.bc.edu.model.dao;

import java.util.List;

import com.bc.edu.model.vo.DetailEducationVO;



public interface EduDetInterface {
	public List<DetailEducationVO> exam(String edu_idx) throws Exception;

	public DetailEducationVO detailMenu(String edu_idx) throws Exception;
}