'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    nodeunit: {
      files: ['test/**/*_test.js'],
    },
    watch: {
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      lib: {
        files: '<%= jshint.lib.src %>',
        tasks: ['jshint:lib', 'nodeunit']
      },
      test: {
        files: '<%= jshint.test.src %>',
        tasks: ['jshint:test', 'nodeunit']
      },
    },
    shell: {
        loadData: {
            options: {
                stdout: true,
                failOnError: true
            },
            command: ['mongoose-fixture --fixture=all --remove', 'mongoose-fixture --fixture=all --add'].join('&&')
        },
        purge: {
            options: {
                stdout: true,
                failOnError: true
            },
            command: 'mongoose-fixture --fixture=all --remove'
        }
    },
    jshint: {
        options: {
            jshintrc: '.jshintrc'
        },
        all: ['Gruntfile.js', '**/*.js', '!node_modules/*.js']
    }
  });

  // Load task.
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-jshint');

  // Default task.
  grunt.registerTask('default', ['jshint']);
  grunt.registerTask('init', ['shell:loadDta']);
  grunt.registerTask('purge', ['shell:purge']);

};
