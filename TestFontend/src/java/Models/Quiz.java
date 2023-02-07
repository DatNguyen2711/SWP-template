/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class Quiz {
    private int lessionId;
    private int questionId;
    private String question;
    private String[] answer;
    private String correctAnswer;

    public Quiz() {
    }

    public Quiz(int lessionId, int questionId, String question, String[] answer, String correctAnswer) {
        this.lessionId = lessionId;
        this.questionId = questionId;
        this.question = question;
        this.answer = answer;
        this.correctAnswer = correctAnswer;
    }

    public int getLessionId() {
        return lessionId;
    }

    public void setLessionId(int lessionId) {
        this.lessionId = lessionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String[] getAnswer() {
        return answer;
    }

    public void setAnswer(String[] answer) {
        this.answer = answer;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Override
    public String toString() {
        String ans = "";
        for (int i = 0; i < answer.length; i++) {
            if(i < answer.length-1)
                ans += answer[i]+"/";
            else
                ans += answer[i];
        }
 
        return "Quiz{" + "lessionId=" + lessionId + ", questionId=" + questionId + ", question=" + question + ", answer=" + ans + ", correctAnswer=" + correctAnswer + '}';
    }
    
    
}
