module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 15,

    // font family with optional fallbacks
    fontFamily: 'Input, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#cfcfc2',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#eee8d5',

    // terminal background color
    backgroundColor: '#01181f',

    // border color (window, tabs)
    //borderColor: '#001823',

    // custom css to embed in the main window
    css: '* { text-rendering: optimizeLegibility !important; }',

    // custom css to embed in the terminal window 
    // != <> </> -> www
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#005E73',
      red: '#f95d52',
      green: '#859901',
      yellow: '#fd971f',
      blue: '#6c6ec6',
      magenta: '#d34e9a',
      cyan: '#30958d',
      white: '#eee8d5',
      lightBlack: '#999',
      lightRed: '#ff5a55',
      lightGreen: '#9cc140',
      lightYellow: '#e6db74',
      lightBlue: '#268bd2',
      lightMagenta: '#d33682',
      lightCyan: '#3bafa6',
      lightWhite: '#fdf6e3'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
