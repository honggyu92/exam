package exam.login.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import exam.login.dao.ExamDAO;
import exam.login.vo.QuestionVO;

@Service
public class ExamServiceImpl implements ExamService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Inject
	private ExamDAO examDAO;
	
	@Override
	public List<QuestionVO> getQuestionList() throws Exception{	//검색
		return examDAO.getQuestionList();
	}

	@Override
	public void insertQuestion(QuestionVO vo) throws Exception { //저장
		examDAO.insertQuestion(vo);
	}
}
