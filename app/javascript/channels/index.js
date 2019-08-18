//このディレクトリとすべてのサブディレクトリ内のすべてのチャネルをロードします。
//チャンネルファイルの名前は* _channel.jsでなければなりません。

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
