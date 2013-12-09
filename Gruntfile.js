'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    nodeunit: {
      files: ['test/**/*_test.js'],
    },
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      lib: {
        src: ['lib/**/*.js']
      },
      test: {
        src: ['test/**/*.js']
      },
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
    }
  });

  // Load task.
  grunt.loadNpmTasks('grunt-shell');

  // Default task.
  grunt.registerTask('default', ['jshint', 'nodeunit']);
  grunt.registerTask('init', ['shell:loadData']);
  grunt.registerTask('purge', ['shell:purge']);

};
