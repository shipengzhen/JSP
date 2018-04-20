package com.cz.dao;

import java.util.ArrayList;
import java.util.List;

import com.cz.entity.Pl;
import com.cz.entity.Sp;
import com.cz.util.Page;

/**
 * 评论接口
 * @author 施鹏振
 *
 */
public interface IPlDao {
	/**
	 * 通过商品Id查询评论人数
	 * @param spId
	 * @return
	 */
	int findPlCount(int spId);
	
	/**
	 * 商品评价总数
	 * @param spid
	 * @return
	 */
	 int findCountPl(int spid);
	/**
	 * 商品全部评价
	 * @param spid
	 * @return
	 */
	 List<Pl> findPl(int spid,Page pg);

	/**
	 * 查询各类型品论数
	 * @param spid
	 * @param plType
	 * @return
	 */
	 int findCountPlGetplType(int spid,String plType);

	/**
	 * 查询商品各类型品论
	 * @param spid
	 * @param plType
	 * @return
	 */
	 List<Pl> findPlGetplType(int spid,String plType,Page pg);
	
	 /**
	  * 查询用户的评论数
	  * @param uId
	  * @return
	  */
	 int findPlCountGetuId(int uId);
	 
	 /**
	  * 查询用户各类型的评论数
	  * @param uId
	  * @param Type
	  * @return
	  */
	 int findPlCountGetuIdType(int uId,String plType);
	 
	 /**
	  * 查询用户全部的评论
	  * @param uId
	  * @return
	  */
	 List<Pl> findAllPlGetuId(int uId,Page pg);
	 
	 /**
	  * 查询用户各类型的评论
	  * @param uId
	  * @param plType
	  * @return
	  */
	 List<Pl> findTypePlGetuId(int uId,String plType,Page pg);
	 /**
	  * 添加评论
	  */
	 boolean insertpl(Pl p);
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
