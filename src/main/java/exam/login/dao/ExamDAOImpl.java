package exam.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import exam.common.dao.AbstractDAO;
import exam.login.vo.QuestionVO;

@Repository
public class ExamDAOImpl extends AbstractDAO implements ExamDAO {
	
	@Override
	public List<QuestionVO> getQuestionList() throws Exception { // °Ë»ö
		List<QuestionVO> list = selectList("exam.selectQuestionList");
		return list;
	}

	@Override
	public void insertQuestion(QuestionVO vo) {
		insert("exam.insertQuestion", vo);
	}

}
