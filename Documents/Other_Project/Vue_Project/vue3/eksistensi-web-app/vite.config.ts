import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import fs from 'fs';

export default defineConfig({
  plugins: [vue()],
  server: {
    https: {
      key: fs.readFileSync('/Users/linda/Documents/Other_Project/Vue_Project/vue3/eksistensi-web-app/ssl/server.key'),
      cert: fs.readFileSync('/Users/linda/Documents/Other_Project/Vue_Project/vue3/eksistensi-web-app/ssl/server.crt'),
    },
    port: 8081,
    host: 'localhost',
  },
});
