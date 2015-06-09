var Student = function(fname, lname){
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

var Courses = function(name, department, credits){
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

var eric = new Student("eric", "firth");
var chem = new Courses("chemistry", "science", 7);
var bio = new Courses("bio", "science", 4);
var algebra = new Courses("algebra", "math", 3);


Student.prototype.name = function() {
  return this.fname + " " + this.lname;
};

Student.prototype.enroll = function(course) {
  if (this.courses.indexOf(course) === -1) {
    this.courses.push(course);
    course.addStudent(this)
  };
};

Student.prototype.course_load = function() {
  var departments = {};
  for (var i = 0; i < this.courses.length; i++) {
    departments[this.courses[i].department] += this.courses[i].credits;
  };
  return departments;
};

Courses.prototype.addStudent = function(student) {
  if (this.students.indexOf(student) === -1) {
    this.students.push(student);
    student.enroll(this)
  }
};

eric.enroll(chem);
