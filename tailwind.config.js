/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: [require('daisyui')],
  daisyui: {
    themes: [
      {
        'sepia-dark': {
          primary: '#edd681',
          secondary: '#eab308',
          accent: '#edd681',
          neutral: '#edd681',
          'base-100': '#151515',
          info: '#38bdf8',
          success: '#00ff00',
          warning: '#fde047',
          error: '#dc2626'
        }
      }
    ]
  }
};
