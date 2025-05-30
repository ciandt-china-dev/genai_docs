## ClassDef CharactorNet
**CharactorNet**: CharactorNetの機能は、畳み込みニューラルネットワークを使用して、入力データを分類することです。

**attributes**: このクラスの属性。
· n_class: 分類するクラスの数を指定します。
· n_convs: 各層で使用する畳み込みの数を指定するリスト。
· n_channels: 各層で使用するチャネル数を指定するリスト。

**Code Description**: このクラスの説明。
CharactorNetは、PyTorchのnn.Moduleを継承しており、畳み込みニューラルネットワークを構築するためのクラスです。このネットワークは、入力画像を受け取り、指定されたクラス数に基づいて分類を行います。

初期化メソッド`__init__`では、ネットワークの層を定義します。最初に、入力チャネル数1と初期チャネル数42を持つ畳み込み層を設定し、ReLU活性化関数とバッチ正規化を適用します。その後、`n_convs`と`n_channels`のリストに基づいて、追加の畳み込み層を構築します。各層は、1x1の畳み込み、ReLU、3x3の深層畳み込み、ReLU、バッチ正規化で構成されます。層の間には、必要に応じてMaxPoolingが適用されます。最後に、全結合層`fc`が定義され、最終的な分類を行います。

`forward`メソッドでは、入力データをネットワークに通し、最終的な分類結果を返します。まず、畳み込み層を通過し、次にAdaptive Average Poolingを適用して特徴マップを1x1に縮小します。その後、全結合層を通して最終的な出力を生成します。

このクラスは、`get_classifiernet`関数によって呼び出され、指定されたクラス数に基づいてCharactorNetモデルを生成します。

**Note**: 使用時の注意点として、入力データは適切に前処理され、ネットワークの期待する形状である必要があります。また、`n_convs`と`n_channels`のリストは、ネットワークの構造を決定するため、慎重に設定する必要があります。

**Output Example**: このコードの返り値の可能な例。
CharactorNetの出力は、入力データが属するクラスの確率を示すベクトルです。例えば、3クラス分類の場合、出力は[0.1, 0.7, 0.2]のような形で、各要素が各クラスに属する確率を表します。
### FunctionDef __init__(self, n_class, n_convs, n_channels)
**__init__**: The function of __init__ is CharactorNetクラスのインスタンスを初期化することです。

**parameters**: The parameters of this Function.
- n_class: 分類するクラスの数を指定します。
- n_convs: 各層で使用する畳み込みの数をリストで指定します。デフォルトは[1, 4, 9, 1]です。
- n_channels: 各層で使用するチャネル数をリストで指定します。デフォルトは[128, 384, 1152, 3456]です。

**Code Description**: The description of this Function.
この`__init__`メソッドは、CharactorNetクラスのインスタンスを初期化するためのコンストラクタです。`super(CharactorNet, self).__init__()`を呼び出すことで、親クラスの初期化を行います。

最初に、チャネル数を42に設定し、最初の畳み込み層を構築します。この層は、入力チャネル数1、出力チャネル数42、カーネルサイズ3、ストライド1、パディング1の畳み込み層とReLU活性化関数、チャネルごとの畳み込み、再度ReLU、そしてBatch Normalizationで構成されています。

その後、`n_convs`と`n_channels`のリストに基づいて、追加の畳み込み層を構築します。各層は、1x1の畳み込み、ReLU、チャネルごとの畳み込み、再度ReLU、Batch Normalizationで構成されます。`n_convs[i]`が1より大きい場合、追加の畳み込み層がその数だけ追加されます。

各層の最後に、`n_convs`の最後の要素でない場合は、3x3のMaxPooling層が追加されます。

最終的に、`nn.Sequential`を用いて全ての層をまとめ、`self.layer`に格納します。また、最終的なチャネル数と`n_class`を用いて全結合層を構築し、`self.fc`に格納します。

**Note**: Points to note about the use of the code
- `n_convs`と`n_channels`のリストは、同じ長さである必要があります。
- 入力データは、チャネル数が1であることを前提としています。
- このネットワークは、画像分類タスクに使用されることを意図しています。
***
### FunctionDef forward(self, input)
**forward**: The function of forward is 入力データを処理し、最終的な分類結果を出力することです。

**parameters**: The parameters of this Function.
- input: ネットワークに入力されるテンソルデータ。

**Code Description**: 
この関数は、入力されたテンソルデータを処理して分類結果を出力します。まず、`self.layer`を用いて入力データを処理します。この処理は、通常、畳み込み層や他のニューラルネットワーク層を通じて特徴抽出を行うことを意味します。次に、`F.adaptive_avg_pool2d`を使用して、出力テンソルの空間的な次元を(1, 1)に縮小します。これにより、テンソルの各チャネルの平均値が計算され、出力のサイズが固定されます。その後、`x.view(x.size(0), -1)`を用いてテンソルを2次元に変換し、バッチサイズと特徴量の次元を持つ形に整形します。最後に、`self.fc`を通じて全結合層で処理し、最終的な分類結果を得ます。

**Note**: 
- 入力データは、ネットワークが期待する形状に整形されている必要があります。
- `self.layer`と`self.fc`は、事前に定義されたネットワーク層であり、適切に初期化されている必要があります。

**Output Example**: 
この関数の出力は、入力データに対する分類結果を示すテンソルです。例えば、入力が画像データであれば、出力は各クラスに対するスコアを含むベクトルとなります。
***
## FunctionDef get_classifiernet(num_class)
**get_classifiernet**: get_classifiernetの機能は、指定されたクラス数に基づいてCharactorNetモデルを生成することです。

**parameters**: この関数のパラメータ。
· num_class: 分類するクラスの数を指定します。

**Code Description**: この関数は、CharactorNetクラスのインスタンスを生成し、返します。CharactorNetは、畳み込みニューラルネットワークを使用して入力データを分類するためのモデルです。この関数は、`num_class`という引数を受け取り、それをCharactorNetのコンストラクタに渡します。これにより、指定されたクラス数に基づいてモデルが構築されます。

プロジェクト内での役割としては、`get_ocr`関数内で呼び出され、OCR処理の一部として文字認識を行うためのモデルを提供します。`get_ocr`関数は、画像ファイルリストを受け取り、各画像に対して文字認識を行います。その際に、`get_classifiernet`を使用して文字認識用のモデルを取得し、モデルの重みをロードして使用します。

**Note**: 使用時の注意点として、`num_class`は正の整数である必要があります。また、生成されたモデルは、事前に学習済みの重みをロードして使用することが一般的です。

**Output Example**: この関数の返り値は、CharactorNetのインスタンスです。例えば、3クラス分類の場合、`get_classifiernet(3)`は、3つのクラスに分類するためのCharactorNetモデルを返します。
