var webpack = require('webpack')

module.exports = {
	entry: './assets/index.coffee',
	output: {
		path: __dirname,
		filename: 'bundle.js'
	},
	module: {
		loaders: [
			{test: /\.css$/, loader: 'style-loader!css-loader' },
      {test: /\.coffee$/, loader: 'coffee' }
		]
	},
	plugins: [
		new webpack.BannerPlugin('This file is created by jax.xie')
	]
}