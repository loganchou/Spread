# 開発手順

## 生成 Git-SSH 公钥
1. 设置Git的user name和email
```shell
    $ git config --global user.name "yourname"
    $ git config --global user.email "yourmail@mail.com"
```
   如果是第一次的话，请设定自己的用户名和mail。

2. 生成 SSH 公钥
```shell
    $ ssh-keygen -t rsa -C "yourmail@mail.com"

    Generating public/private rsa key pair.
    Enter file in which to save the key (/Users/you/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /Users/you/.ssh/id_rsa.
    Your public key has been saved in /Users/you/.ssh/id_rsa.pub.
    The key fingerprint is:
    43:c5:5b:5f:b1:f1:50:43:ad:20:a6:92:6a:1f:9a:3a yourmail@mail.com
```
   先要求你确认保存公钥的位置（.ssh/id_rsa），   然后它会让你重复一个密码两次，如果不想在使用公钥的时候输入密码，可以留空。
   最后得到了两个文件：id_rsa 和 id_rsa.pub。

3. SSH 公钥上传 Git 服务器
   首先，确认一下是否已经有一个公钥了。SSH 公钥默认储存在账户的主目录下的 ~/.ssh 目录。
```shell
$ cd ~/.ssh
$ ls
authorized_keys2  id_dsa       known_hosts
config            id_dsa.pub
```
   现在，把公钥给你或者 Git 服务器的管理员（假设 SSH 服务被设定为使用公钥机制）。
   只需要复制 .pub 文件的内容然后发邮件给管理员。

4. 设置 SSH agent 转发功能
   将 SSH 私钥增加到 ssh-agent:
```shell
    $ ssh-add ~/.ssh/id_rsa
```

   查看已经添加的 SSH KEY： 
```shell
    $ ssh-add -l
```

   测试你的本地密钥是否可用：
```shell
    $ ssh -T user@gitserver.com
```

5. 一台机器上管理多个 Github 帐号的 SSH Key
   如果你在一台机器使用两个 git 账号（比如私人账号abc和工作账号xyz），
   两个帐号用不同的 SSH KEY，还需要编辑一下配置文件 ~/.ssh/config：
```
    Host personal.github.com  
        HostName github.com  
        User git  
        IdentityFile ~/.ssh/personal_rsa  
    
    Host work.github.com  
        HostName github.com  
        User git  
        IdentityFile ~/.ssh/work_rsa
```

## 开发环境
```shell
    #工作目录
    $ cd 01.workspace/02.ios/swift/
    
    #添加 SSH KEY
    $ ssh-add .ssh/logan

    #克隆 Git 仓库
    $ git clone ssh://croul@vs-ssh.visualstudio.com:22/_ssh/SwiftWithoutTaylor

    #检查当前文件状态
    $ git status
    
    #查看当前的远程库
    $ git remote -v

    #从远程仓库抓取数据
    #git fetch [remote-name] 命令只是将远端的数据拉到本地仓库，并不自动合并到当前工作分支。
    #可以使用 git pull [remote-name] [branch-name] 命令自动抓取数据下来，
    #然后将远端分支自动合并到本地仓库中当前分支。在日常工作中我们经常这么用，既快且好。
    $ git fetch origin
    $ git pull origin master 

    #跟踪新文件
    #Git 提供了一个跳过使用暂存区域的方式，只要在提交的时候，给 git commit 加上 -a 选项，
    #Git 就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤。
    $ git add <file>...

    #提交更新
    $ git commit -m "comment..."

    #推送数据到远程仓库
    #要同别人分享目前的成果，可以将本地仓库中的数据推送到远程仓库。
    #实现这个任务的命令很简单： git push [remote-name] [branch-name]。
    $ git push -u origin master

    #移除文件
    $ git rm <file>...
    
    #查看提交历史
    $ git log --pretty=format:"%h %s" --graph
```