// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("bootstrap");

require("../stylesheets/main.scss");
require("../stylesheets/reset.scss");

import "@fortawesome/fontawesome-free/js/all";
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log("Hello from application.js");
// let someObject;
// window.addEventListener("DOMContentLoaded", (_event) => {
//   someObject = document.querySelector(".display_image");
// });
// console.log(someObject);
const signupPage = document.querySelector(".signup-page");
console.log(signupPage);
