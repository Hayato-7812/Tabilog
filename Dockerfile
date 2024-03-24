FROM ruby:3.2.0

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y build-essential curl git gnupg libpq-dev libsqlite3-dev wget vim nodejs python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Node.jsのインストール
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# npmのインストール
RUN npm install -g yarn

# Pythonのライブラリパスを設定
ENV LD_LIBRARY_PATH=/usr/lib/python3/dist-packages
RUN pip install poetry

# アプリケーション用のディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockを追加してGemをインストール
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# アプリケーションのファイルを追加
ADD . /myapp

# Git関連の設定
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash && \
    chmod a+x ~/.git-completion.bash && \
    echo "source ~/.git-completion.bash" >> ~/.bashrc && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh && \
    chmod a+x ~/.git-prompt.sh && \
    echo "source ~/.git-prompt.sh" >> ~/.bashrc && \
    echo "export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]\$(__git_ps1)\[\033[00m\] \$ '" >> ~/.bashrc && \
    git config --global core.editor vim
