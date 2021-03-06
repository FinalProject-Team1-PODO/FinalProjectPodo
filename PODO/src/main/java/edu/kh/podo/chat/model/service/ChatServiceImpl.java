package edu.kh.podo.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;
import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.chat.model.dao.ChatDAO;
import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatMessage;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.common.Util;
import edu.kh.podo.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO dao;
	
	@Autowired
	private ItemBoardDAO boardDao;

	// 채팅방 목록 조회 Service 구현
	@Override
	public List<ChatList> selectChatRoomList(int memberNo) {
		return dao.selectChatRoomList(memberNo);
	}

	// 채팅방 상세 조회 Service 구현
	@Override
	public Map<String, Object> selectChatDetail(int memberNo, int chatNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("chatNo", chatNo);
		
		// 채팅방 내 판매글 정보를 위한 보드 넘버 얻어오기
		int boardNo = dao.selectBN(chatNo);
		map.put("boardNo", boardNo);
		
		// 판매글 정보
		List<ItemBoard> itemList = boardDao.selectItem(boardNo);
		
		// 판매글 이미지
		List<BoardImage> boardImageList = boardDao.selectBoardImageList(boardNo);
		
		// 반환 Map
		Map<String, Object> rtMap = new HashMap<String, Object>();
		rtMap.put("boardImageList", boardImageList);
		rtMap.put("itemList", itemList);
		
		
		// 채팅 정보 조회 (대화 내용 / 시간만)
		List<ChatList> chatContent = dao.selectOtherDetail(map);
		rtMap.put("boardNo", boardNo);
		rtMap.put("chatNo", chatNo);
		rtMap.put("chatContent", chatContent);
		
		// 후기 작성 유효성 검사를 위한 js 파라미터 구하기
		int sellMemNo = dao.selectWhoIsSeller(boardNo);
		String condition = dao.selectBoardCondition(boardNo);
		int finReview = dao.selectFinReview(map);
		rtMap.put("sellMemNo", sellMemNo);
		rtMap.put("condition", condition);
		rtMap.put("reviewCount", finReview);
		
		
		
		return rtMap;
	}

	// 1:1 채팅하기(채팅 생성) Service 구현
	@Override
	public int startChat(int memberNo, int myMemberNo, int boardNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("myMemberNo", myMemberNo);
		map.put("boardNo", boardNo);
		
		// 채팅방이 이미 존재하는지 DAO 호출하여 조회
		int chatNo  = dao.selectChatRoom(map);
		
		if (chatNo == 0) {
			
			// 채팅방 참여 DAO 호출
			chatNo = dao.createChat(map);
			
			dao.joinChat(map);
			
		} else {
			
			// 채팅방이 있다면 삭제되어 있는 방인지 확인 후 
			int check = dao.checkDel(chatNo);
			
			// 삭제되었다면 다시 생성 (상태 변경)
			if (check > 0) {
				dao.updateStatus(chatNo);
			}
		}
		
			
		return chatNo;
	}

	// 채팅 메세지 삽입 Service 구현
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		chatMessage.setMessageContent(Util.newLineHandling(chatMessage.getMessageContent()));
		
		return dao.insertMessage(chatMessage);
	}

	// 채팅방 삭제(나가기) Service 구현
	@Override
	public int deleteChat(int chatNo) {
		return dao.deleteChat(chatNo);
	}

	// 채팅방 내 후기 작성 Service 구현
	@Override
	public int writeReview(int memberNo, String report, int otherMemNo, int boardNo, String reviewCondition) {
		
		int sellMemNo = dao.selectWhoIsSeller(boardNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("otherMemNo", otherMemNo);
		map.put("sellMemNo", sellMemNo);
		map.put("boardNo", boardNo);
		map.put("reviewCondition", reviewCondition);
		
		String temp = Util.XSSHandling(report);
		String reportContent = Util.newLineHandling(temp);
	
		map.put("reportContent", reportContent);
		
		int memberGrape = dao.selectGrape(otherMemNo);
		map.put("memberGrape", memberGrape);
		
		int insert = dao.writeReview(map);
		int result = 0;
		
		if (insert > 0) {
			result = dao.countPodo(map);
		}
		
		return result;
	}

	@Override
	public int selectGrape(int memberNo) {
		return dao.selectGrape(memberNo);
	}

}
