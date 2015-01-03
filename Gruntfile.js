'use strict';

var grunt = require('grunt');
var packageJSON = require('./package.json');

require('load-grunt-tasks')(grunt);

grunt.initConfig({
  panda: {
    docx: {
      options: {
        pandocOptions: '-s -S resume.md'
      },
      files: {
        'build/resume.docx': 'resume.md'
      }
    },

    html: {
      options: {
        pandocOptions: [
          '-H style_chmduquesne.css',
          '-f markdown', '-t html5',
        ].join(' ')
      },
      files: {
        'build/resume.html': 'resume.md'
      }
    },

    rtf: {
      options: {
        pandocOptions: '-s -S resume.md'
      },
      files: {
        'build/resume.rtf': 'resume.md'
      }
    },

    tex: {
      options: {
        pandocOptions: [
          '--template=style_chmduquesne.tex',
          '-f markdown', '-t context',
          '-V papersize=A4'
        ].join(' ') // It's supposed to use the array, but nope
      },
      files: {
        'build/resume.tex': 'resume.md'
      }
    }
  },

  shell: {
    clean: {
      command: 'rm build/*'
    },

    pdf: {
      command: 'cd build && context resume.tex'
    }
  }
});

grunt.registerTask('all', ['panda', 'shell:pdf']);
grunt.registerTask('clean', ['shell:clean']);
grunt.registerTask('docx', ['panda:docx']);
grunt.registerTask('html', ['panda:html']);
grunt.registerTask('pdf', ['panda:tex', 'shell:pdf']);
grunt.registerTask('rtf', ['panda:rtf']);