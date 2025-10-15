#!/usr/bin/env bash
set -e

# در صورت نیاز virtualenv بساز و فعال کن
python -m venv .venv
source .venv/bin/activate

# آپدیت pip و نصب وابستگی‌ها
python -m pip install --upgrade pip setuptools wheel

# اگر requirements.txt در رپو هست آن را نصب کن
if [ -f "/workspace/requirements.txt" ]; then
  pip install -r /workspace/requirements.txt
else
  # نصب پایهٔ Rasa و Rasa SDK (در صورت نیاز میتونی ورژن مشخص بدی)
  pip install --upgrade rasa rasa-sdk
fi

# اجازه اجرا به اسکریپت‌ها
chmod +x /workspace/.devcontainer/*.sh || true

echo "Post-create finished. Activate venv with: source .venv/bin/activate"
