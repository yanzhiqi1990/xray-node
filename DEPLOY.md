# Xray VLESS+WS+TLS 一键部署包（Render 免费免卡）

- UUID: e974e5e0-fd9e-41de-8ce0-238ad038f222
- WS 路径: /86e7d17b
- 容器读取环境变量 PORT / UUID / WS_PATH，TLS 由平台(或Caddy)终止

## Render 部署
1. 新建 GitHub 仓库，把本文件夹上传上去（网页拖拽即可）。
2. render.com → New + → Blueprint → 选该仓库 → Apply（自动读 render.yaml）。
   或 New + → Web Service → 选仓库 → Runtime=Docker → Plan=Free → 环境变量 UUID / WS_PATH（PORT 平台自动注入）。
3. 构建完成得到 https://xxxx.onrender.com （这就是节点域名）。

## 拿到域名后
把域名发出来做拨测 + 生成 Clash 二维码。