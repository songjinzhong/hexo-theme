// 引入 gulp
var gulp = require('gulp'); 

// 引入组件
var jshint=require('gulp-jshint');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var minifycss = require('gulp-minify-css');
var stylus = require('gulp-stylus');
var handlebars = require('gulp-compile-handlebars');

var paths={
    gulp_js : "gulp/js/*.js",
    stylus : "gulp/stylus/*.styl",
    css : "source/css",
    js : "source/js"
}

// 检查脚本
gulp.task('jshint', function() {
    gulp.src(paths.gulp_js)
        .pipe(jshint())
        .pipe(jshint.reporter('default'));
});

gulp.task('stylus', function () {
    return gulp.src(paths.stylus)
        .pipe(stylus())
        .pipe(gulp.dest(paths.css))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(gulp.dest(paths.css));
});

// 合并，压缩文件
gulp.task('scripts', function() {
    gulp.src(paths.gulp_js)
        .pipe(concat('all.js'))
        .pipe(gulp.dest(paths.js))
        .pipe(rename({suffix: '.min'}))
        .pipe(uglify())
        .pipe(gulp.dest(paths.js));
});


//监听文件变化
gulp.task('watch',function(){
        gulp.watch(paths.gulp_js, ['jshint', 'scripts']);
        gulp.watch([paths.stylus,"gulp/stylus/parts/*.styl"],['stylus']);
});

//default
gulp.task('default',['jshint','scripts','stylus','watch'])