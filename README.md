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
├── pyproject.toml      # 项目配置和依赖管理
├── uv.lock            # 依赖锁定文件
└── README.md          # 项目说明文档
```

## 技术栈

- **前端框架**: Streamlit 1.46.0+
- **AI 模型**: OpenAI GPT-4o-mini
- **Python**: 3.13+
- **包管理**: uv

## 安装与运行

### 前置要求

- Python 3.13 或更高版本
- OpenAI API 密钥

### 1. 克隆项目

```bash
git clone <repository-url>
cd streamlit-chatbot-demo
```

### 2. 安装依赖

使用 uv（推荐）:

```bash
uv sync
```

或使用 pip:

```bash
pip install streamlit openai
```

### 3. 设置环境变量

创建 `.env` 文件或设置环境变量：

```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

### 4. 运行应用

```bash
streamlit run app.py
```

应用将在 `http://localhost:8501` 启动。

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

1. **API 密钥错误**
   - 检查环境变量是否正确设置
   - 验证 API 密钥是否有效

2. **依赖安装失败**
   - 确保 Python 版本 >= 3.13
   - 尝试更新 pip: `pip install --upgrade pip`

3. **应用无法启动**
   - 检查端口 8501 是否被占用
   - 尝试指定其他端口: `streamlit run app.py --server.port 8502`

## 许可证

本项目基于 MIT 许可证开源。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

---

Happy Chatting! 🚀