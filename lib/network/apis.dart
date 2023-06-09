abstract class Apis {
  /// Method [GET]
  /// 以游客身份登录
  static const register_anonymous = 'register/anonimous';

  /// Method [GET]
  ///说明 : 调用此接口 , 传入搜索关键词可以搜索该音乐 / 专辑 / 歌手 / 歌单 / 用户 ,
  ///关键词可以多个 , 以空格隔开 , 如 " 周杰伦 搁浅 "( 不需要登录 ),
  ///可通过 /song/url 接口传入歌曲 id 获取具体的播放链接
  ///
  /// 必选参数 : keywords : 关键词
  ///
  /// 可选参数 : limit : 返回数量 , 默认为 30
  /// offset : 偏移数量，用于分页 ,
  /// 如 : 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
  ///
  /// type: 搜索类型；默认为 1 即单曲 ,
  /// 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频, 1018:综合, 2000:声音(搜索声音返回字段格式会不一样)
  static const search = 'search';

  /// Method [GET]
  /// 必选参数 : id : 音乐 id (多个id用逗号隔开)
  ///
  /// 可选参数 : br: 码率,默认设置了 999000 即最大码率,如果要 320k 则可设置为 320000,其他类推
  static const song_url = 'song/url';
}
