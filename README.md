# Goshop2

[![GitHub stars](https://img.shields.io/github/stars/pzhgugu/goshop2?style=social)](https://github.com/pzhgugu/goshop2/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/pzhgugu/goshop2?style=social)](https://github.com/pzhgugu/goshop2/forks)
[![Java](https://img.shields.io/badge/Java-7-blue.svg)](pom.xml)
[![Dubbo](https://img.shields.io/badge/Dubbo-2.5.3-brightgreen.svg)](pom.xml)
[![Spring](https://img.shields.io/badge/Spring-4.1.6-brightgreen.svg)](pom.xml)

Goshop2 is a distributed e-commerce platform based on Spring, Dubbo and MyBatis.

它展示了一套典型企业 Java SOA 电商系统的工程组织方式：按业务拆分数据库，按 Facade/Provider/Consumer 分层拆分服务，并使用 Dubbo、ZooKeeper、Redis、MyBatis、Shiro、ActiveMQ 等组件完成分布式服务治理、读写分离、会话共享、后台管理、商城门户、CMS 和微信端接入。

This repository is maintained as a reference implementation for developers studying large-scale Java SOA applications.

## 项目亮点

- Distributed Service Architecture：基于 Dubbo 的 Facade、Provider、Consumer 分层。
- Database Sharding：按用户、CMS、商品、店铺拆分业务库。
- Read/Write Separation：每个业务服务保留 `master.jdbc.*` 与 `read.jdbc.*` 两套数据源。
- Redis Session Sharing：Shiro Session 和缓存接入 Redis。
- CMS System：文章、多语言内容、文章分类、幻灯片管理。
- Multi-store Support：店铺、店铺等级、商家入驻、店内分类。
- WeChat Integration：微信服务器校验、消息处理、菜单创建和移动端页面。
- Classic Enterprise Java Stack：保留 Spring MVC + Dubbo + MyBatis 时代的完整工程实践。

## 项目统计

| 指标 | 数量 |
| --- | --- |
| GitHub Stars | 1.1k+ |
| GitHub Forks | 687+ |
| 顶层工程目录 | 20+ |
| 根 POM 聚合模块 | 19 |
| Maven POM 文件 | 22 |
| 业务数据库 | 4 |
| Dubbo Provider 应用 | 5 |
| Dubbo 暴露服务接口 | 15 |
| Web 应用 | 4 |

Stars/Forks 为 GitHub 当前约数；顶部 badge 会随仓库状态实时刷新。

## 架构图

```text
                 +----------------+
                 |    Browser     |
                 +--------+-------+
                          |
        +-----------------+-----------------+
        |                 |                 |
+-------v-------+ +-------v-------+ +-------v-------+
| Admin Console | |  Shop Portal  | | WeChat Portal |
|  /admin       | |  /shop        | |  /wx          |
+-------+-------+ +-------+-------+ +-------+-------+
        |                 |                 |
        +-----------------+-----------------+
                          |
                   Dubbo Consumer
                          |
              +-----------v-----------+
              |      ZooKeeper        |
              |   Service Registry    |
              +-----------+-----------+
                          |
     +--------------------+--------------------+
     |                    |                    |
+----v-----+       +------v------+      +------v------+
|  Users   |       |    CMS      |      |   Goods     |
| Service  |       |  Service    |      |  Service    |
+----+-----+       +------+------+      +------+------+
     |                    |                    |
+----v-----+       +------v------+      +------v------+
|  Store   |       |   Email     |      | ActiveMQ    |
| Service  |       |  Service    |      |   Mail      |
+----+-----+       +------+------+      +-------------+
     |                    |
     +----------+---------+
                |
      +---------v----------+
      | MySQL Business DBs |
      | user/cms/goods/store |
      +---------+----------+
                |
      +---------v----------+
      | Redis / FastDFS /  |
      | Solr Optional Infra|
      +--------------------+
```

## Screenshots

当前仓库没有提交完整运行态截图。为了避免 README 出现失效图片链接，建议补图时统一放到 `docs/images/`：

| 页面 | 建议路径 | 说明 |
| --- | --- | --- |
| Admin Console | `docs/images/admin.png` | 后台管理、CMS、会员管理页面 |
| Shop Portal | `docs/images/shop.png` | 商城门户、会员中心、入驻流程 |
| WeChat Portal | `docs/images/wechat.png` | 微信端/Ionic 移动页面 |

补齐截图后可以把本节替换为：

```markdown
### Admin Console
![Admin Console](docs/images/admin.png)

### Shop Portal
![Shop Portal](docs/images/shop.png)

### WeChat Portal
![WeChat Portal](docs/images/wechat.png)
```

## Background

Goshop2 was created as a refactored version of the original Goshop project.

The goal was to explore:

- Service-oriented architecture (SOA)
- Database read/write separation
- Business database isolation
- Distributed service deployment using Dubbo

Although the technology stack reflects practices common around 2015-2017, the project remains valuable for studying the evolution of enterprise Java systems.

## 技术栈

- Java 7，Maven 多模块工程
- Spring 4.1.6，Spring MVC，Spring JDBC
- MyBatis 3.2.8，MyBatis-Spring 1.2.2，PageHelper
- Dubbo 2.5.3，ZooKeeper 3.4.6，zkclient
- Shiro 1.2.4，Redis/Jedis
- MySQL，Druid 连接池
- FreeMarker，JSP/JSTL
- ActiveMQ，JavaMail
- SolrJ，FastDFS
- Log4j，SLF4J
- Ionic/AngularJS 静态移动端资源

## 项目结构

```text
.
|-- pom.xml                         # Maven 父工程
|-- goshop-common                   # 通用 POJO、异常、工具类
|-- goshop-common-config            # 公共配置：Dubbo、Redis、MQ、邮件等
|-- goshop-common-service           # 服务端公共能力，例如 Redis 客户端封装
|-- goshop-common-shiro             # Shiro Realm、Redis Session/Cache、Freemarker 标签
|-- goshop-common-web               # Web 公共组件：附件、验证码、CORS、响应工具等
|-- goshop-facade-*                 # Dubbo API、业务 POJO、对外服务接口
|-- goshop-service-*                # Dubbo Provider，业务实现与 MyBatis Mapper
|-- goshop-web-manager              # 后台管理端，打包为 admin.war
|-- goshop-web-cms                  # CMS REST 接口，打包为 cms_r.war
|-- goshop-web-portal               # 商城门户/会员/入驻页面，打包为 shop.war
|-- goshop-web-wechat               # 微信端 Web 与公众号消息处理，打包为 wx.war
|-- goshop-mq-email-producer        # 邮件 MQ Producer 示例/独立模块
|-- goshop-mq-email-consumer        # 邮件 MQ Consumer 示例/独立模块
|-- goshop-cms-android              # Ionic/Android 前端工程资源
|-- goshop-db                       # MySQL 初始化脚本
`-- logs                            # 历史运行日志样例
```

根 `pom.xml` 聚合了 common、facade、service 和 web 主要模块。`goshop-mq-email-producer`、`goshop-mq-email-consumer`、`goshop-cms-android` 位于仓库中，但未被根 POM 聚合，按独立模块看待。

## 业务模块

| 模块 | Facade | Provider | 主要职责 | Dubbo 端口 |
| --- | --- | --- | --- | --- |
| 用户 | `goshop-facade-users` | `goshop-service-users` | 用户、会员、角色、找回密码 | `28880` |
| CMS | `goshop-facade-cms` | `goshop-service-cms` | 文章、文章分类、幻灯片、多语言文章 | `28881` |
| 邮件 | `goshop-facade-email` | `goshop-service-email` | 邮件发送、MQ 邮件处理 | `28882` |
| 商品 | `goshop-facade-goods` | `goshop-service-goods` | 商品分类、商品类型 | `28883` |
| 店铺 | `goshop-facade-store` | `goshop-service-store` | 店铺、店铺等级、入驻、店内分类 | `28884` |

Web 端通过 `dubbo-reference-*.xml` 引用这些 Facade 服务；Provider 通过 `applicationContext-dubbo-provider.xml` 注册到 ZooKeeper。

## 数据库

数据库脚本位于 `goshop-db/`：

| 脚本 | 默认库名 | 对应服务 |
| --- | --- | --- |
| `goshop_user.sql` | `goshop_user` | `goshop-service-users` |
| `goshop_cms.sql` | `goshop_cms` | `goshop-service-cms` |
| `goshop_goods.sql` | `goshop_goods` | `goshop-service-goods` |
| `goshop_store.sql` | `goshop_store` | `goshop-service-store` |
| `goshop_user_test.sql` | 测试库 | 用户服务测试数据 |
| `goshop_user_test_read.sql` | 测试只读库 | 用户服务读库测试数据 |

各服务的数据源配置在：

```text
goshop-service-users/src/main/resources/resource/db.properties
goshop-service-cms/src/main/resources/resource/db.properties
goshop-service-goods/src/main/resources/resource/db.properties
goshop-service-store/src/main/resources/resource/db.properties
```

每个服务都配置了 `master.jdbc.*` 和 `read.jdbc.*` 两组连接信息。本地单机开发时可以让主库和读库指向同一个 MySQL 实例；需要验证读写分离时，再分别改成不同实例。

## 关键配置

公共配置集中在 `goshop-common-config/src/main/resources/`：

- `common.properties`：Redis 地址、Dubbo 注册中心、商城上下文路径。
- `mq.properties`：ActiveMQ broker、账号、队列名。
- `email.properties`：SMTP 邮件配置。

Web 端配置位于各模块的 `src/main/resources/resource/`：

- `resource.properties`：站点 URL、模板目录、上传路径、Solr、FastDFS。
- `freemarker.properties`：FreeMarker 渲染配置。

注意事项：

- 仓库中保留了历史 IP、邮箱、MQ、微信 AppId/AppSecret、SMTP 密码等示例/旧值。生产或联调前请统一替换，并优先改为环境变量、配置中心或外部化配置。
- 默认 Dubbo 注册中心为 `zookeeper://127.0.0.1:2181`。
- 默认 Redis 为 `127.0.0.1:6379`。
- 默认 MySQL 用户名/密码为 `root/root`，仅适合本地示例。
- 文件上传默认写入 `D:/webFile/goshop`，Linux/macOS 或自定义目录需要同步修改 `FILE_PATH`。

## 本地准备

建议准备以下服务：

1. JDK 7 或兼容 Java 7 源码编译的 JDK。
2. Maven 3.x。
3. MySQL 5.x，并创建/导入 `goshop_user`、`goshop_cms`、`goshop_goods`、`goshop_store`。
4. ZooKeeper，默认监听 `127.0.0.1:2181`。
5. Redis，默认监听 `127.0.0.1:6379`。
6. Tomcat 7/8，用于部署 WAR。
7. 可选：ActiveMQ、FastDFS、Solr。如果只跑基础页面和核心 Dubbo 服务，可以先关闭或替换相关配置。

## 构建

在仓库根目录执行：

```bash
mvn clean install
```

只构建某个模块及其依赖：

```bash
mvn clean package -pl goshop-service-users -am
mvn clean package -pl goshop-web-manager -am
```

服务模块打包后会在 `target/` 下生成：

- 服务 Jar：`goshop-service-*.jar`
- 依赖目录：`target/lib/`

Web 模块打包后会生成：

| 模块 | WAR 名 | 上下文路径 |
| --- | --- | --- |
| `goshop-web-manager` | `admin.war` | `/admin` |
| `goshop-web-cms` | `cms_r.war` | `/cms_r` |
| `goshop-web-portal` | `shop.war` | `/shop` |
| `goshop-web-wechat` | `wx.war` | `/wx` |

## 启动顺序

1. 启动 MySQL、ZooKeeper、Redis。
2. 导入 `goshop-db/` 中的业务库脚本。
3. 检查各服务的 `db.properties`，确认库名、账号、密码正确。
4. 检查 `common.properties`，确认 `dubbo.address` 指向当前 ZooKeeper。
5. 构建项目。
6. 启动 Dubbo Provider：

```bash
java -jar goshop-service-users/target/goshop-service-users-2.0-SNAPSHOT.jar
java -jar goshop-service-cms/target/goshop-service-cms-2.0-SNAPSHOT.jar
java -jar goshop-service-email/target/goshop-service-email-2.0-SNAPSHOT.jar
java -jar goshop-service-goods/target/goshop-service-goods-2.0-SNAPSHOT.jar
java -jar goshop-service-store/target/goshop-service-store-2.0-SNAPSHOT.jar
```

也可以在 IDE 中直接运行各服务的 `DubboProvider` main 方法，例如：

```text
org.goshop.users.service.DubboProvider
org.goshop.cms.service.DubboProvider
org.goshop.email.service.DubboProvider
org.goshop.goods.service.DubboProvider
org.goshop.store.service.DubboProvider
```

7. 将 Web WAR 部署到 Tomcat。
8. 访问对应入口：

```text
http://127.0.0.1:8080/admin
http://127.0.0.1:8080/cms_r
http://127.0.0.1:8080/shop
http://127.0.0.1:8080/wx
```

`goshop-web-manager` 里配置了 `tomcat7-maven-plugin`，可按本机 Tomcat Manager 配置调整 `settings.xml` 后部署：

```bash
mvn tomcat7:deploy -pl goshop-web-manager -am
```

## Web 模块说明

- `goshop-web-manager`：后台管理端，包含登录、会员管理、CMS 分类、文章、幻灯片、附件上传等页面。
- `goshop-web-cms`：CMS REST 接口，提供文章分类、文章、多语言文章、幻灯片等接口。
- `goshop-web-portal`：商城门户，包含登录注册、会员中心、找回密码、商家入驻、附件访问等功能。
- `goshop-web-wechat`：微信端入口，包含微信服务器校验、消息接收回复、菜单创建、移动端页面。

## 移动端资源

`goshop-web-wechat/src/main/webapp/www` 和 `goshop-cms-android/goshop/www` 保存了 Ionic/AngularJS 页面资源。前者随 `wx.war` 部署，后者是独立 Android/Ionic 工程资源，可按 Cordova/Ionic 老项目方式继续维护。

## 开发约定

- Facade 模块只放接口、DTO/POJO 和跨服务契约。
- Service 模块实现业务逻辑、Mapper、事务和 Dubbo Provider。
- Web 模块只做控制器、视图、表单模型、静态资源和 Dubbo Consumer。
- MyBatis Mapper 分为 `master` 和 `read` 两套包，对应写库和读库。
- 公共工具和基础设施优先放入 `goshop-common-*`。
- 修改接口时先改 Facade，再同步 Provider 和所有 Consumer。

## 常见问题

**1. Web 启动时报 Dubbo 服务不可用**

先确认 ZooKeeper 已启动，Provider 已注册，`dubbo.address` 在服务端和 Web 端一致。

**2. 数据库连接失败**

检查各服务 `resource/db.properties` 中的 `master.jdbc.*` 和 `read.jdbc.*`。脚本本身不创建数据库，需要先创建库再导入 SQL。

**3. 登录或会话异常**

Shiro 会话和缓存依赖 Redis。确认 Redis 地址、端口可用，并检查 `applicationContext-shiro.xml` 和 `applicationContext-jedis.xml`。

**4. 文件上传或图片无法显示**

检查 `resource.properties` 中的 `FILE_PATH`、FastDFS 配置和相关目录权限。本地开发可以先使用本地文件目录。

**5. Maven 编译遇到 JDK 类或编码问题**

父 POM 的编译目标是 Java 7，并配置了 `bootclasspath`。优先使用 JDK 7 构建；若使用更高版本 JDK，可能需要调整 `maven-compiler-plugin` 配置。

## 项目状态

原 README 只有一段简短说明：该项目沿用 goshop 技术路线进行了重构，拆分数据库、读写分离，并调整 Dubbo 发布模式；后续版本曾计划独立发布。当前仓库更适合作为学习、维护或二次改造传统 Dubbo/Spring MVC 电商系统的代码基线。
