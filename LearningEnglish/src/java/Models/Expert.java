/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class Expert {
    private String username;
    private String title;
    private String description;
    private String avatar;

    public Expert() {
    }

    public Expert(String username, String title, String description, String avatar) {
        this.username = username;
        this.title = title;
        this.description = description;
        this.avatar = avatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Expert{" + "username=" + username + ", title=" + title + ", description=" + description + ", avatar=" + avatar + '}';
    }
    
    
}
