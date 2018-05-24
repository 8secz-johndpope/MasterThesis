# 修論のサンプル

s1さんの修論を元に作成されています
http://192.168.100.21/gitbucket/git/utisam/masters-thesis.git

がんばれ。
LINUXで書くことを想定しています。

## 必要なもの
* TeX (dvipdfmx, pdflatex)
* GNU Make
* pdfcrop: PDFをトリミングするツール。 apt, yum, brew なら pdf-tools とかに入っているかも。
* titlesec: 章とかのフォーマットを変える TeX パッケージ

## 必要な（入れたほうが良い）パッケージ（debianメインです．apt-get等で入れてください）
* texlive-science (algorithm等)
* texlive-latex-extra
* texlive-latex-recommended
* texlive-fonts-recommended

## はじめに
* 卒論の人は，sty/NGC.styのmaketitleの上書き部分を卒論バージョンに切り替えてください（修論verを消して卒論verのコメントアウトを解除．場所はsty/NGC.styに記載．）

## ディレクトリ構造
* ルート: mainのthesis.txtやref.bibファイルなど．基本的にはここで作業
* font: fontファイル格納場所
* img: 画像ファイル格納場所
* sty: styleファイルの格納場所．サイトから拾ってきたstyファイルはsty/site-styに入れます．

## フォント
IPA フォントを埋め込む感じにしているので、インストールして下さい。

## 画像
PDF を画像として挿入したい場合は ``img/org/`` に PDF を入れて下さい。
``includegraphics`` では ``img/`` で指定して下さい。

``img/`` に ``*.pdf`` や ``*.xbb`` を入れると ``clean`` で消えるので注意。
PDF 以外は ``img/`` で構いません。

## 挿入したPDF画像が表示されない場合
カレントディレクトリのMAKEFILEの上部を参考にしてください

## 参考文献
* ref.bibに追加していきます．
* 論文名でググると，たとえば http://iopscience.iop.org/article/10.1088/0953-2048/26/3/035010/pdf のようなページが見つかります．Export citation 項目が見つかるので（どんなサイトでも大体あります），それをダウンロードして自分のref.bibにコピーしてください．
* （あるのに自分で1から書くばｋ）

## バックアップ (とりあえずどっか別のディレクトリに保存したい人用)
* ディレクトリパス等の設定が必要（backup.shを開いて編集してください）
* chmod +x backup.sh (実行権限なければ)
* ./backup.sh

