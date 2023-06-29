package com.yedam.board.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class AddBoardControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String json= "";
		
		
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		String brdTitle = req.getParameter("brdTitle");
		String brdWriter = req.getParameter("brdWriter");
		String brdContent = req.getParameter("brdContent");
		String createDateStr = req.getParameter("createDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date createDate = sdf.parse(createDateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int clickCnt = Integer.parseInt(req.getParameter("clickCnt"));
		
		
		
		return json +".json";
	}

}
