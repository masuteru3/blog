//このファイルは、他のファイルとともにWebpackによって自動的にコンパイルされます
//このディレクトリに存在します。実際のアプリケーションロジックを配置することをお勧めします
// app / javascript内の関連する構造で、これらのパックファイルのみを使用して参照します
//そのコードはコンパイルされます。

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// ../imagesの下のすべての静的画像を出力フォルダーと参照にコピーするためにコメントを外します
//ビューでimage_pack_tagヘルパーを使用します（例：<％= image_pack_tag 'rails.png'％>）
//または以下の `imagePath` JavaScriptヘルパー。
//
// const images = require.context（ '../ images'、true）
// const imagePath =（name）=> images（name、true）

require("trix")
require("@rails/actiontext")
require('packs/nav_hamburger')