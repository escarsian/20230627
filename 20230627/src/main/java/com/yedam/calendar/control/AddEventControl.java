package com.yedam.calendar.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.calendar.service.CalendarService;
import com.yedam.calendar.service.CalendarServiceImpl;
import com.yedam.calendar.vo.CalendarVO;
import com.yedam.common.Control;

public class AddEventControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String json = "";
		
		String title = req.getParameter("title");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		CalendarVO vo = new CalendarVO();
		vo.setTitle(title);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		CalendarService service = new CalendarServiceImpl();
		if(service.addEvent(vo)) {
			json = "{\"retCode\":\"Success\"}";
		}else {
			json = "{\"retCode\":\"Fail\"}";
		}
		
		
		
		//성공: {"retCode":"Success"}/ 실패: {"retCode":"Fail"}
		return json + ".json";
	}

}
