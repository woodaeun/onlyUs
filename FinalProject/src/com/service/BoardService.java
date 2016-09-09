package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.PageDTO;

public class BoardService {

	//페이지
	public PageDTO page(int curPage){
		PageDTO dto = new PageDTO();
		List<BoardDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		   //new RowBounds(시작, 갯수))
		int count = dto.getPerPage();	
		int skip = (curPage-1)*count;
        list =
		session.selectList("list", null,
				new RowBounds(skip, count));
			
			
		}finally {
			session.close();
		}
		
		//3가지 저장
		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}//end list()
	
	//전체 레코드 갯수
	public int totalCount(){
		int count = 0;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 count = session.selectOne("totalCount");
		}finally {
			session.close();
		}
		return count;
	}//end totalCount
	
	
	
	
	
	//검색하기
	public List<BoardDTO>
	       search(HashMap<String, String> map){
		List<BoardDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("search", map);
		}finally {
			session.close();
		}
		return list;
	}//end list()
	
	
	
	//삭제하기
		public void delete(String num){
			
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
	        int n =  	
	    session.delete("delete", Integer.parseInt(num));
	        session.commit();
			}finally {
				session.close();
			}
		}//end delete
		
		
		
	//수정하기
	public void update(BoardDTO dto){
		
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
        int n =  	
      session.update("update", dto);
        session.commit();
		}finally {
			session.close();
		}
	}//end updated
	
	
	
	
	// 조회수 증가
	private void readCnt(String num){
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
        int n =  	
      session.update("readCnt", Integer.parseInt(num));
        session.commit();
		}finally {
			session.close();
		}
	}//end readCnt

	//글자세히 보기
	public BoardDTO retrieve(String num){
		//조회수 증가
		readCnt(num);
		SqlSession session = 
				MySqlSessionFactory.getSession();
		BoardDTO dto = null;
		try{
		  dto = 
	 session.selectOne("retrieve", Integer.parseInt(num));
		}finally {
			session.close();
		}
		return dto;
	}//end 
	
	
	
	
	
	//글쓰기
	public void write(BoardDTO dto){
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 int n = session.insert("write", dto);
		 session.commit();
		}finally {
			session.close();
		}
	}//end write
	
	
	
	//목록보기
	public List<BoardDTO> list(){
		List<BoardDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("list");
		}finally {
			session.close();
		}
		return list;
	}//end list()
	
	
}//end 
