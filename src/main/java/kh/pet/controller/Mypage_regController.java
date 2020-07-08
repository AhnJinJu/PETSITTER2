package kh.pet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dao.MypageDAO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.service.Pet_regService;

@Controller
@RequestMapping("/mypage/")
public class Mypage_regController {
	
	@Autowired
	private Pet_regService regservice;

	@Autowired
	private MypageDAO mdao;
	
	@RequestMapping("mypet_reg")
	public void mypet_reg(Mypet_regDTO dto,MultipartFile img, HttpServletResponse response) throws Exception{	
		regservice.reg("aa", dto, img);
		response.sendRedirect("list");
	}
	
	@RequestMapping("contentview")
	public String contentview(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("시퀀스 값 : "+seq);
		Mypet_regDTO dto = mdao.petlist(seq);
		request.setAttribute("dto", dto);
		return "mypage-contentview";
	}
	
	
	
	@RequestMapping("petdel")
	public void petdel(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int seq = Integer.parseInt(request.getParameter("seq"));
		mdao.petdel(seq);
		response.sendRedirect("list");
	}
}
