const express = require("express");
const app = express();
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const helmet = require("helmet");
const morgan = require("morgan");
const multer = require("multer");
const userRoute = require("./routes/users");
const authRoute = require("./routes/auth");
const postRoute = require("./routes/posts");
const router = express.Router();
const employeeRoute= require("./routes/employee")
const path = require("path");
const Reels = require("./models/Reels");
const mailRoute=require("./routes/mailer")

// const getVideoDurationInSeconds = require('get-video-duration').getVideoDurationInSeconds;


dotenv.config();

mongoose.connect(
  process.env.MONGO_URL,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log("Connected to MongoDB");
  }
);
app.use("/images", express.static(path.join(__dirname, "public/images")));
// app.use(
// 	cookieSession({
// 		name: "session",
// 		keys: ["cyberwolve"],
// 		maxAge: 24 * 60 * 60 * 100,
// 	})
// );

// app.use(passport.initialize());
// app.use(passport.session());

// app.use(
// 	cors({
// 		origin: "http://localhost:3000",
// 		methods: "GET,POST,PUT,DELETE",
// 		credentials: true,
// 	})
// );
//middleware
app.use(express.json());
app.use(helmet());
app.use(morgan("common"));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    return cb(null, __dirname+"/public/images");
  },
  filename: (req, file, cb) => {
   return cb(null, file.originalname);
  },
});

const upload = multer({ storage: storage });
app.post("/api/upload", upload.single("file"), (req, res) => {
  try {
    return res.status(200).json("File uploded successfully");
  } catch (error) {
    console.error("error");
  }
});

// app.post("/api/uploads", upload.single("audio"), (req, res) => {
//   try {
//     return res.status(200).json("File uploded successfully");
//   } catch (error) {
//     console.error("error");
//   }
// });
 
  // Check video duration
  // const videoDuration = getVideoDurationInSeconds(videoUrl);
  // const MAX_DURATION = 15; // Maximum duration in seconds

  // if (videoDuration > MAX_DURATION) {
    // Delete the uploaded video
    // fs.unlinkSync(videoUrl);

    // return res.status(400).json({ error: 'Reel duration exceeds the maximum allowed duration of 15 seconds' });
  // }
 app.post('/api/reels', upload.single('video'), (req, res) => {
  const { title, description } = req.body;
  const videoUrl = req.file.path;

  const reel = new Reels({
    title,
    description,
    videoUrl,
  });

  reel.save((err, savedReel) => {
    if (err) {
      console.error("err");
      res.status(500).json({ error: 'Failed to save the reel' });
    } else {
      res.status(201).json(savedReel);
    }
  });


});
app.use("/api/auth", authRoute);
app.use("/api/users", userRoute);
app.use("/api/posts", postRoute);
app.use("/api/mail",mailRoute)
app.use("/api/emp",employeeRoute)
app.listen(8800, () => {
  console.log("Backend server is running!");
});
