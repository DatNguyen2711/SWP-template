/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class ClassOnline {
    private int id;
    private String username;
    private String nameClass;
    private String timeStart;
    private String timeEnd;
    private String link;
    private String status;

    public ClassOnline() {
    }

    public ClassOnline(int id, String username, String nameClass, String timeStart, String timeEnd, String link, String status) {
        this.id = id;
        this.username = username;
        this.nameClass = nameClass;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.link = link;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ClassOnline{" + "id=" + id + ", username=" + username + ", nameClass=" + nameClass + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + ", link=" + link + ", status=" + status + '}';
    }
    
    
}
