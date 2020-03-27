---
to: package.json
---
{
  "name": "<%= name %>",
  "version": "1.0.0",
  "description": "Qoala App Starter Kit",
  "author": "Qoala Front end Team",
  "private": true,
  "scripts": {
    "dev": "nuxt",
    "build": "nuxt build",
    "start": "nuxt start",
    "generate": "nuxt generate",
    "lint": "eslint --ext .js,.vue --ignore-path .gitignore .",
    "lintfix": "eslint --fix --ext .js,.vue --ignore-path .gitignore .",
    "precommit": "npm run lint",
    "now-dev": "npm run dev",
    "now-build": "npm run build"
  },
  "dependencies": {
    "@nuxtjs/axios": "^5.6.0",
    "@nuxtjs/google-tag-manager": "^2.3.0",
    "@nuxtjs/moment": "^1.3.0",
    "@nuxtjs/pwa": "^3.0.0-beta.19",
    "@nuxtjs/workbox": "^3.0.0-beta.16",
    "@qoala/ui": "^1.2.5",
    "@qoala/vue-content-resource": "^0.1.5",
    "axios": "^0.19.0",
    "compressorjs": "^1.0.5",
    "config": "^3.2.3",
    "google-libphonenumber": "^3.2.5",
    "husky": "^4.2.3",
    "lint-staged": "^10.0.9",
    "lodash": "^4.17.11",
    "messageformat": "^2.3.0",
    "mobile-device-detect": "^0.3.3",
    "nuxt": "^2.0.0",
    "ts-node": "^8.4.1",
    "vue-property-decorator": "^8.2.2"
  },
  "devDependencies": {
    "@nuxt/typescript-build": "^0.6.0",
    "@nuxtjs/eslint-config": "^2.0.0",
    "@nuxtjs/eslint-module": "^1.1.0",
    "@vue/test-utils": "^1.0.0-beta.27",
    "babel-core": "7.0.0-bridge.0",
    "babel-eslint": "^10.0.3",
    "babel-jest": "^25.2.1",
    "eslint": "^6.8.0",
    "eslint-config-airbnb": "^18.0.1",
    "eslint-config-prettier": "^6.8.0",
    "eslint-config-standard": "^14.1.0",
    "eslint-friendly-formatter": "^4.0.1",
    "eslint-import-resolver-alias": "^1.1.2",
    "eslint-loader": "^3.0.3",
    "eslint-plugin-import": "^2.18.2",
    "eslint-plugin-jest": "^23.1.1",
    "eslint-plugin-node": "^11.0.0",
    "eslint-plugin-nuxt": ">=0.4.2",
    "eslint-plugin-prettier": "^3.1.1",
    "eslint-plugin-promise": "^4.2.1",
    "eslint-plugin-standard": "^4.0.1",
    "eslint-plugin-vue": "^6.0.2",
    "fs": "^0.0.1-security",
    "jest": "^25.2.2",
    "moment": "^2.24.0",
    "node-sass": "^4.12.0",
    "nodemon": "^2.0.2",
    "prettier": "^2.0.2",
    "sass-loader": "^8.0.0",
    "vue-jest": "^3.0.5"
  },
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,ts,tsx,md,json,vue}": [
      "prettier --write",
      "git add"
    ]
  }
}
