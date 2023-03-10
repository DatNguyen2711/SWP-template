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
    private int quizId;
    private String nameQuiz;
    private String path;
    private String type;
    private int duration;

    public Quiz() {
    }

    public Quiz(int lessionId, int quizId, String nameQuiz, String path, String type, int duration) {
        this.lessionId = lessionId;
        this.quizId = quizId;
        this.nameQuiz = nameQuiz;
        this.path = path;
        this.type = type;
        this.duration = duration;
    }

    public String getNameQuiz() {
        return nameQuiz;
    }

    public void setNameQuiz(String nameQuiz) {
        this.nameQuiz = nameQuiz;
    }


    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    

    public int getLessionId() {
        return lessionId;
    }

    public void setLessionId(int lessionId) {
        this.lessionId = lessionId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Quiz{" + "lessionId=" + lessionId + ", quizId=" + quizId +", "+ nameQuiz + ", path=" + path + ", type=" + type +", duration = "+ duration + '}';
    }
    
    
    
}
