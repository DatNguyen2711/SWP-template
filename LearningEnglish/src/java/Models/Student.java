/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class Student {
    private String username;
    private String avatar;
    private String description;

    public Student() {
    }

    public Student(String username, String avatar, String description) {
        this.username = username;
        this.avatar = avatar;
        this.description = description;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Student{" + "username=" + username + ", avatar=" + avatar + ", description=" + description + '}';
    }
    
}
