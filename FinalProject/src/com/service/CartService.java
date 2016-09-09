package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;

import com.dto.CartDTO;

import com.exception.CommonException;

public class CartService {

	// 목록보기
	public CartDTO orderAllCart(String num) {
		CartDTO list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectOne("orderCart", Integer.parseInt(num));
		} finally {
			session.close();
		}
		return list;
	}// end list()

	// 목록보기
	public CartDTO orderCart(String num) {
		CartDTO list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectOne("orderCart", Integer.parseInt(num));
		} finally {
			session.close();
		}
		return list;
	}// end list()

	// cart 저장
	public void addCart(CartDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("cart.addCart", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("장바구니 저장 실패");
		} finally {
			session.close();
		}
	}// end write

	// cart 삭제
	public void delete(String num) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("deleteC", Integer.parseInt(num));
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("장바구니 삭제 실패");
		} finally {
			session.close();
		}
	}// end write

	// 목록보기
	public List<CartDTO> cartList() {
		List<CartDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("cartList");
		} finally {
			session.close();
		}
		return list;
	}// end list()

	// 다중 지우기
	public void delAllCart(List<String> list) throws CommonException {

		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("delAllCart", list);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("장바구니 삭제 실패");
		} finally {
			session.close();
		}

	}// end delete

	// 다중 fatch하기
	public List<CartDTO> orderAllCart(List<String> list) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		List<CartDTO> cList = null;
		try {
			System.out.println("Dd"+list.size());
			cList = session.selectList("orderAllCart", list);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("전체주문 확인 실패");
		} finally {
			session.close();
		}
		return cList;
	}// end write

}// end
