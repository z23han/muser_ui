import 'dart:collection';
import 'package:muser_ui/models/story_post.dart';
// import 'package:intl/intl.dart';

class PostManager {
  static HashMap<int, List<StoryPost>> _allStoryPostMap = HashMap();

  PostManager() {
    _populateStoryPostMap();
  }

  void _populateStoryPostMap() {
    StoryPost post_00 = StoryPost(
        username: '慕斯小助手',
        tag: '慕斯动态',
        themeId: 0,
        postContent: '音悦在一起，武汉项目启动',
        postImage: 'post_image_nike.png',
        postDateTime: '2020-07-02T22:02');
    StoryPost post_01 = StoryPost(
        username: '慕斯小助手',
        tag: '慕斯动态',
        themeId: 0,
        postContent: '慕斯故事功能正在测试中，启用后将能够看到更多 #慕斯动态 主题的故事，敬请期待！',
        postImage: 'post_image.png',
        postDateTime: '2020-07-02T22:00');
    StoryPost post_10 = StoryPost(
        username: '慕斯小助手',
        tag: '慕斯动态',
        themeId: 1,
        postContent: '慕斯故事功能正在测试中，启用后将能够看到更多 #音乐与健康 主题的故事，敬请期待！',
        postImage: 'post_image.png',
        postDateTime: '2020-07-02T22:00');
    StoryPost post_20 = StoryPost(
        username: '慕斯小助手',
        tag: '慕斯动态',
        themeId: 2,
        postContent: '慕斯故事功能正在测试中，启用后将能够看到更多 #志愿者 主题的故事，敬请期待！',
        postImage: 'post_image.png',
        postDateTime: '2020-07-02T22:00');
    StoryPost post_30 = StoryPost(
        username: '慕斯小助手',
        tag: '慕斯动态',
        themeId: 3,
        postContent: '慕斯故事功能正在测试中，启用后将能够看到更多 #音乐治疗研究 主题的故事，敬请期待！',
        postImage: 'post_image.png',
        postDateTime: '2020-07-02T22:00');

    List<StoryPost> _postlist_0 = List();
    List<StoryPost> _postlist_1 = List();
    List<StoryPost> _postlist_2 = List();
    List<StoryPost> _postlist_3 = List();

    _postlist_0.add(post_00);
    _postlist_0.add(post_01);
    _postlist_1.add(post_10);
    _postlist_2.add(post_20);
    _postlist_3.add(post_30);

    _allStoryPostMap.putIfAbsent(0, () => _postlist_0);
    _allStoryPostMap.putIfAbsent(1, () => _postlist_1);
    _allStoryPostMap.putIfAbsent(2, () => _postlist_2);
    _allStoryPostMap.putIfAbsent(3, () => _postlist_3);
  }

  List<StoryPost> getThemePost(int themeId) {
    return _allStoryPostMap[themeId];
  }

  // Future<void> _getPost() async {
  //   try {
  //     //TODO: get story post
  //     // Response res = await get('url');
  //     // Map data = jsonDecode(res.body);
  //     // username = data['username'];
  //     // tag = data['tag'];
  //     // postContent = data['postContent'];
  //     // postImage = data['postImage'];
  //     // postDateTime = _formatTime(data['postDateTime'])
  //   } catch (e) {
  //     print('caught error: $e');
  //   }
  // }
}
