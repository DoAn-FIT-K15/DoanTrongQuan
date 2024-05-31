export default () => {
  window.$crisp = [];
  window.CRISP_WEBSITE_ID = "938359f5-be5b-47e8-8606-9a5b2d95958f";

  (function() {
    var d = document;
    var s = d.createElement("script");

    s.src = "https://client.crisp.chat/l.js";
    s.async = 1;
    d.getElementsByTagName("head")[0].appendChild(s);
  })();
};