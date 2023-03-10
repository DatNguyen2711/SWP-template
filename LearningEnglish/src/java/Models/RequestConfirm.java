/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author 84877
 */
public class RequestConfirm {
    private int id;
    private int classId;
    private String dayOfWeek;
    private int slot;
    private boolean isUpdate;

    public RequestConfirm() {
    }

    public RequestConfirm(int id, int classId, String dayOfWeek, int slot, boolean isUpdate) {
        this.id = id;
        this.classId = classId;
        this.dayOfWeek = dayOfWeek;
        this.slot = slot;
        this.isUpdate = isUpdate;
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

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public boolean isIsUpdate() {
        return isUpdate;
    }

    public void setIsUpdate(boolean isUpdate) {
        this.isUpdate = isUpdate;
    }

    @Override
    public String toString() {
        return "RequestConfirm{" + "id=" + id + ", classId=" + classId + ", dayOfWeek=" + dayOfWeek + ", slot=" + slot + ", isUpdate=" + isUpdate + '}';
    }
    
    
}
