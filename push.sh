#!/bin/bash

echo "📦 开始推送 weight-tool 项目..."

# 添加所有变更
git add .

# 如果有变更则提交
if git diff --staged --quiet; then
    echo "✅ 没有变更需要提交"
else
    read -p "📝 请输入提交信息（直接回车使用默认信息）: " msg
    if [ -z "$msg" ]; then
        msg="update: $(date '+%Y-%m-%d %H:%M')"
    fi
    git commit -m "$msg"
fi

# 推送
echo "🚀 正在推送到 GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ 推送成功！"
else
    echo "❌ 推送失败，请检查网络或 Token"
fi
