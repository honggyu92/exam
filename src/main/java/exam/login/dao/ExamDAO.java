package exam.login.dao;

import java.util.List;

import exam.login.vo.QuestionVO;

public interface ExamDAO {

	List<QuestionVO> getQuestionList() throws Exception;

	void insertQuestion(QuestionVO vo);

}