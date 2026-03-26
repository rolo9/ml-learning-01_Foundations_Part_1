# 機械学習学習環境  
## 固定フロー + Docker Compose

Project: **ml-learning-01_Foundations_Part_1**

---

# Step0 プロジェクト作成
```bash
mkdir ~/workspace/ml-learning-01_Foundations_Part_1
cd ~/workspace/ml-learning-01_Foundations_Part_1
git init
```

# Step1 ディレクトリ構造
ml-learning-01_Foundations_Part_1
├ notebooks
├ src
├ data
├ Makefile
├ docker-compose.yml
├ README.md
└ .gitignore

# Step2 フォルダ作成
```bash
mkdir notebooks src data
touch README.md .gitignore docker-compose.yml Makefile
```

# Step3 Sublimeでプロジェクトを開く
```bash
subl ~/workspace/ml-learning-01_Foundations_Part_1
```

# Step4 .gitignore設定
```bash
.ipynb_checkpoints
data/*
!data/.gitkeep
__pycache__
.DS_Store
```

# Step5 Dockerイメージ取得
```bash
docker pull datascientistus/ds-python-env3
```

# Step6 docker-compose.yml 作成
```yaml
services:
  jupyter:
    image: datascientistus/ds-python-env3
    platform: linux/amd64
    container_name: my-env
    ports:
      - "8888:8888"
    volumes:
      - ~/workspace/ml-learning-01_Foundations_Part_1:/work
    working_dir: /work
    tty: true
```

# Step7 Docker起動
```bash
make up
```

# Step8 Jupyterアクセス
http://localhost:8888

# Step9 Notebook実験
notebooks/01_linear_regression.ipynb

# Step10 再利用コード抽出
Notebookで書いた処理を整理する
例
	•	前処理
	•	可視化
	•	モデル処理

# Step11 Pythonモジュール化
src/preprocessing.py
src/model.py

# Step12 Notebookから呼び出し
```bash
from src.preprocessing import preprocess
```

# Step13 Git保存
```bash
git add .
git commit -m "update ML workflow"
```

# Step14 GitHub push
```bash
git push -u origin main
```

# 学習フロー
Notebook experiment
↓
Code整理
↓
src に移動
↓
Notebookからimport
↓
Git保存

---

# Docker操作 (Makefile)

起動

```bash
make up
```

停止

```bash
make down
```

再起動

```bash
make restart
```

ログ確認

```bash
make logs
```

Jupyter Notebook を開く

```bash
make notebook
```

