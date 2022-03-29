export const webDriver = {
  newXHR: function () {
    return new XMLHttpRequest();
  },
  fixupUrl: function (url) {
    return url || "/";
  }
};
