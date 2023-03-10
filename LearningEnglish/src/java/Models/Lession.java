/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class Lession {
    private int courseId;
    private int lessionId;
    private String nameLession;
    private String path;
    private int stt;

    public Lession() {
    }

    public Lession(int courseId, int lessionId,String nameLession, String path, int stt) {
        this.courseId = courseId;
        this.lessionId = lessionId;
        this.nameLession = nameLession;
        this.path = path;
        this.stt = stt;
    }

    public String getNameLession() {
        return nameLession;
    }

    public void setNameLession(String nameLession) {
        this.nameLession = nameLession;
    }
    

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getLessionId() {
        return lessionId;
    }

    public void setLessionId(int lessionId) {
        this.lessionId = lessionId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    @Override
    public String toString() {
        return "Lession{" + "courseId=" + courseId + ", lessionId=" + lessionId +", name = "+nameLession+ ", path=" + path + ", stt=" + stt + '}';
    }
    
    
}
