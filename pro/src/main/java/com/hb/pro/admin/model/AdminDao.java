package com.hb.pro.admin.model;

import java.util.List;
import java.util.Map;





public interface AdminDao {
	int adminLogin(Map<String, String> map);
	int idchk(String id);
	void insertOne(AdminVo bean);
	void insertCook(Map<String, String> map);
	List selectAll();
	CookVo selectOne(int cook_num);
	void updateOne(CookVo bean);
	void deleteOne(int cook_num);
}
