#!/bin/bash
# Wordpress Maintenance Script by Tunghsiao Liu

# vars
WP_VER=tags/3.5/messages
# WP_VER=trunk/messages
WP_REMOTE=http://i18n.svn.wordpress.org
WP_LOCAL=~/dropbox/sparanoid-web/\~localhost/\~/wp-content
WP_EXCLUDE=--exclude=.*

# 用于中文翻译维护:
# cat zh_CN.po | grep '自豪'

# Twenty Twelve
cd $WP_LOCAL/languages/themes/
for file in `find . -name "twentytwelve-zh_CN.po"` ; do msgfmt -o `echo $file | sed s/\.po/\.mo/` $file ; done

# Twenty Eleven
cd $WP_LOCAL/languages/themes/
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/"特色"/"推荐文章"/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/"特色/"推荐/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/msgstr "查看所有由 %s 发布的文章"/msgstr "查看所有由 %s 发表的文章"/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/包含 <a %1$s>%2$s 张图像<\/a>/包含 <a %1$s>%2$s 张图片<\/a>/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/图像导航/图片导航/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/多媒体陈列厅/相册/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/早期文章/较老文章/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/将内容置于左侧/内容在左侧/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/将内容置于右侧/内容在右侧/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/一栏、不带边栏/单栏、无侧栏/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/有点尴尬诶。/有点儿尴尬，不是吗？/' '{}' \;
find . -name "twentyeleven-zh_CN.po" -exec sed -i "" 's/《%2$s》上有 %1$s 条评论/%1$s 条「%2$s」的回复/' '{}' \;
for file in `find . -name "twentyeleven-zh_CN.po"` ; do msgfmt -o `echo $file | sed s/\.po/\.mo/` $file ; done

# Twenty Ten
cd $WP_LOCAL/languages/themes/
for file in `find . -name "twentyten-zh_CN.po"` ; do msgfmt -o `echo $file | sed s/\.po/\.mo/` $file ; done

# Core language files and themes common strings translation, based on Twenty Ten.
cd $WP_LOCAL/languages/
find . -name "*zh_CN.po" -exec sed -i "" 's/Last-Translator: Jiehan Zheng <zheng@jiehan.org>/Last-Translator: Postholic WordPress Dev Team <wp@postholic.com>/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/Language-Team: WordPress China <wpchina@jiehan.org>/Language-Team: Postholic WordPress Dev Team <wp@postholic.com>/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/"%1$s%2$s"/"%1$s @ %2$s"/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/中文支持论坛/支持论坛/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/zh-cn.forums.wordpress.org\/forum\/suggestions/wordpress.org\/wordpress.org\/support\/forum\/requests-and-feedback/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/zh-cn.forums.wordpress.org\//wordpress.org\/support\//' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/自豪地采用 %s/由 %s 驱动/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/链向 %s 的固定链接/「%s」的永久链接/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/cn.wordpress.org/wordpress.org/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/仪表盘/控制台/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/归档/存档/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/月度/月份/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/固定链接/永久链接/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/博客/网志/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/分类目录/分类/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/小工具/小挂件/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/引语/引用/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/“/「/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/”/」/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/《/「/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/》/」/' '{}' \;
find . -name "*zh_CN.po" -exec sed -i "" 's/特性筛选/特征筛选/' '{}' \;
for file in `find . -name "*zh_CN.po"` ; do msgfmt -o `echo $file | sed s/\.po/\.mo/` $file ; done

