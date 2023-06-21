const { environment } = require('@rails/webpacker')

const webpack = require('webpack');

environment.config.merge({
  resolve: {
    alias: {
      bootstrap: 'bootstrap/dist',
    },
  },
});
  
module.exports = environment
