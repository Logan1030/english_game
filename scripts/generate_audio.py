#!/usr/bin/env python3
"""
英语学习游戏 - 音频生成脚本
使用 edge-tts (Microsoft) 生成儿童友好的英语单词发音

安装依赖:
    pip install edge-tts

运行:
    python scripts/generate_audio.py
"""

import asyncio
import os
from pathlib import Path
import edge_tts

# 所有词汇数据
VOCABULARY = {
    'colors': {
        'name': '颜色篇',
        'words': ['red', 'blue', 'green', 'yellow', 'pink', 'orange', 'purple', 'brown', 'black', 'white', 'gray', 'gold']
    },
    'numbers': {
        'name': '数字篇',
        'words': ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'twenty', 'hundred', 'zero']
    },
    'animals': {
        'name': '动物篇',
        'words': ['cat', 'dog', 'bird', 'fish', 'rabbit', 'bear', 'lion', 'monkey', 'elephant', 'tiger', 'panda', 'frog', 'duck', 'pig', 'cow']
    },
    'foods': {
        'name': '食物篇',
        'words': ['apple', 'banana', 'milk', 'water', 'rice', 'bread', 'egg', 'cake', 'orange', 'grape', 'carrot', 'chicken', 'pizza', 'cookie', 'ice cream']
    },
    'body': {
        'name': '身体篇',
        'words': ['head', 'eyes', 'nose', 'mouth', 'ears', 'hands', 'legs', 'feet', 'finger', 'toe', 'arm', 'knee']
    },
    'clothes': {
        'name': '衣服篇',
        'words': ['shirt', 'dress', 'pants', 'shoes', 'hat', 'socks', 'coat', 'skirt', 'gloves', 'scarf']
    },
    'vehicles': {
        'name': '交通工具',
        'words': ['car', 'bus', 'bike', 'train', 'plane', 'boat', 'taxi', 'truck', 'ship', 'motorcycle']
    },
    'nature': {
        'name': '自然篇',
        'words': ['sun', 'moon', 'star', 'tree', 'flower', 'bird', 'cloud', 'rain', 'snow', 'mountain']
    },
    'family': {
        'name': '家庭篇',
        'words': ['mom', 'dad', 'baby', 'brother', 'sister', 'grandma', 'grandpa', 'friend']
    },
    'emotions': {
        'name': '表情篇',
        'words': ['happy', 'sad', 'angry', 'surprised', 'scared', 'tired', 'hungry', 'love']
    },
    'actions': {
        'name': '动作篇',
        'words': ['run', 'jump', 'eat', 'drink', 'sleep', 'play', 'sing', 'dance', 'read', 'write', 'swim', 'draw']
    },
    'shapes': {
        'name': '形状篇',
        'words': ['circle', 'square', 'triangle', 'heart', 'star', 'diamond', 'rectangle', 'oval']
    },
    'time': {
        'name': '时间篇',
        'words': ['day', 'night', 'morning', 'today', 'tomorrow', 'yesterday']
    }
}

# 儿童友好的英语语音 (Microsoft Azure)
# 推荐: en-US-AriaNeural (活泼女声), en-US-GuyNeural (男声), en-GB-SoniaNeural (英式女声)
VOICE = "en-US-AriaNeural"


async def generate_word(category: str, word: str, output_dir: Path) -> tuple:
    """生成单个单词的音频"""
    safe_word = word.replace(' ', '_')
    output_path = output_dir / category / f"{safe_word}.mp3"

    # 跳过已存在的文件
    if output_path.exists() and output_path.stat().st_size > 0:
        return (word, category, 'skipped', None)

    try:
        # 生成音频
        communicate = edge_tts.Communicate(word, VOICE)
        await communicate.save(str(output_path))

        # 验证文件
        if output_path.exists() and output_path.stat().st_size > 0:
            return (word, category, 'success', None)
        else:
            return (word, category, 'failed', 'File empty or not created')
    except Exception as e:
        return (word, category, 'failed', str(e))


async def generate_all():
    """生成所有音频文件"""
    base_dir = Path(__file__).parent.parent / 'assets' / 'sounds' / 'english'

    # 创建目录结构
    for category in VOCABULARY.keys():
        (base_dir / category).mkdir(parents=True, exist_ok=True)

    print(f"输出目录: {base_dir}")
    print(f"使用语音: {VOICE}")
    print(f"开始生成音频文件...\n")

    total_words = sum(len(v['words']) for v in VOCABULARY.values())
    generated = 0
    skipped = 0
    failed = 0
    failed_list = []

    for category, data in VOCABULARY.items():
        print(f"处理 {data['name']} ({category})...")

        for word in data['words']:
            result_word, result_cat, status, error = await generate_word(category, word, base_dir)

            if status == 'success':
                print(f"  ✓ {result_word}")
                generated += 1
            elif status == 'skipped':
                print(f"  - {result_word} (已存在)")
                skipped += 1
            else:
                print(f"  ✗ {result_word}: {error}")
                failed += 1
                failed_list.append((result_word, result_cat, error))

        print()  # 空行分隔

    print("=" * 50)
    print(f"完成!")
    print(f"  生成: {generated} 个")
    print(f"  跳过: {skipped} 个")
    print(f"  失败: {failed} 个")

    if failed_list:
        print(f"\n失败列表:")
        for word, cat, err in failed_list:
            print(f"  - {cat}/{word}: {err}")

    print(f"\n音频文件位置: {base_dir}")


def main():
    asyncio.run(generate_all())


if __name__ == '__main__':
    main()
