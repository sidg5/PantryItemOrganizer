import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.example.app',
  appName: 'item-organizer',
  webDir: 'dist',
  server: {
    androidScheme: 'https'
  }
};

export default config;
