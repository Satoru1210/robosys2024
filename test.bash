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
out=$(echo -e "3,5,1,1,0" | ./hitting_score)
expected="1.0"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "3,5,2,1,0" | ./hitting_score)
expected="監督「打席数が安打・犠打・犠飛数と四死球数より少ない。集計ミスだろう。」"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "0,5,5,0,0" | ./hitting_score)
expected="監督「全打席犠打・犠飛ですか。テクニックはありますがもっとパワーをつけましょう。」"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "0,5,0,5,0" | ./hitting_score)
expected="監督「全打席四球。とてもいい選球眼だ。」"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "0,5,0,0,5" | ./hitting_score)
expected="監督「全打席死球。ドンマイ。」"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "3,0,1,1,1" | ./hitting_score)
expected="監督「君はそもそもベンチだぞ」"
[ "$(printf "${out}")" = "$(printf "${expected}")" ] || ng "$LINENO"

out=$(echo -e "0,5,3,2,0" | ./hitting_score)
expected="監督「ヒットを打ってくれ。」"
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

