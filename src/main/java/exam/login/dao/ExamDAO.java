package exam.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import exam.common.dao.AbstractDAO;
import exam.login.vo.QuestionVO;

@Repository("examDAO")
public class ExamDAO extends AbstractDAO {

	public List<QuestionVO> getQuestionList() throws Exception { // �˻�
		List<QuestionVO> list = selectList("exam.selectQuestionList");
		return list;
	}

	public void insertQuestion(QuestionVO vo) {
		insert("exam.insertQuestion", vo);
	}

}
