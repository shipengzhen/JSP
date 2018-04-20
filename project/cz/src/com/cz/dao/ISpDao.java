package com.cz.dao;

import java.util.List;

import com.cz.entity.Pl;
import com.cz.entity.Sp;
import com.cz.entity.Spimgae;
import com.cz.util.Page;

/**
 * 商品接口
 * @author 施鹏振
 *
 */
public interface ISpDao {
	/**
	 * 通过收索框查询想要的商品 分页
	 * @param string
	 * @return
	 */
	List<Sp> findSpLike(String string,Page pg);
	
	/**
	 * 查询收索框搜索的数量
	 * @param string
	 * @param pg
	 * @return
	 */
	int findSpListCount(String string);

	/**
	 * 最新商品
	 */
	List<Sp> findbytime();
	/**
	 * 销量高的商品
	 */
	List<Sp> findbynum();
	/**
	 * 好评
	 */
	List<Sp> findbyhaop();
	
	/**
	 *热卖推荐
	 *查询专题中商品销量最高的商品
	 * @return
	 */
	List<Sp> findSpBynumGetXType(int spXTypeId);
	
	/**
	 * 通过小类型查询商品 分页
	 * @param spXTypeId
	 * @return
	 */
	List<Sp> findSpGetXType(int spXTypeId,Page page);
	/**
	 * 通过小类型查询商品总数 分页
	 * @param spXTypeId
	 * @return
	 */
	int findSpCountGetXtype(int spXTypeId);
	
	/**
	 * 通过评论数排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetPlNum(int spXTypeId,Page page);
	
	/**
	 * 通过销量排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetXl(int spXTypeId,Page page);
	
	/**
	 * 通过价格排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetSpxMoney(int spXTypeId,Page page);
	
	/**
	 * 通过上架时间排序
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetSptime(int spXTypeId,Page page);
	
	/**
	 * 通过季节查询商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpGetJj(int spXTypeId,String jj,Page page);
	
	/**
	 * 通过季节查询商品总数 分页
	 * @param spXTypeId
	 * @return
	 */
	int findSpCountGetjj(int spXTypeId,String jj);
	
	
	/**
	 * 通过季节评论数排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetPlNum(int spXTypeId,String jj,Page page);
	
	/**
	 * 通过季节销量排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetXl(int spXTypeId,String jj,Page page);
	
	/**
	 * 通过季节价格排序商品
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetSpxMoney(int spXTypeId,String jj,Page page);
	
	/**
	 * 通过季节上架时间排序
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetSptime(int spXTypeId,String jj,Page page);
	
	/**
	 * 推荐
	 * @return
	 */
	List<Sp> findbyTj();
	/**
	 * 通过小类型 查看商品
	 * @param xtype
	 * @return
	 */
	List<Sp> findXlx(int xtype);
	/**
	 * 夏季推荐
	 */
	List<Sp> findxj(String xq);
	/**
	 * 通过大类型 找小类型 在商品 首页展示
	 */
	List<Sp> findsyxs(int SpType,int spx);
	
	/**
	 * 商品详情页
	 * @param spid
	 * @return
	 */
	Sp findxqsp(int spid);
	/**
	 * 商品介绍图片详情页
	 */
	List<Spimgae> findxqImage(int spid);
	
	/**
	 * 销量排行榜
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetXl(int spXTypeId);
	
	/**
	 * 商品库存减少
	 */
	boolean updatespkc( int uid);

}
