# 打率計算ツール・防御率計算ツール
[![test](https://github.com/Satoru1210/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/Satoru1210/robosys2024/actions/workflows/test.yml)

## 概要
`hitting_score`は、標準入力から試合データを受け取り、打率を計算して出力するコマンドラインツールです。

`pitching_score`は、標準入力から試合データを受け取り、防御率を計算して出力するコマンドラインツールです。
## 機能
- 標準入力のデータをもとにhitting_scoreでは打率を、pitching_scoreでは防御率を出力。

## 動作環境・使用ソフトウェア
- このツールは Python で実装されており、以下の環境で動作確認済み：
  - Ubuntu 22.04
  - Python 3.7 ~ 3.12
---

## リポジトリのクローン方法
GitHub リポジトリからクローンします。

```
$ git clone git@github.com:Satoru1210/robosys2024.git
```

GitHub アカウントがない場合は HTTPS を使用：
```
$ git clone https://github.com/Satoru1210/robosys2024.git
```


---

## 使用方法

## 打率計算ツール
### hitting_scoreスクリプトを実行可能にします：
```
$ cd robosys2024
$ chmod +x hitting_score
```

### 標準入力を使用
通常入力例：
下記のように左から"打席数 安打数 犠打・犠飛数 四球数 死球数"の順で空白区切りで試合データを入力します。
```
$ echo "5 3 1 1 0" | ./hitting_score
```

出力結果：
下記のようにその打者の打率が出力されます。
```
1.000
```

---
## 防御率計算ツール
### pitching_scoreスクリプトを実行可能にします：
```
$ cd robosys2024
$ chmod +x pitching_score
```

### 標準入力を使用
通常入力例：
下記のように左から"登板回数 自責点 登板回数の端数(1/3なら1、2/3なら2、0/3なら0)"の順で空白区切りで試合データを入力します。
```
$ echo "9,1,1" | ./pitching_score
```

出力結果：
下記のようにその投手の防御率が出力されます。
```
0.964
```

## トラブルシューティング
プログラムが期待通りに動作しない場合、以下を確認してください：
1. Python のバージョンが 3.7 以上であるか：
   ```
   python3 --version
   ```
2. 標準入力のフォーマットが正しいか（数値以外が含まれていないか）。
3. スクリプトが実行可能になっているか：
   ```
   chmod +x hitting_score
   ```
   ```
   chmod +x pitching_score
   ```
---

## ライセンス・著作権
- このソフトウェアは [3条項BSDライセンス](https://opensource.org/licenses/BSD-3-Clause) の下で再頒布および使用が許可されています。
- **© 2024 Satoru1210**

---
