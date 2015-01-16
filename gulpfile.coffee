gulp = require 'gulp'

stylus = require 'gulp-stylus'


gulp.task 'default', ->
	gulp.src './index.styl'
	.pipe stylus()
	.pipe gulp.dest '.'
