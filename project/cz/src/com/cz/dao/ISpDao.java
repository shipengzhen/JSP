package com.cz.dao;

import java.util.List;

import com.cz.entity.Pl;
import com.cz.entity.Sp;
import com.cz.entity.Spimgae;
import com.cz.util.Page;

/**
 * ��Ʒ�ӿ�
 * @author ʩ����
 *
 */
public interface ISpDao {
	/**
	 * ͨ���������ѯ��Ҫ����Ʒ ��ҳ
	 * @param string
	 * @return
	 */
	List<Sp> findSpLike(String string,Page pg);
	
	/**
	 * ��ѯ����������������
	 * @param string
	 * @param pg
	 * @return
	 */
	int findSpListCount(String string);

	/**
	 * ������Ʒ
	 */
	List<Sp> findbytime();
	/**
	 * �����ߵ���Ʒ
	 */
	List<Sp> findbynum();
	/**
	 * ����
	 */
	List<Sp> findbyhaop();
	
	/**
	 *�����Ƽ�
	 *��ѯר������Ʒ������ߵ���Ʒ
	 * @return
	 */
	List<Sp> findSpBynumGetXType(int spXTypeId);
	
	/**
	 * ͨ��С���Ͳ�ѯ��Ʒ ��ҳ
	 * @param spXTypeId
	 * @return
	 */
	List<Sp> findSpGetXType(int spXTypeId,Page page);
	/**
	 * ͨ��С���Ͳ�ѯ��Ʒ���� ��ҳ
	 * @param spXTypeId
	 * @return
	 */
	int findSpCountGetXtype(int spXTypeId);
	
	/**
	 * ͨ��������������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetPlNum(int spXTypeId,Page page);
	
	/**
	 * ͨ������������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetXl(int spXTypeId,Page page);
	
	/**
	 * ͨ���۸�������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetSpxMoney(int spXTypeId,Page page);
	
	/**
	 * ͨ���ϼ�ʱ������
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetSptime(int spXTypeId,Page page);
	
	/**
	 * ͨ�����ڲ�ѯ��Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpGetJj(int spXTypeId,String jj,Page page);
	
	/**
	 * ͨ�����ڲ�ѯ��Ʒ���� ��ҳ
	 * @param spXTypeId
	 * @return
	 */
	int findSpCountGetjj(int spXTypeId,String jj);
	
	
	/**
	 * ͨ������������������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetPlNum(int spXTypeId,String jj,Page page);
	
	/**
	 * ͨ����������������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetXl(int spXTypeId,String jj,Page page);
	
	/**
	 * ͨ�����ڼ۸�������Ʒ
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetSpxMoney(int spXTypeId,String jj,Page page);
	
	/**
	 * ͨ�������ϼ�ʱ������
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpjjPxGetSptime(int spXTypeId,String jj,Page page);
	
	/**
	 * �Ƽ�
	 * @return
	 */
	List<Sp> findbyTj();
	/**
	 * ͨ��С���� �鿴��Ʒ
	 * @param xtype
	 * @return
	 */
	List<Sp> findXlx(int xtype);
	/**
	 * �ļ��Ƽ�
	 */
	List<Sp> findxj(String xq);
	/**
	 * ͨ�������� ��С���� ����Ʒ ��ҳչʾ
	 */
	List<Sp> findsyxs(int SpType,int spx);
	
	/**
	 * ��Ʒ����ҳ
	 * @param spid
	 * @return
	 */
	Sp findxqsp(int spid);
	/**
	 * ��Ʒ����ͼƬ����ҳ
	 */
	List<Spimgae> findxqImage(int spid);
	
	/**
	 * �������а�
	 * @param spXTypeId
	 * @param page
	 * @return
	 */
	List<Sp> findSpPxGetXl(int spXTypeId);
	
	/**
	 * ��Ʒ������
	 */
	boolean updatespkc( int uid);

}
