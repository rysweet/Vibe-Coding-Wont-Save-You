import markdownItInclude from "markdown-it-include";

export default {
  engine: ({ marp }) => {
    marp.markdown.use(markdownItInclude, {
      root: "./slides"
    });
    return marp;
  }
};