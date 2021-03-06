package edu.kh.podo.admin.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.admin.model.vo.AdminReply;


public interface AdminService {


	Map<String, Object> inquiryList(int cp, int boardCode);

	int insertBoard(Map<String, Object> paramMap);

	Map<String, Object> searchBoardList(Map<String, Object> paramMap);

	int adminDelete(String deleteValue, int boardCode);

	List<Admin> faqList(String classification);

	int adminReplyWrite(String boardContent, int boardNo);

	List<AdminReply> selectAdminReply(int boardNo);

	int deleteReply(int boardNo);

}
