var gulp = require('gulp');
var concat = require('gulp-concat');
var gulpif = require('gulp-if');
var replace = require('gulp-replace');
var argv = require('yargs').argv;
var fs = require('fs');
var rimraf = require('gulp-rimraf');
var shell = require('gulp-shell');

var scriptFile = 'create-database.sql';
var defaultDatabaseName = 'test_drinkon'; // default to this if the database name not supplied

function getMySqlCommand() {
  var cmd = 'mysql';
  var host = argv.host;
  var user = argv.user;

  // We always need a user parameter but we can handle blank passwords
  if (user === undefined) {
    console.log('ERROR - Supply a valid user with the --user command line parameter');
    process.exit(1);
  }
  else {
    cmd += ' --user ' + user;
  }

  if (argv.password !== undefined) {
    cmd += ' --password ' + password;
  }

  // Default host is 127.0.0.1
  cmd += ' --host ' + (host || '127.0.0.1');

  return cmd;
}

// This task concatenates the individual schema files to create a single create database script
gulp.task('create-script', function() {
  var scriptSources = [
      '../new/schema/database.sql',
      '../new/schema/tables/*.sql',
      '../new/schema/views/*.sql',
      '../new/schema/procs/*.sql',
      '../new/schema/functions/*.sql',
      '../new/data/static/*.sql'
      ];

  if (!!argv.data) {
    scriptSources.push('../new/data/demo/' + argv.data + '.sql');
  }

  return gulp.src(scriptSources)
    .pipe(concat(scriptFile))
    .pipe(gulpif(argv.database !== undefined, replace('%DATABASE%', argv.database)))
    .pipe(gulp.dest('./'));
});

// This task executes the create database script against a mySql host defined by the parameters
gulp.task('run-script', ['create-script'], function() {
  return gulp.src('./' + scriptFile)
    .pipe(replace('%DATABASE%', argv.database || defaultDatabaseName))
    .pipe(shell(getMySqlCommand() + ' < ' + scriptFile));
});

gulp.task('clean-database', function() {
  var tempfile = '_tmp_drop_database.sql';
  require('fs').writeFile('./' + tempfile, 'DROP DATABASE IF EXISTS ' + (argv.database || defaultDatabaseName));

  return gulp.src('./' + tempfile)
    .pipe(shell(getMySqlCommand() + ' < ' + tempfile))
    .pipe(rimraf());
})

gulp.task('clean-script', function() {
  return gulp.src('./' + scriptFile, {
      read: false
    })
    .pipe(rimraf());
})

gulp.task('clean', ['clean-script', 'clean-database']);
gulp.task('default', ['run-script']);
