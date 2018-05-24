#!/bin/sh

# 適当
# バックアップされるディレクトリの名前（要変更）
bkupeddir_name="syuuron"
# バックアップされるディレクトリがある場所（要変更）
bkupeddir="${HOME}/Dropbox/syncFolder/university/ngcLab/thesis"
# バックアップ先ディレクトリのパス（要変更）
bkupdir_path="${HOME}/Dropbox/syncFolder/university/ngcLab/thesis/backup"
# 日付
today=`date +%y%m%d-%H%M%S`
# 圧縮後のバックアップファイルの名前
fname="${bkupeddir_name}_${today}.tar.gz"

(
# カレントディレクトリをバックアップされるディレクトリがあるディレクトリに変更
# cd `dirname $0`; cd ..
# シンボリックリンク対策
cd $bkupeddir
(cd $bkupeddir_name; make clean)
tar -zcvf $bkupdir_path/$fname $bkupeddir_name
)
