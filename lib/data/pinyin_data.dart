import '../models/pinyin_model.dart';

/// 声母数据 (23个)
const List<PinyinModel> initialsData = [
  // 玻组
  PinyinModel(id: 'i_b', pinyin: 'b', chinese: '玻', emoji: '🔵', category: 'initials', group: '玻组'),
  PinyinModel(id: 'i_p', pinyin: 'p', chinese: '坡', emoji: '🟣', category: 'initials', group: '玻组'),
  PinyinModel(id: 'i_m', pinyin: 'm', chinese: '摸', emoji: '🟠', category: 'initials', group: '玻组'),
  PinyinModel(id: 'i_f', pinyin: 'f', chinese: '佛', emoji: '🟤', category: 'initials', group: '玻组'),
  // 得组
  PinyinModel(id: 'i_d', pinyin: 'd', chinese: '得', emoji: '🔴', category: 'initials', group: '得组'),
  PinyinModel(id: 'i_t', pinyin: 't', chinese: '特', emoji: '🟢', category: 'initials', group: '得组'),
  PinyinModel(id: 'i_n', pinyin: 'n', chinese: '讷', emoji: '🔵', category: 'initials', group: '得组'),
  PinyinModel(id: 'i_l', pinyin: 'l', chinese: '勒', emoji: '🟣', category: 'initials', group: '得组'),
  // 哥组
  PinyinModel(id: 'i_g', pinyin: 'g', chinese: '哥', emoji: '🟢', category: 'initials', group: '哥组'),
  PinyinModel(id: 'i_k', pinyin: 'k', chinese: '科', emoji: '🔵', category: 'initials', group: '哥组'),
  PinyinModel(id: 'i_h', pinyin: 'h', chinese: '喝', emoji: '🟡', category: 'initials', group: '哥组'),
  // 基组
  PinyinModel(id: 'i_j', pinyin: 'j', chinese: '基', emoji: '🟠', category: 'initials', group: '基组'),
  PinyinModel(id: 'i_q', pinyin: 'q', chinese: '欺', emoji: '🔴', category: 'initials', group: '基组'),
  PinyinModel(id: 'i_x', pinyin: 'x', chinese: '希', emoji: '🟣', category: 'initials', group: '基组'),
  // 知组
  PinyinModel(id: 'i_zh', pinyin: 'zh', chinese: '知', emoji: '🟢', category: 'initials', group: '知组'),
  PinyinModel(id: 'i_ch', pinyin: 'ch', chinese: '蚩', emoji: '🔵', category: 'initials', group: '知组'),
  PinyinModel(id: 'i_sh', pinyin: 'sh', chinese: '诗', emoji: '🟡', category: 'initials', group: '知组'),
  PinyinModel(id: 'i_r', pinyin: 'r', chinese: '日', emoji: '🟤', category: 'initials', group: '知组'),
  // 资组
  PinyinModel(id: 'i_z', pinyin: 'z', chinese: '资', emoji: '🔴', category: 'initials', group: '资组'),
  PinyinModel(id: 'i_c', pinyin: 'c', chinese: '雌', emoji: '🟢', category: 'initials', group: '资组'),
  PinyinModel(id: 'i_s', pinyin: 's', chinese: '思', emoji: '🟣', category: 'initials', group: '资组'),
  // 野组
  PinyinModel(id: 'i_y', pinyin: 'y', chinese: '医', emoji: '🟠', category: 'initials', group: '野组'),
  PinyinModel(id: 'i_w', pinyin: 'w', chinese: '巫', emoji: '🔵', category: 'initials', group: '野组'),
];

