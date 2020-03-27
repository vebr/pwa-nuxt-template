---
to: settings.json
---
{
  "eslint.enable": true,
  "eslint.run": "onSave",
  "eslint.autoFixOnSave": true,
  "editor.formatOnSave": true,
  "eslint.validate": [
    "javascript",
    {
      "language": "vue",
      "autoFix": true
    }
  ],
  "javascript.suggestionActions.enabled": false,
  "prettier.singleQuote": true,
  "prettier.tabWidth": 4,
  "prettier.printWidth": 100,
  "prettier.arrowParens": "always"
}
