package exam.login.service;

import java.util.List;

import org.springframework.stereotype.Service;

import exam.login.vo.QuestionVO;

@Service("examService")
public interface ExamService {

	List<QuestionVO> getQuestionList() throws Exception;	//검색

	public void insertQuestion(QuestionVO vo) throws Exception;	//저장

	

	//상세 보기
	//수정
	
	
	
}
