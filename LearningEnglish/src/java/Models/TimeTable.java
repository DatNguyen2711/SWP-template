/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;


public class TimeTable {
    private int id;
    private int classId;
    private String dateStudy;
    private int slot;
    private boolean status;

    public TimeTable() {
    }

    public TimeTable(int id, int classId, String dateStudy, int slot, boolean status) {
        this.id = id;
        this.classId = classId;
        this.dateStudy = dateStudy;
        this.slot = slot;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getDateStudy() {
        return dateStudy;
    }

    public void setDateStudy(String dateStudy) {
        this.dateStudy = dateStudy;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TimeTable{" + "id=" + id + ", classId=" + classId + ", dateStudy=" + dateStudy + ", slot=" + slot + ", status=" + status + '}';
    }

    
  
}
