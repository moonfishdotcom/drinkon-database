var gulp = require('gulp');
var print = require('gulp-print');
var concat = require('gulp-concat');
var mysql = require('mysql');
var argv = require('yargs').argv;
var fs = require('fs');
var rimraf = require('gulp-rimraf');

var createDatabaseFilename = 'create-database.sql';
var defaultDatabaseName = 'test_drinkon'; // default to this if the database name not supplied

function getConnection() {
  var host = argv.host;
  var user = argv.user;
  var password = argv.password;

  // We always need a user parameter but we can handle blank passwords
  if (user === undefined) {
    console.log('ERROR - Supply a valid user with the --user command line parameter');
    process.exit(1);
  }

  if (password === undefined) {
    password = "";
  }

  // Default host and database values if not supplied
  if (host === undefined) {
    host = "127.0.0.1";
  }

  console.log('INFO - Creating connection on host %s', host);

  return mysql.createConnection({
    host: host,
    user: user,
    password: password,
    multipleStatements: true
  });
}

// This task concatenates the individual schema files to create a single create database script
gulp.task('create-script', function() {
  return gulp.src([
      '../new/schema/database.sql',
      '../new/schema/tables/*.sql',
      '../new/schema/views/*.sql',
      '../new/schema/procs/*.sql',
      '../new/schema/functions/*.sql',
      '../new/data/*.sql'
    ])
    .pipe(concat(createDatabaseFilename))
    .pipe(gulp.dest('./'));
});

// This task executes the create database script against a mySql host defined by the parameters
gulp.task('run-script', ['create-script'], function() {
  var database = argv.database || defaultDatabaseName;
  var replacements = {
    '%DATABASE%': database
  };

  var sql = fs.readFileSync('./' + createDatabaseFilename, 'utf8');
  sql = sql.replace(/%\w+%/g, function(all) {
    return replacements[all] || all;
  });

  var connection = getConnection();
  connection.connect();
  console.log('INFO - Creating database %s', database);
  connection.query(sql, function(err, results) {
    if (err) {
      console.error('ERROR - %s', err.message);
      console.log(sql.split(';')[err.index] + '\n\r');
      process.exit(1);
    }
  })
  connection.end();
});

gulp.task('clean-database', function() {
  var database = argv.database || defaultDatabaseName;
  var sql = 'DROP DATABASE IF EXISTS ' + database;
  var connection = getConnection();
  connection.connect();
  console.log('INFO - Dropping database %s', database);
  connection.query(sql, function(err, results) {
    if (err) {
      console.log(err);
      process.exit(1);
    }
  })
  connection.end();
})

gulp.task('clean-script', function() {
  return gulp.src('./' + createDatabaseFilename, {
      read: false
    })
    .pipe(rimraf());
})

gulp.task('clean', ['clean-script', 'clean-database']);
gulp.task('default', ['run-script']);
