#!/bin/bash
# SPDX-FileCopyrightText: 2024 Satoru Homma
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### hitting_score コマンドのテスト ###
# 異常な入力
out=$(echo "3 5 2 1 0" | ./hitting_score)
expected="打席数が安打・犠打・犠飛数と四死球数より少ないです。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"


out=$(echo "0 5 5 3 0" | ./hitting_score)
expected="打席数がゼロです。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"


out=$(echo あ | ./hitting_score)
expected="入力が不正です。空白区切りの自然数を5つ入力してください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./hitting_score)
expected="入力が不正です。空白区切りの自然数を5つ入力してください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

### pitching_score コマンドのテスト ###
# 異常な入力
out=$(echo "1 あ 1" | ./pitching_score)
expected="入力が不正です。空白区切りの自然数を3つ入力してください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "1 2 3" | ./pitching_score)
expected="投球回数の端数は0, 1, 2のいずれかにしてください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"


out=$(echo  "0 2 0" | ./pitching_score)
expected="投球回数がゼロです。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"


out=$(echo あ | ./pitching_score)
expected="入力が不正です。空白区切りの自然数を3つ入力してください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 空の入力
out=$(echo | ./pitching_score)
expected="入力が不正です。空白区切りの自然数を3つ入力してください。"
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "全てのテストが成功しました！"
exit $res

