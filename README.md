これなに
===========

[NeoBundle](http://github.com/Shougo/NeoBundle.vim) に触発されて作った、汎用的なプロジェクトダウンロードツール


Usage
==========

[mikutter](http://mikutter.hachune.net) のプラグインを管理する例

```sh
$ cd ~/.mikutter/plugin/
$ git clone https://github.com/pocke/NyaoBunddle
```

```ruby
# file: ~/.mikutter/plugin/.nyaobundlerc

get 'pocke/mikutter_delete_copy', name: 'delete_copy'
get 'pocke/mikutter_tweet_stack', name: 'tweet_stack'
```

```sh
$ NyaoBunddle/bin/nyaobundle
```

カレントディレクトリに name としてプロジェクトが作成されます。

TODO
==========

- Gem にしたい
- English
- getter, matcher の充実
- etc...
