const gulp = require("gulp"),
  shell = require("gulp-shell"),
  watch = require("gulp-watch"),
  wait = require("gulp-wait");

function swallowError(error) {
  // If you want details of the error in the console
  console.log(error.toString());

  this.emit("end");
}

gulp.task("stream", function() {
  // Endless stream mode

  watch(["./docker*", "./bin/**", "./bin/*/*"], { ignoreInitial: false })
    .pipe(shell(["echo <%= file.path %>", "docker-compose build"]))
    .on("error", swallowError)
    .pipe(wait(4500));
});

gulp.task("example", () => {
  return gulp
    .src("*.js", { read: false })
    .pipe(shell(["echo <%= file.path %>"]));
});
