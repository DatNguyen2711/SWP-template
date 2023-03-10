/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class Writting {
    private int quizId;
    private String username;
    private String content;
    private String date;

    public Writting() {
    }

    public Writting(int quizId, String username, String content, String date) {
        this.quizId = quizId;
        this.username = username;
        this.content = content;
        this.date = date;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Writting{" + "quizId=" + quizId + ", username=" + username + ", content=" + content + ", date=" + date + '}';
    }
    
    
}
