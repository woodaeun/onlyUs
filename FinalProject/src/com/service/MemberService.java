package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.MemberDTO;
import com.exception.CommonException;

public class MemberService {

	// 회원등록
	public void addMember(MemberDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember

	// 로그인
	public MemberDTO login(HashMap<String, String> map) throws CommonException {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end addMember

	public MemberDTO mypage(String userid) throws CommonException {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("mypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("mypage 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end addMember

	// 회원 수정
	public void updateMember(MemberDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updateMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원수정 실패");
		} finally {
			session.close();
		}

	}// end addMember
		// 회원 삭제

	public void deleteMember(String userid) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("deleteMember", userid);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원삭제 실패");
		} finally {
			session.close();
		}

	}// end addMember

}
