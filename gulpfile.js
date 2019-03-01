const gulp = require("gulp"),
  shell = require("gulp-shell"),
  watch = require("gulp-watch"),
  wait = require("gulp-wait"),
  plumber = require("gulp-plumber");

function swallowError(error) {
  // If you want details of the error in the console
  console.log(error.toString());

  this.emit("end");
}

gulp.task("stream", function() {
  // Endless stream mode

  watch([
    "docker-compose.yml",
    "bin/webserver/Dockerfile",
    "bin/mysql/Dockerfile"
  ])
    .pipe(plumber())
    .pipe(wait(500))
    .pipe(shell(["docker-compose build"]));
});

gulp.task("example", () => {
  return gulp
    .src("*.js", { read: false })
    .pipe(shell(["echo <%= file.path %>"]));
});
