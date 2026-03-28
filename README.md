# English Game - 幼儿园英语学习游戏

一款为 5-6 岁中国幼儿园大班孩子设计的英语学习游戏。让孩子在游戏中自然接触英语，培养兴趣，而非强制学习。

## 游戏特色

- **成就感驱动** - 每关 3 星评价，正确率越高星星越多
- **短时高频** - 每局 2-3 分钟，适合幼儿注意力
- **中文辅助** - 不需要孩子有英语基础
- **TTS 发音** - 点击卡片即可听标准英语发音

## 5大学习主题

| 主题 | 词汇量 | 示例 |
|------|--------|------|
| 🎨 颜色篇 | 6词 | red, blue, green, yellow, pink, orange |
| 🔢 数字篇 | 10词 | one, two, three, four, five... |
| 🐾 动物篇 | 8词 | cat, dog, bird, fish, rabbit... |
| 🍎 食物篇 | 6词 | apple, banana, milk, water, rice, bread |
| 💪 身体篇 | 8词 | head, eyes, nose, mouth, ears, hands, legs, feet |

## 游戏模式

### 学习模式
- 3D 翻转闪卡展示单词 + 中文
- 点击卡片播放 TTS 发音
- 左右滑动切换单词

### 配对游戏
- 4×4 网格（8对卡片）
- 图片与单词拖拽配对
- 配对成功播放欢呼音效

## 技术栈

- **Flutter 3.x** - 跨平台 iOS/Android
- **flutter_tts** - 文字转语音
- **shared_preferences** - 本地进度存储
- **audioplayers** - 音效播放

## 运行方式

```bash
# 安装依赖
flutter pub get

# 运行应用
flutter run -d simulator

# 运行测试
flutter test
```

## 项目结构

```
lib/
├── main.dart                 # 入口
├── app.dart                  # 主题配置
├── screens/
│   ├── home_screen.dart      # 首页（关卡选择）
│   └── game_screen.dart       # 游戏主界面
├── widgets/
│   ├── flashcard_widget.dart  # 闪卡组件
│   ├── matching_card.dart    # 配对卡片
│   ├── star_rating.dart       # 星级评价
│   └── progress_bar.dart      # 进度条
├── models/
│   └── word_model.dart        # 单词数据模型
├── data/
│   └── words_data.dart       # 词汇数据
├── services/
│   └── audio_service.dart     # TTS 发音服务
└── utils/
    └── storage_helper.dart    # 本地进度存储

test/
├── unit/                     # 单元测试
├── widget/                   # 组件测试
└── integration/             # 集成测试
```

## 测试覆盖

- **115 个测试用例** - 全部通过
- Unit Tests - 18 个
- Widget Tests - 35 个
- Integration Tests - 58 个

## License

MIT
