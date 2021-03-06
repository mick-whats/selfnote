# Lodash Documentation https://lodash.com/docs/4.17.4

{assert} = require 'chai'
_ = require 'lodash'
OK = assert.isOk
NG = assert.isNotOk
Equal = assert.equal

describe "Lodash test", ->
  it "Arrayから重複を取り除く", ->
    arr = [4,2,3,2,3,1]
    arr2 = [1,2,3,88]
    assert.deepEqual _.uniq(arr),[4,2,3,1]
    assert.deepEqual _.union(arr,arr2),[4,2,3,1,88],'unionは複数の配列に対応する'
    assert.deepEqual _.sortedUniq(arr),[4,2,3,2,3,1],'ソートもuniqもできてない意味わからん'
  it "objectから抽出して重複を取り除く", ->
    arr = [
      {a:4}
      {a:2}
      {a:3}
      {a:1}
      {a:2}
      {a:3}
      {x:3}
    ]
    # 普通のmap
    assert.deepEqual [ 4, 2, 3, 1, 2, 3, undefined ],arr.map (o)-> o.a,
    # _.uniqでラップする
    assert.deepEqual [ 4, 2, 3, 1, undefined ],_.uniq arr.map (o)-> o.a
    # さらに_.compactでラップする
    assert.deepEqual [ 4, 2, 3, 1],_.compact _.uniq arr.map (o)-> o.a

  it "二次元配列のsortをする方法", ->
    ###
    sortはorderByを使う(sortByはasc,descを指定できない)

    公式DocumentではObjectが並んだ配列が例に上がっているが、ObjectでなくArrayの場合はどうするのか。
    Objectではkeyを指定する。Arrayは添字がkeyになるのでそれを使う。それだけ。
    ###
    arr = [
      [5,1]
      [3,1]
      [4,1]
      [2,1]
      [1,1]
    ]
    assert.deepEqual _.orderBy(arr,[0],['asc']), [ [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 5, 1 ] ]
