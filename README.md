> api 是我用Github上NeteaseCloudMusicApi项目搭建的 https://github.com/Binaryify/NeteaseCloudMusicApi
---
> 项目地址 https://github.com/Astra1427/flutter_cloud_music_lite

先看一下效果

<img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/99b11194f9224b6e965a31eaedc37cce~tplv-k3u1fbpfcp-watermark.image?" alt="" width="50%" />

### 1、框架
-  `GetX` 状态管理、路由管理、国际化
-  `dio` 网络请求
-  `hive` 数据存储

### 2、目录结构
<img src="https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8017e6d51dea464cb3936b8144cf40da~tplv-k3u1fbpfcp-watermark.image?" alt="" width="50%" />

-   `app` 一些通用的类及样式
-   `services` 提供数据存储等服务
-   `network` 请求的封装
-   `generated` 生成的国际化文件,使用 `get generate locales assets/locales`生成
-   `pages` 模块，每个会有三个文件，view、controller 以及binding
-   `widgets` 自定义的小组件
-   `routes` 路由定义
-   `models` 实体类
---
> 这里再贴一下一位大佬用GetX写的博客园项目，我写的时候很多地方都参考了这个项目。
> https://github.com/xiaoyaocz/flutter_cnblogs
