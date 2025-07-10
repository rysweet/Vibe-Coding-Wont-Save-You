const markdownItInclude = require("markdown-it-include");

module.exports = {
  engine: ({ marp }) => {
    marp.markdown.use(markdownItInclude, {
      root: "./slides"
    });
    return marp;
  }
};