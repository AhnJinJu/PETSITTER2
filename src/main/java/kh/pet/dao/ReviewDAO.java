package kh.pet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.ReviewDTO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private HttpSession session;
	
	public int insert(ReviewDTO rwdto)throws Exception{
		return mybatis.insert("Review.insert",rwdto);
	}
	
	public int delete(int rw_seq, String rw_parent_seq)throws Exception{
		System.out.println("rw_parent_seq :"+rw_parent_seq);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("rw_seq", rw_seq);
		param.put("rw_parent_seq", rw_parent_seq);
		return mybatis.delete("Review.delete",param);
	}
	
	public int selectCnt(String rw_parent_seq) throws Exception{
		return mybatis.selectOne("Review.selectCnt",rw_parent_seq);
	}
	
	public List<ReviewDTO> selectByParent(String rw_parent_seq) throws Exception{
		return mybatis.selectList("Review.selectByParentSeq", rw_parent_seq); 
	}
}
