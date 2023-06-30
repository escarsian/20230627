package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.dao.ReplyMapper;
import com.yedam.board.vo.ReplyVO;

public class TestMain {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession();
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		
		ReplyVO reply = new ReplyVO();
		reply.setBrdNo(185);
		reply.setReplyer("user11");
		reply.setReply("연습 중.");
		reply.setReplyNo(6);
		
		mapper.insertReply(reply);
		
//		mapper.deleteReply(5);
		
		
//		List<ReplyVO> list = mapper.selectList(185);
//		for(ReplyVO vo : list) {
//			System.out.println(vo.toString());
		}
	}

