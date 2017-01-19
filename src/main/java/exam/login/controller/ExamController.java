package exam.login.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exam.login.service.ExamService;
import exam.login.vo.QuestionVO;

@Controller
public class ExamController {
	
	 @Resource(name="examService")
	    private ExamService examService;

	 @RequestMapping(value = "/exam/openQuestionList.do") //문제은행 목록 검색
	 public ModelAndView openQuestionList() throws Exception{
			ModelAndView mv = new ModelAndView("/sample/questionList");

			List<QuestionVO> list = examService.getQuestionList();
			mv.addObject("list", list);

			return mv;
		}
	 
	 @RequestMapping(value = "/exam/openQuestionWrite.do")	 //문제 추가 페이지로 이동
	 public ModelAndView openQuestionWrite() throws Exception {
			ModelAndView mv = new ModelAndView("/sample/questionWrite");

			return mv;
		}
	@RequestMapping(value = "/exam/openQuestionDetail.do")	 //문제 상세 보기 페이지로 이동
	 public ModelAndView openQuestionDetail() throws Exception {
		ModelAndView mv = new ModelAndView("/sample/questionDetail");
		return mv;
	}
	@RequestMapping(value = "/exam/insertQuestion.do") //문제 생성
	public ModelAndView insertQuestion(QuestionVO vo) throws Exception {
		
		//System.out.println(request.getParameter("subject"));
		
		
		examService.insertQuestion(vo);

		ModelAndView mv = new ModelAndView("redirect:/exam/openQuestionList.do");
		mv.addObject(vo);
		return mv;
	}
	//문제 수정
	
}
