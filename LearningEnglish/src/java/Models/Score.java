/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class Score {
    private String username;
    private int quizId;
    private double score;
    private int time;

    public Score() {
    }

    public Score(String username, int quizId, double score, int time) {
        this.username = username;
        this.quizId = quizId;
        this.score = score;
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Score{" + "username=" + username + ", quizId=" + quizId + ", score=" + score + ", time=" + time + '}';
    }
    
    
    
}
