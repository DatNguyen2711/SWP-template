
package Models;


public class Course {
    private int courseId;
    private String username;
    private String nameCourse;
    private String title;
    private int price;
    private String description;
    private int categoryId;
    private String skill;
    private String image;

    public Course() {
    }

    public Course(int courseId, String username, String nameCourse, String title, int price, String description, int categoryId, String skill, String image) {
        this.courseId = courseId;
        this.username = username;
        this.nameCourse = nameCourse;
        this.title = title;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.skill = skill;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }


    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNameCourse() {
        return nameCourse;
    }

    public void setNameCourse(String nameCourse) {
        this.nameCourse = nameCourse;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Course{" + "courseId=" + courseId + ", username=" + username + ", nameCourse=" + nameCourse + ", title=" + title +", price = "+ price + ", description=" + description + ", categoryId=" + categoryId +", skill = "+skill+", "+image+ '}';
    }
    
    
}
