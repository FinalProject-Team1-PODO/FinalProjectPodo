package edu.kh.podo.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.dao.MyShopDAO;
import edu.kh.podo.member.model.vo.Review;

@Service
public class MyShopServiceImpl implements MyShopService {
	
	@Autowired
	private MyShopDAO dao;

	// 내 판매상품 조회 Service 구현
	@Override
	public List<ItemBoard> selectMemberShop(int memberNo) {
		return dao.selectMemberShop(memberNo);
	}

	// 내 후기 조회 Service 구현
	@Override
	public List<Review> selectMemberReview(int memberNo) {
		return dao.selectMemberReview(memberNo);
	}
	
	

}