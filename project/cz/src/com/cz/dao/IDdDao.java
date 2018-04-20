package com.cz.dao;

import java.util.List;

import com.cz.entity.Dd;
import com.cz.entity.Gwc;
import com.cz.entity.Sp;
import com.cz.util.Page;

public interface IDdDao {
	/**
	 * 修改数量
	 */
	boolean updatespnum(int spnum,int ddid);


	
	/**
	 * 加入购物车  参数： 用户id  参数：商品id
	 */
	boolean insertSp(int uid, int spid,int spnum,String type); 

	
	
	/**
	 * 查询 我的购物车  订单表     用户id  
	 * 多表连接  -- 商品表 和订单表
	 */
	List<Gwc> findGwc(int uid,String type,Page p);
	
	/**
	 * 记录总数
	 */
	int findnum(int uid,String type);
	
	
	/**
	 * 删除		订单id
	 */
	boolean deletesp(int ddid);
	
	/**
	 * 查询用户订单数
	 */
	int findDdCount(int uId);
	
	/**
	 * 查询用户订单相应的类型数
	 */
	int findDdCount(int uId,String ddType);
	
	/**
	 * 订单数量 	用户id
	 */
	int findDdnum(int uid);
	/**
	 *  用户订单价格
	 */
	int findumoney(int uid);
	
	/**
	 * 查询最新订单
	 */
	List<Sp> dingList();

	
	/**
	 * 删除订单
	 */
	boolean deleteDd(int spid);
	
	/**
	 * 判断 用户有没有这个商品
	 */
	int findspbyuid(int uid, int spid);
	/**
	 * 支付页面 -- 遍历购物车
	 */
	List<Gwc> findDdzf(int uid);
	/**
	 * 总积分
	 */
	int findzjf(int uid);
	/**
	 * 支付完成  --》 把待付款 改成 代收货
	 */
	boolean updateDdds(int uid);

	
	/**
	 * 查询订单中的商品
	 */
	List<Dd> findTypeDds(int uId,String ddType,Page pg);
	
	List<Dd> findAllDd(int uId,Page pg);
	
	
	/**
	 * 查询订单 订单id个数 和
	 */
	List<Gwc> findDdmunid(int uid);
	/**
	 * 把待评论 改成 已完成
	 */
	boolean updatetype(int ddid);
}

















