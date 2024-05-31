// https://nuxt.com/docs/api/configuration/nuxt-config
import { defineNuxtConfig } from 'nuxt/config'

export default defineNuxtConfig({
  // ssr: true,
  devtools: { enabled: true },
  css: [
    "bootstrap/scss/bootstrap.scss",
    '@fortawesome/fontawesome-svg-core/styles.css'
  ],
  plugins: [{ src: "~/plugins/crispchat.client.js", mode: "client" }],
  
  app: {
    head: {
        script: [
            {children: 'var global = window;'}
        ]
    },

},

  build: {
    transpile: [
    '@heroicons/vue',
    '@fortawesome/fontawesome-svg-core',
    '@fortawesome/free-brands-svg-icons',
    '@fortawesome/free-regular-svg-icons',
    '@fortawesome/free-solid-svg-icons',
    '@fortawesome/vue-fontawesome'
    ],
  },
  vite: {
    define: {
      'process.env.DEBUG': false,
    },
  },

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  imports: {
    dirs: [
      // Scan top-level modules
      'composables',
      // ... or scan modules nested one level deep with a specific name and file extension
      'composables/*/index.{ts,js,mjs,mts}',
      // ... or scan all modules within given directory
      'composables/**',
      'utils/**',
      'utils',
    ],
  },


  modules: [
   '@nuxt/ui', 
   '@pinia/nuxt',
   "vuetify-nuxt-module",
  ],
  runtimeConfig: {
    app: {
      api: {
        baseUrl: process.env.API_URL,
      },
    },
  },
})