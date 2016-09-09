package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.GoodsDTO;
import com.dto.PageDTO;
import com.exception.CommonException;

public class GoodsService {


			
	
	//목록보기
	public List<GoodsDTO> list(String category) throws CommonException{
		List<GoodsDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("goodsList",category);
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("상품목록 에러");
			
		}finally {
			session.close();
		}
		return list;
	}//end list()
	
	//목록보기
		public GoodsDTO retrieve(String gCode) throws CommonException{
			GoodsDTO dto=null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			  dto = session.selectOne("goodsRetrieve",gCode);
			}catch(Exception e){
				e.printStackTrace();
				throw new CommonException("상품 에러");
				
			}finally {
				session.close();
			}
			return dto;
		}//end list()
	
	
}//end 
