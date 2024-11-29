#!/bin/bash
# SPDX-FileCopyrightText: 2024 Satoru Homma
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### `plus` コマンドのテスト ###
# 正しい入力
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

# 異常な入力（文字列）
out=$(echo あ | ./plus)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./plus)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### `Suchi` コマンドのテスト ###
# 正しい入力
out=$(echo -e "10\n20\n30\n40\n50" | ./Suchi)
expected="平均: 30.0
中央値: 30.0
標準偏差: 15.811388300841896
分散: 250.0"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

# 異常な入力（文字列）
out=$(echo あ | ./Suchi)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "無効な入力: {line}" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./Suchi)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "エラー: 入力が空です" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "全てのテストが成功しました！"
exit $res

