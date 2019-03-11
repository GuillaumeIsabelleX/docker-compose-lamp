const gulp = require("gulp"),
  shell = require("gulp-shell"),
  watch = require("gulp-watch"),
  wait = require("gulp-wait"),
  plumber = require("gulp-plumber"),
  tlid = require('tlid');


function swallowError(error) {
  // If you want details of the error in the console
  console.log(error.toString());

  this.emit("end");
}

gulp.task("stream", function() {
  // Endless stream mode

  watch([
    "docker-compose.yml",
    "bin/webservernode/Dockerfile",
    "bin/mysql/Dockerfile",
	  "bin/**/*"
  ])
    .pipe(plumber())
    .pipe(wait(500))
    .pipe(shell(["docker-compose build"]));
});

gulp.task("build", () => {
  return gulp
    .src("./package.json",{allowEmpty:true})
    .pipe(shell(["docker-compose build"]));
});

gulp.task("start", () => {
  return gulp
    .src("./.gitignore", { read: false })
    .pipe(shell(["echo \"make docker to run an image\" "]));
});

