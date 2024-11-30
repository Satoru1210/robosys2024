# robosys2024
# 打率計算ツール
[![test](https://github.com/Satoru1210/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/Satoru1210/robosys2024/actions/workflows/test.yml)

## 概要
`hitting_score`は、標準入力から試合データを受け取り、打率を計算して出力するコマンドラインツールです。

## 機能
- 標準入力のデータをもとに打率を出力、異例な試合成績だった場合監督からの一言が出力される。

## 動作環境・使用ソフトウェア
- このツールは Python で実装されており、以下の環境で動作確認済み：
  - Ubuntu 20.04
  - Python 3.7 ~ 3.12
---

## リポジトリのクローン方法
GitHub リポジトリからクローンします。

```
$ git clone git@github.com:Satoru1210/robosys2024.git
$ cd robosys2024/
```

GitHub アカウントがない場合は HTTPS を使用：
```
$ git clone https://github.com/Satoru1210/robosys2024.git
$ cd robosys2024/
```

`hitting_score` スクリプトを実行可能にします：
```
$ chmod +x hitting_score
```

---

## 使用方法

### 標準入力を使用
通常入力例：
下記のように左から"安打数,打席数,犠打・犠飛数,四球数,死球数"の順で試合データを入力します。
```
$ echo "3,5,1,1,0" | ./hitting_score
```

出力結果：
下記のようにその打者の打率が出力されます。
```
1.000
```
---
### 異例な入力
「打席数が打数データに比べ少なすぎる場合」例：
```
$ echo "3,3,1,1,0" | ./hitting_score
```

出力結果：
```
監督「打席数が安打・犠打・犠飛数と四死球数より少ない。集計ミスだろう。」
```

「打席数が0だった場合」例：
```
$ echo "4,0,2,1,1" | ./hitting_score
```

出力結果：
```
監督「君はそもそもベンチだぞ。」
```
と出力されます。


「安打のみで打率が1.000を超えた場合」例：
```
$ echo "4,3,0,0,0" | ./hitting_score
```

出力結果：
```
監督「それは強すぎる」
```

「ヒット数０で打席数と・犠飛・犠打数の合計が等しい場合」例：
```
$ echo "0,3,3,0,0" | ./hitting_score
```

出力結果：
```
監督「全打席犠打・犠飛ですか。テクニックはありますがもっとパワーをつけましょう。」
```

「ヒット数０で打席数と四球数が等しい場合」例：
```
$ echo "0,3,0,3,0" | ./hitting_score
```

出力結果：
```
監督「全打席四球。とてもいい選球眼だ。」
```

「ヒット数０で打席数と死球数が等しい場合」例：
```
$ echo "0,3,0,0,3" | ./hitting_score
```

出力結果：
```
監督「全打席死球。ドンマイ。」
```                       

「ヒット数０で打席数と・犠飛・犠打数、四死球数の合計が等しい場合」例：
```
$ echo "0,3,1,1,1" | ./hitting_score
```

出力結果：
```
監督「ヒットを打ってくれ。」
```

## トラブルシューティング
プログラムが期待通りに動作しない場合、以下を確認してください：
1. Python のバージョンが 3.8 以上であるか：
   ```
   python3 --version
   ```
2. 標準入力のフォーマットが正しいか（数値以外が含まれていないか）。
3. スクリプトが実行可能になっているか：
   ```
   chmod +x hitting_score
   ```

---

## ライセンス・著作権
- このソフトウェアは [3条項BSDライセンス](https://opensource.org/licenses/BSD-3-Clause) の下で再頒布および使用が許可されています。
- **© 2024 Satoru1210**

---
