# پایه: تصویر رسمی اوبونتو با پایتون نصب‌شده
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

# نصب ابزارهای سیستمی که Rasa بعضاً لازم دارد
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential git wget curl && \
    rm -rf /var/lib/apt/lists/*

# پوشهٔ کاری
WORKDIR /workspace

# copy کردن (اگر لازم بود فایل‌ها در مراحل build باشند)
COPY . /workspace

# محیط کاربر vscode استفاده می‌شود (default in devcontainer images)
USER vscode
