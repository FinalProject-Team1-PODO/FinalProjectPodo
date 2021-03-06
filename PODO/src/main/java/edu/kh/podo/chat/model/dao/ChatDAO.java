package edu.kh.podo.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatMessage;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.member.model.vo.Member;
import oracle.net.aso.m;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 채팅방 목록 조회 DAO
	 * @param memberNo
	 * @return chatRoomList
	 */
	public List<ChatList> selectChatRoomList(int memberNo) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", memberNo);
	}

	/** 채팅 정보 조회 DAO
	 * @param map
	 * @return otherDetail
	 */
	public List<ChatList> selectOtherDetail(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectOtherDetail", map);
	}

	
	/** 채팅방이 이미 존재하는지 조회 DAO
	 * @param map
	 * @return result
	 */
	public int selectChatRoom(Map<String, Object> map) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", map);
	}	

	/** 채팅방 만들기 DAO
	 * @param map
	 * @return result
	 */
	public int createChat(Map<String, Object> map) {
		int result = sqlSession.insert("chatMapper.createChat", map);
		
		if (result > 0) {
			return (int)map.get("chatNo");
		}
		
		return 0;
	}

	/** 채팅방 참여 DAO
	 * @param map
	 */
	public void joinChat(Map<String, Object> map) {
		sqlSession.insert("chatMapper.joinChat", map);
	}

	/** 채팅 메세지 삽입 DAO
	 * @param chatMessage
	 * @return result
	 */
	public int insertMessage(ChatMessage messageContent) {
		return sqlSession.insert("chatMapper.insertMessage", messageContent);
	}

	/** 삭제되어 있는 방인지 확인 DAO
	 * @param chatNo
	 * @return check
	 */
	public int checkDel(int chatNo) {
		return sqlSession.selectOne("chatMapper.checkDel", chatNo);
	}

	/** 채팅방이 삭제되었다면 다시 생성 DAO
	 * @param chatNo
	 */
	public void updateStatus(int chatNo) {
		sqlSession.update("chatMapper.updateStatus", chatNo);
	}

	/** 채팅방 삭제(나가기) DAO
	 * @param chatNo
	 * @return result
	 */
	public int deleteChat(int chatNo) {
		return sqlSession.update("chatMapper.deleteChat", chatNo);
	}

	/** 채팅방 내 판매글 정보를 위한 보드 넘버 얻어오기 DAO
	 * @param chatNo
	 * @return boardNo
	 */
	public int selectBN(int chatNo) {
		return sqlSession.selectOne("chatMapper.selectBN", chatNo);
	}

	/** 판매자가 누군지 조회 DAO
	 * @param boardNo
	 * @return sellMemNo
	 */
	public int selectWhoIsSeller(int boardNo) {
		return sqlSession.selectOne("chatMapper.selectWhoIsSeller", boardNo);
	}

	/** 후기 작성 DAO
	 * @param map
	 * @return result
	 */
	public int writeReview(Map<String, Object> map) {
		return sqlSession.insert("chatMapper.writeReview", map);
	}

	/** 판매중인지 완료되었는지 조회 DAO
	 * @param boardNo
	 * @return condition
	 */
	public String selectBoardCondition(int boardNo) {
		return sqlSession.selectOne("chatMapper.selectCondition", boardNo);
	}

	/** 후기를 작성했는지 검사
	 * @param map
	 * @return finReview
	 */
	public int selectFinReview(Map<String, Object> map) {
		return sqlSession.selectOne("chatMapper.selectFinReview", map);
	}

	public int countPodo(Map<String, Object> map) {
		return sqlSession.update("chatMapper.countPodo", map);
	}

	public int selectGrape(int memberNo) {
		return sqlSession.selectOne("chatMapper.selectGrape", memberNo);
	}

}
