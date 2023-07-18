const mongoose = require("mongoose");

const EmployeeSchema = new mongoose.Schema(
  {
    emp_no: {
      type: Number,
    },
    first_name: {
      type: String,
    },
    last_name: {
      type: Number,
    },
    middle_name: {
      type: Number,
    },
    dept_id: {
      type: Number,
    },
    phone_no: {
      type: Number,
    },
    hire_date: {
      type: Date,
    },
    job: {
      type: String,
    },
    education_level: {
      type: Number,
    },
    gender: {
      type: String,
    },
    dob: {
      type: Date,
    },
    salary: {
      type: Number,
    },
    commission: {
      type: Number,
    },
    emp_no: {
      type: Number,
    },
    bonus: {
      type: Number,
    },
    
    
    
    
    
  },
  { timestamps: true }
);

module.exports = mongoose.model("Employee", EmployeeSchema);