# SSLTrus Homebrew Tap

[English](README.md) · [简体中文](README.zh_CN.md)

此 Tap 为 macOS 提供 SSLTrus 代码签名命令行客户端和桌面应用。

安装命令行客户端：

```shell
brew tap ssltrus-official/tap
brew trust ssltrus-official/tap
brew install ssltrus-official/tap/code-sign-cli
```

安装桌面应用：

```shell
brew install --cask ssltrus-official/tap/code-sign-gui
```

命令行客户端安装后的可执行文件名为 `signtool`。建议通过 Homebrew
升级两个软件，以便安装版本与 Homebrew 的包元数据保持一致。

GUI Cask 安装完成后会清除 macOS quarantine 属性，过程中可能要求输入
管理员密码。
