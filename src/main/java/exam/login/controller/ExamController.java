package exam.login.controller;

import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exam.login.service.ExamService;
import exam.login.vo.QuestionVO;

@Controller
public class ExamController {

	@Inject
	private ExamService examService;

	@RequestMapping(value = "/exam/openQuestionList.do") // �������� ��� �˻�
	public ModelAndView openQuestionList() throws Exception {
		ModelAndView mv = new ModelAndView("/sample/questionList");
		List<QuestionVO> list = examService.getQuestionList();
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/exam/openQuestionWrite.do") // ���� �߰� �������� �̵�
	public ModelAndView openQuestionWrite() throws Exception {
		ModelAndView mv = new ModelAndView("/sample/questionWrite");

		return mv;
	}

	@RequestMapping(value = "/exam/openQuestionDetail.do") // ���� �� ���� �������� �̵�
	public ModelAndView openQuestionDetail() throws Exception {
		ModelAndView mv = new ModelAndView("/sample/questionDetail");
		return mv;
	}

	@RequestMapping(value = "/exam/insertQuestion.do") // ���� ����
	public ModelAndView insertQuestion(QuestionVO vo) throws Exception {

		// System.out.println(request.getParameter("subject"));

		examService.insertQuestion(vo);

		ModelAndView mv = new ModelAndView("redirect:/exam/openQuestionList.do");
		mv.addObject(vo);
		return mv;
	}

	// ���� ����

}
