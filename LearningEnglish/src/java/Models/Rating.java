/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class Rating {
    private String Lecturer;
    private String Student;
    private int rate;
    private String comment;
    private int courseId;
    private int status;
    private String timeComment;

    public Rating() {
    }

    public Rating(String Lecturer, String Student, int rate, String comment, int courseId, int status, String timeComment) {
        this.Lecturer = Lecturer;
        this.Student = Student;
        this.rate = rate;
        this.comment = comment;
        this.courseId = courseId;
        this.status = status;
        this.timeComment = timeComment;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    

    public String getLecturer() {
        return Lecturer;
    }

    public void setLecturer(String Lecturer) {
        this.Lecturer = Lecturer;
    }

    public String getStudent() {
        return Student;
    }

    public void setStudent(String Student) {
        this.Student = Student;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getTimeComment() {
        return timeComment;
    }

    public void setTimeComment(String timeComment) {
        this.timeComment = timeComment;
    }

    @Override
    public String toString() {
        return "Rating{" + "Lecturer=" + Lecturer + ", Student=" + Student + ", rate=" + rate + ", comment=" + comment + ", courseId=" + courseId + ", status=" + status + ", timeComment=" + timeComment + '}';
    }

    
}
