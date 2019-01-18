var R = require("r-script");
// example.js

var out = R("ex-sync.R")
  .data("hello world", 20)
  .callSync();
  
console.log('Valor: ', out);