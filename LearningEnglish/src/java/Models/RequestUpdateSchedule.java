/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;


public class RequestUpdateSchedule {
    private int id;
    private String newDate;
    private int newSlot;
    private int classId;

    public RequestUpdateSchedule() {
    }

    public RequestUpdateSchedule(int id, String newDate, int newSlot, int classId) {
        this.id = id;
        this.newDate = newDate;
        this.newSlot = newSlot;
        this.classId = classId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNewDate() {
        return newDate;
    }

    public void setNewDate(String newDate) {
        this.newDate = newDate;
    }

    public int getNewSlot() {
        return newSlot;
    }

    public void setNewSlot(int newSlot) {
        this.newSlot = newSlot;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "RequestUpdateSchedule{" + "id=" + id + ", newDate=" + newDate + ", newSlot=" + newSlot + ", classId=" + classId + '}';
    }

}
