tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        "primary": "#ec47b5",
        "background-light": "#f6f6f8",
        "background-dark": "#101622",
        "surface-dark": "#1a2230",
      },
      fontFamily: {
        "display": ["Space Grotesk", "sans-serif"],
        "body": ["Noto Sans", "sans-serif"],
      },
      borderRadius: {
        "DEFAULT": "0.5rem", 
        "lg": "1rem", 
        "xl": "1.5rem", 
        "full": "9999px"
      },
      backgroundImage: {
          'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
          'smoke-gradient': 'radial-gradient(circle at 50% 0%, rgba, transparent 70%), radial-gradient(circle at 80% 50%, rgba(19, 91, 236, 0.08), transparent 50%)'
      }
    },
  },
}