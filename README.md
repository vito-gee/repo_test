# repo_test
report repository demo

## 启动

```
$ go run main.go -env fat  

// -env 表示设置哪个环境，主要是区分使用哪个配置文件，默认为 fat
// -env dev 表示为本地开发环境，使用的配置信息为：configs/dev_configs.toml
// -env fat 表示为测试环境，使用的配置信息为：configs/fat_configs.toml
// -env uat 表示为预上线环境，使用的配置信息为：configs/uat_configs.toml
// -env pro 表示为正式环境，使用的配置信息为：configs/pro_configs.toml
```

## 热加载启动

```shell
# mac/linux
./scripts/hot_reload.sh 
# windows
./scripts/hot_reload.bat

```

## 接口文档

- 接口文档：http://127.0.0.1:9999/swagger/index.html
- 心跳检测：http://127.0.0.1:9999/system/health