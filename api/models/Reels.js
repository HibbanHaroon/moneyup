const mongoose = require("mongoose");

const ReelSchema = new mongoose.Schema(
  {
    title: String,
  description: String,
  videoUrl: String,
  },
  { timestamps: true }
);

module.exports = mongoose.model("Reel", ReelSchema);
