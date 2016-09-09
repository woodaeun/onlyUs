package com.service;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;

import com.dto.OrderDTO;

import com.exception.CommonException;

public class OrderService {

	public void addOrder(OrderDTO dto, String num)
	throws CommonException{
		
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			//트랜잭션
	       session.insert("order.addOrder",dto);
	       session.delete("cart.deleteC",Integer.parseInt(num));
	       session.commit();
		}catch(Exception e){
		   e.printStackTrace();
		   session.rollback();
		   throw new CommonException("주문저장 실패");
		}finally {
		
			session.close();
		}
	}//end addOrder
	public void orderAll(OrderDTO dto, String num)
			throws CommonException{
		
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			//트랜잭션
			session.insert("order.ordeAll",dto);
			session.delete("cart.deleteC",Integer.parseInt(num));
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
			throw new CommonException("jj");
		}finally {
			
			session.close();
		}
	}//end addOrder
	
	
	public int numSequence() throws CommonException{
		SqlSession session = 
				MySqlSessionFactory.getSession();
		int num = 0;
		try{
		//트랜잭션 처리
			num = session.selectOne("numSequence"); 
		}catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("주문 실패");
		}finally {
			session.close();
		}
		return num;
	}//end write
	
	public void addAllOrder(ArrayList<OrderDTO> list, List<String> num) throws CommonException{
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		//트랜잭션 처리
		 int n = session.insert("order.addAllOrder", list); 
		 int n2 = session.insert("cart.delAllCart", num);
		 session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new CommonException("주문 실패");
		}finally {
			session.close();
		}
	}//end write
	
	
	
}//end 
