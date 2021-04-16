const {environment} = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        daterangepicker: 'daterangepicker',
        Popper: ['popper.js', 'default'],
        moment: 'moment'
    })
)

module.exports = environment
