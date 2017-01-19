package exam.login.vo;

import java.sql.Date;
import java.util.List;

public class QuestionVO {
	
	
	
	List<OptionVO> optionList;

	public List<OptionVO> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<OptionVO> optionList) {
		this.optionList = optionList;
	}
	
	int id;
	String subject;
	String Difficulty;
	String Score;
	String type;
	String contents;
	Date date;
	String answer;
	String active;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDifficulty() {
		return Difficulty;
	}

	public void setDifficulty(String difficulty) {
		Difficulty = difficulty;
	}

	public String getScore() {
		return Score;
	}

	public void setScore(String score) {
		Score = score;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
}
