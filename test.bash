#!/bin/bash
# SPDX-FileCopyrightText: 2024 Satoru Homma
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### `hitting_score` コマンドのテスト ###
# 正しい入力
out=$(echo "3,5,1,1,0" | ./hitting_score)
expected="1.000"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "6,5,0,0,0" | ./hitting_score)
expected="監督「それは強すぎる」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "3,5,2,1,0" | ./hitting_score)
expected="監督「打席数が安打・犠打・犠飛数と四死球数より少ない。集計ミスだろう。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "0,5,5,0,0" | ./hitting_score)
expected="監督「全打席犠打・犠飛ですか。テクニックはありますがもっとパワーをつけましょう。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "0,5,0,5,0" | ./hitting_score)
expected="監督「全打席四球。とてもいい選球眼だ。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "0,5,0,0,5" | ./hitting_score)
expected="監督「全打席死球。ドンマイ。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "3,0,1,1,1" | ./hitting_score)
expected="監督「君はそもそもベンチだぞ」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "0,5,3,2,0" | ./hitting_score)
expected="監督「ヒットを打ってくれ。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "0,5.5,3,2,あ" | ./hitting_score)
expected="入力に自然数以外が含まれています"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 異常な入力（文字列）
out=$(echo あ | ./hitting_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./hitting_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### `pitching_score` コマンドのテスト ###
# 正しい入力
out=$(echo "9,1,1" | ./pitching_score)
expected="0.964"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo  "0,2,0" | ./pitching_score)
expected="監督「君はそもそもベンチだぞ」"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo  "1,あ,1.5" | ./pitching_score)
expected="入力に自然数以外が含まれています"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo  "1,2,3" | ./pitching_score)
expected="監督「投球回数の端数は３未満の自然数だ。」"
[ "${out}" = "${expected}" ] || ng "$LINENO"


# 異常な入力（文字列）
out=$(echo あ | ./pitching_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./pitching_score)
[ "$?" = 1 ]     || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "全てのテストが成功しました！"
exit $res

