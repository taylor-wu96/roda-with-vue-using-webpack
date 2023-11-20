const { merge } = require('webpack-merge');
const common = require('./webpack.common');
const path = require('path');
const __base = path.resolve(__dirname, '..');
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

//Configure dev enviroment by combining common configuration and adding some more options
module.exports = merge(common, {
    mode: 'development',
    // Run on Safe Mode : set the cache to false
    // cache: false,
    // devtool: 'inline-source-map',
    devServer: {
        static: './dist',
        historyApiFallback: true,
        hot: true,
        devMiddleware: {
            writeToDisk: true,      
      }
    },
    output: {
        path: path.resolve(__dirname, '../dist'),
        filename: '[name].bundle.js'
      },
    plugins: [
        new CleanWebpackPlugin(),]
})
