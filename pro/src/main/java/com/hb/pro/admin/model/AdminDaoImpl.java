package com.hb.pro.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public class AdminDaoImpl implements AdminDao {
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int adminLogin(Map<String, String> map) {
		return sqlSession.selectOne("admin.login", map);
	}
	@Override
	public int idchk(String id) {
		return sqlSession.selectOne("admin.idchk", id);
	}
	@Override
	public void insertOne(AdminVo bean) {
		sqlSession.insert("admin.insertOne",bean);
	}
	@Override
	public void insertCook(Map<String, String> map) {
		sqlSession.insert("admin.insertCook",map);
	}
	@Override
	public List selectAll() {
		return sqlSession.selectList("admin.selectAll");
	}
	@Override
	public CookVo selectOne(int cook_num) {
		return sqlSession.selectOne("admin.selectOne", cook_num);
	}
	@Override
	public void updateOne(CookVo bean) {
		sqlSession.update("admin.updateOne", bean);
	}
	@Override
	public void deleteOne(int cook_num) {
		sqlSession.delete("admin.deleteOne", cook_num);
	}
	@Override
	public List searchAll(String title) {
		return sqlSession.selectList("admin.searchAll",title);
	}
	@Override
	public List searchTitle(String title) {
		return sqlSession.selectList("admin.searchTitle",title);
	}
	@Override
	public void basketInsert(Map<String, Object> map) {
		sqlSession.insert("admin.insertBasket",map);
	}
	@Override
	public void basketDel(int cook_num) {
		sqlSession.delete("admin.deleteBasket", cook_num);
	}
	@Override
	public int selectBasket(Map<String, Object> map) {
		return sqlSession.selectOne("admin.selectBasket", map);
	}
	@Override
	public List basketList(String id) {
		return sqlSession.selectList("admin.basketList",id);
	}
	@Override
	public void idDel(String id) {
		sqlSession.delete("admin.idDel",id);
	}
}
