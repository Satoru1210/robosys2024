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

### `hitting_score` コマンドのテスト ###
# 正しい入力
out=$(echo -e "3,5,1,1" | ./hitting_score)
expected="1.0"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "3,5,2,1" | ./hitting_score)
expected="打席数が安打・犠打・犠飛数と四死球数より少ないです。"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "0,5,3,2" | ./hitting_score)
expected="全打席四死球or全打席犠打・犠飛の生きる伝説です。"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "3,0,1,1" | ./hitting_score)
expected="君はベンチ"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

# 異常な入力（文字列）
out=$(echo あ | ./hitting_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./hitting_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "全てのテストが成功しました！"
exit $res

