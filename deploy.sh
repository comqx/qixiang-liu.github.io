
#!/bin/bash
# 部署到 github pages 脚本
# 错误时终止脚本
set -e

# 删除打包文件夹
 rm -rf content/post/golang笔记/*
rm -rf content/post/images/*
rm -rf public

# 打包。even 是主题
./mactoblog
hugo -t even # if using a theme, replace with `hugo -t <YOURTHEME>`

# 进入打包文件夹
cd public

# 添加 readme
echo '## Store Hugo HTML files <br> Blog Markdown File [https://github.com/qixiang-liu/qixiang-liu.github.io](https://github.com/qixiang-liu/qixiang-liu.github.io)' > README.md
# Add changes to git.
git init
git add -A

# Commit changes.
msg="building site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 推送到 github pages
# qixiang-liu.github.io 只能使用 master分支
# -f 强制推送
git push -f https://qixiang-liu:liu890892@github.com/qixiang-liu/qixiang-liu.github.io.git  master

# 回到原文件夹
cd ..
