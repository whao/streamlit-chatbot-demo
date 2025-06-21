# Streamlit Chatbot Demo

一个基于 Streamlit 和 OpenAI API 构建的简单聊天机器人 web 应用，类似于 ChatGPT 的交互界面。

## 功能特点

- 🤖 集成 OpenAI GPT-4o-mini 模型
- 💬 实时流式对话响应
- 🎨 简洁美观的 Streamlit 界面
- 📱 响应式设计，支持多设备访问
- 💾 会话历史记录保持
- 🌐 支持中文对话

## 项目结构

```text
streamlit-chatbot-demo/
├── app.py              # 主应用程序文件
├── Dockerfile          # Docker 容器化配置
├── docker-compose.yml  # Docker Compose 配置
├── .env.example        # 环境变量示例文件
├── pyproject.toml      # 项目配置和依赖管理
├── uv.lock            # 依赖锁定文件
└── README.md          # 项目说明文档
```

## 技术栈

- **前端框架**: Streamlit 1.46.0+
- **AI 模型**: OpenAI GPT-4o-mini
- **Python**: 3.13+
- **包管理**: uv
- **容器化**: Docker

## 安装与运行

### 前置要求

- Python 3.13 或更高版本 (本地运行)
- Docker (容器化运行)
- OpenAI API 密钥

### 方式一：本地运行

#### 1. 克隆项目

```bash
git clone <repository-url>
cd streamlit-chatbot-demo
```

#### 2. 安装依赖

使用 uv（推荐）:

```bash
uv sync
或使用 pip:

```bash
pip install streamlit openai
```

#### 3. 设置环境变量

复制环境变量示例文件并配置：

```bash
# 复制示例文件
cp .env.example .env

# 编辑 .env 文件，设置您的 OpenAI API 密钥
# OPENAI_API_KEY=your-openai-api-key-here
```

或直接设置环境变量：

```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

#### 4. 运行应用

```bash
# 使用 uv
uv run streamlit run app.py

# 或使用 streamlit 直接运行
streamlit run app.py
```

应用将在 `http://localhost:8501` 启动。

### 方式二：Docker 容器化运行 🐳

#### 1. 获取项目代码

```bash
git clone <repository-url>
cd streamlit-chatbot-demo
```

#### 2. 构建 Docker 镜像

```bash
docker build -t streamlit-chatbot-demo .
```

#### 3. 运行容器

```bash
# 基本运行（需要在运行时设置环境变量）
docker run -p 8501:8501 \
  -e OPENAI_API_KEY="your-openai-api-key-here" \
  streamlit-chatbot-demo

# 后台运行
docker run -d -p 8501:8501 \
  -e OPENAI_API_KEY="your-openai-api-key-here" \
  --name chatbot \
  streamlit-chatbot-demo

# 使用环境变量文件
docker run -p 8501:8501 \
  --env-file .env \
  streamlit-chatbot-demo
```

#### 4. 停止容器

```bash
# 停止后台运行的容器
docker stop chatbot

# 删除容器
docker rm chatbot
```

### 方式三：Docker Compose（推荐用于开发）

创建 `docker-compose.yml` 文件：

```yaml
version: '3.8'
services:
  chatbot:
    build: .
    ports:
      - "8501:8501"
    environment:
      - OPENAI_API_KEY=${OPENAI_API_KEY}
    # 或者使用环境变量文件
    # env_file:
    #   - .env
```

运行：

```bash
# 启动服务
docker-compose up

# 后台启动
docker-compose up -d

# 停止服务
docker-compose down
```

## 使用说明

1. 打开浏览器访问应用地址
2. 在底部输入框中输入您的问题
3. 按回车键或点击发送按钮
4. AI 助手将实时回复您的问题
5. 对话历史会在会话期间保持

## 配置说明

### 模型配置

默认使用 `gpt-4o-mini` 模型，您可以在 `app.py` 中修改：

```python
st.session_state["openai_model"] = "gpt-4o-mini"  # 可改为其他模型
```

### 界面自定义

- 修改 `st.title()` 来更改应用标题
- 调整 `st.chat_input()` 的提示文字
- 通过 Streamlit 配置文件自定义主题

## 开发

### 项目依赖

主要依赖包：

- `streamlit>=1.46.0` - Web 应用框架
- `openai>=1.90.0` - OpenAI API 客户端

### 代码结构

- **会话状态管理**: 使用 `st.session_state` 保持对话历史
- **流式响应**: 利用 OpenAI 的 streaming API 实现实时回复
- **消息渲染**: 使用 `st.chat_message()` 组件展示对话

## 注意事项

⚠️ **API 密钥安全**: 请确保不要将 OpenAI API 密钥提交到版本控制系统中

⚠️ **费用控制**: OpenAI API 按使用量计费，请注意监控使用情况

⚠️ **网络要求**: 需要稳定的网络连接以访问 OpenAI API

## 故障排除

### 常见问题

#### 本地运行问题

1. **API 密钥错误**
   - 检查环境变量是否正确设置
   - 验证 API 密钥是否有效

2. **依赖安装失败**
   - 确保 Python 版本 >= 3.13
   - 尝试更新 pip: `pip install --upgrade pip`

3. **应用无法启动**
   - 检查端口 8501 是否被占用
   - 尝试指定其他端口: `streamlit run app.py --server.port 8502`

#### Docker 运行问题

1. **容器无法访问**
   - 确保端口映射正确: `-p 8501:8501`
   - 检查防火墙设置

2. **环境变量未生效**
   - 确保 API 密钥正确传递给容器
   - 使用 `docker exec -it <container-name> env` 检查环境变量

3. **镜像构建失败**
   - 确保 Dockerfile 和相关文件存在
   - 检查网络连接（下载依赖时需要）

4. **容器启动失败**
   - 查看容器日志: `docker logs <container-name>`
   - 检查 uv.lock 文件是否存在

## 许可证

本项目基于 MIT 许可证开源。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

---

Happy Chatting! 🚀