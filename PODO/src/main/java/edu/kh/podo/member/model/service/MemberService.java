package edu.kh.podo.member.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.member.model.dao.MemberDAO;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.MemberArea;

public interface MemberService {

	
	/** 로그인 service
	 * @param inputMember
	 * @return loginMember
	 */
	Member login(Member inputMember);


	
	/** 회원가입 service
	 * @param inputMember
	 * @return result
	 */
	int signUp(Member inputMember, MemberArea crdnt);



	Member naverLogin(Member inputMember);



	int naverSignUp(Member inputMember);



	void certifiedPhoneNumber(String memberTel, int randomNumber);



	/** 아이디 중복체크 service
	 * @param memberId
	 * @return result
	 */
	int idDupCheck(String memberId);



	/** 닉네임 중복체크 service
	 * @param memberNickname
	 * @return result
	 */
	int nicknameDupCheck(String memberNickname);


	/** 아이디 찾기 service
	 * @param inputMember
	 * @return findMember
	 */
	List<Member> findId(Member inputMember);

	
	/** 비밀번호 찾기 service
	 * @param inputMember
	 * @return result
	 */
	String findPw(Member inputMember);


	/** 비밀번호찾기 아이디 조회 service
	 * @param memberId
	 * @return searchId
	 */
	String searchId(String memberId);



	int inquireWrite(Map<String, Object> paramMap, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;




	/** 비밀번호 재설정(아이디)
	 * @param inputMember
	 * @return result
	 */
	int resetPw(Member inputMember);



	int inquireCount(int memberNo);



	Map<String, Object> inquireDetail(int boardNo);



	List<Admin>  inquireList(int memberNo);


	







	
	

	


}
