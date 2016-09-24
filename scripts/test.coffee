request = require 'request'
util = require 'util'
config = require 'config'

zatsuUrl = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=" + config.zatsuKey
console.log zatsuUrl

headers =
    'Content-Type': 'application/json; charset=utf-8'

module.exports = (robot) ->
    robot.respond /(.*)/i, (res) ->
        message = res.match[1]
        console.log message
        data =
            'utt': message
        options =
            uri: zatsuUrl,
            method: 'POST',
            headers: headers,
            json: true,
            body: data
        request options, (error, response, body) ->
            dump body
            res.reply body.utt

dump = (v) ->
    return console.log(util.inspect(v))
