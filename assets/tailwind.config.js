module.exports = {
  mode: 'jit',
  purge: [
    './js/**/*.js',
    './css/**/*.css',
    '../lib/*_web/**/*.*ex'
  ],
  // darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {},
    container: {
      center: true,
      padding: '2rem',
    }
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    // require('daisyui')
  ],
}