/// 韵母数据 (20个)
const List<PinyinModel> finalsData = [
  // 单韵母 (6个)
  PinyinModel(id: 'f_a', pinyin: 'a', chinese: '啊', emoji: '🅰️', category: 'finals', group: '单韵母'),
  PinyinModel(id: 'f_o', pinyin: 'o', chinese: '喔', emoji: '🅾️', category: 'finals', group: '单韵母'),
  PinyinModel(id: 'f_e', pinyin: 'e', chinese: '鹅', emoji: '🅴️', category: 'finals', group: '单韵母'),
  PinyinModel(id: 'f_i', pinyin: 'i', chinese: '衣', emoji: '🅸️', category: 'finals', group: '单韵母'),
  PinyinModel(id: 'f_u', pinyin: 'u', chinese: '乌', emoji: '🅺️', category: 'finals', group: '单韵母'),
  PinyinModel(id: 'f_v', pinyin: 'ü', chinese: '迂', emoji: '🆅️', category: 'finals', group: '单韵母'),
  // 复韵母 (9个)
  PinyinModel(id: 'f_ai', pinyin: 'ai', chinese: '爱', emoji: '✖️', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ei', pinyin: 'ei', chinese: '诶', emoji: '8️⃣', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ui', pinyin: 'ui', chinese: '威', emoji: '〰️', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ao', pinyin: 'ao', chinese: '奥', emoji: '🐲', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ou', pinyin: 'ou', chinese: '欧', emoji: '🥯', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_iu', pinyin: 'iu', chinese: '优', emoji: '🏂', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ie', pinyin: 'ie', chinese: '耶', emoji: '🌿', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_ve', pinyin: 'üe', chinese: '约', emoji: '🌙', category: 'finals', group: '复韵母'),
  PinyinModel(id: 'f_er', pinyin: 'er', chinese: '耳', emoji: '👂', category: 'finals', group: '复韵母'),
  // 鼻韵母 (5个)
  PinyinModel(id: 'f_an', pinyin: 'an', chinese: '安', emoji: '🏠', category: 'finals', group: '鼻韵母'),
  PinyinModel(id: 'f_en', pinyin: 'en', chinese: '恩', emoji: '💡', category: 'finals', group: '鼻韵母'),
  PinyinModel(id: 'f_in', pinyin: 'in', chinese: '音', emoji: '🎵', category: 'finals', group: '鼻韵母'),
  PinyinModel(id: 'f_un', pinyin: 'un', chinese: '温', emoji: '🌤️', category: 'finals', group: '鼻韵母'),
  PinyinModel(id: 'f_vn', pinyin: 'ün', chinese: '晕', emoji: '🌈', category: 'finals', group: '鼻韵母'),
];

/// 整体认读音节 (16个)
const List<PinyinModel> wholesData = [
  PinyinModel(id: 'w_zhi', pinyin: 'zhi', chinese: '知', emoji: '🧠', category: 'wholes'),
  PinyinModel(id: 'w_chi', pinyin: 'chi', chinese: '吃', emoji: '🍽️', category: 'wholes'),
  PinyinModel(id: 'w_shi', pinyin: 'shi', chinese: '师', emoji: '👩‍🏫', category: 'wholes'),
  PinyinModel(id: 'w_ri', pinyin: 'ri', chinese: '日', emoji: '☀️', category: 'wholes'),
  PinyinModel(id: 'w_zi', pinyin: 'zi', chinese: '字', emoji: '🔤', category: 'wholes'),
  PinyinModel(id: 'w_ci', pinyin: 'ci', chinese: '次', emoji: '🔢', category: 'wholes'),
  PinyinModel(id: 'w_si', pinyin: 'si', chinese: '四', emoji: '4️⃣', category: 'wholes'),
  PinyinModel(id: 'w_yi', pinyin: 'yi', chinese: '衣', emoji: '👔', category: 'wholes'),
  PinyinModel(id: 'w_wu', pinyin: 'wu', chinese: '屋', emoji: '🏠', category: 'wholes'),
  PinyinModel(id: 'w_yu', pinyin: 'yu', chinese: '鱼', emoji: '🐟', category: 'wholes'),
  PinyinModel(id: 'w_ye', pinyin: 'ye', chinese: '爷', emoji: '👴', category: 'wholes'),
  PinyinModel(id: 'w_yue', pinyin: 'yue', chinese: '月', emoji: '🌙', category: 'wholes'),
  PinyinModel(id: 'w_yuan', pinyin: 'yuan', chinese: '元', emoji: '💰', category: 'wholes'),
  PinyinModel(id: 'w_yin', pinyin: 'yin', chinese: '银', emoji: '🪙', category: 'wholes'),
  PinyinModel(id: 'w_yun', pinyin: 'yun', chinese: '云', emoji: '☁️', category: 'wholes'),
  PinyinModel(id: 'w_ying', pinyin: 'ying', chinese: '樱', emoji: '🌸', category: 'wholes'),
];

/// 四声数据 (24个组合)
const List<PinyinModel> tonesData = [
  // a的四声
  PinyinModel(id: 't_a1', pinyin: 'ā', chinese: '啊（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_a2', pinyin: 'á', chinese: '啊（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_a3', pinyin: 'ǎ', chinese: '啊（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_a4', pinyin: 'à', chinese: '啊（四声）', emoji: '↘️', category: 'tones', tone: '4'),
  // o的四声
  PinyinModel(id: 't_o1', pinyin: 'ō', chinese: '喔（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_o2', pinyin: 'ó', chinese: '喔（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_o3', pinyin: 'ǒ', chinese: '喔（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_o4', pinyin: 'ò', chinese: '喔（四声）', emoji: '↘️', category: 'tones', tone: '4'),
  // e的四声
  PinyinModel(id: 't_e1', pinyin: 'ē', chinese: '鹅（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_e2', pinyin: 'é', chinese: '鹅（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_e3', pinyin: 'ě', chinese: '鹅（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_e4', pinyin: 'è', chinese: '鹅（四声）', emoji: '↘️', category: 'tones', tone: '4'),
  // i的四声
  PinyinModel(id: 't_i1', pinyin: 'ī', chinese: '衣（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_i2', pinyin: 'í', chinese: '衣（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_i3', pinyin: 'ǐ', chinese: '衣（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_i4', pinyin: 'ì', chinese: '衣（四声）', emoji: '↘️', category: 'tones', tone: '4'),
  // u的四声
  PinyinModel(id: 't_u1', pinyin: 'ū', chinese: '乌（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_u2', pinyin: 'ú', chinese: '乌（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_u3', pinyin: 'ǔ', chinese: '乌（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_u4', pinyin: 'ù', chinese: '乌（四声）', emoji: '↘️', category: 'tones', tone: '4'),
  // ü的四声
  PinyinModel(id: 't_v1', pinyin: 'ǖ', chinese: '迂（一声）', emoji: '🔺', category: 'tones', tone: '1'),
  PinyinModel(id: 't_v2', pinyin: 'ǘ', chinese: '迂（二声）', emoji: '↗️', category: 'tones', tone: '2'),
  PinyinModel(id: 't_v3', pinyin: 'ǚ', chinese: '迂（三声）', emoji: '↘️', category: 'tones', tone: '3'),
  PinyinModel(id: 't_v4', pinyin: 'ǜ', chinese: '迂（四声）', emoji: '↘️', category: 'tones', tone: '4'),
];

/// 获取所有拼音数据
Map<String, List<PinyinModel>> getAllPinyin() => {
      'initials': initialsData,
      'finals': finalsData,
      'wholes': wholesData,
      'tones': tonesData,
    };

/// 获取拼音主题名称（中文）
String getPinyinCategoryName(String category) {
  switch (category) {
    case 'initials':
      return '声母篇';
    case 'finals':
      return '韵母篇';
    case 'wholes':
      return '整体认读音节';
    case 'tones':
      return '单韵母四声';
    default:
      return category;
  }
}

/// 获取拼音主题emoji
String getPinyinCategoryEmoji(String category) {
  switch (category) {
    case 'initials':
      return '🔤';
    case 'finals':
      return '📝';
    case 'wholes':
      return '📖';
    case 'tones':
      return '🎵';
    default:
      return '📚';
  }
}

/// 获取语文模块名称
String getChineseModuleName() => '语文篇';

/// 获取语文模块emoji
String getChineseModuleEmoji() => '🇨🇳';

/// 语文模块的子类别
List<String> getChineseSubCategories() => ['initials', 'finals', 'wholes', 'tones'];
