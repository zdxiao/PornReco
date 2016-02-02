# -*- coding: utf-8 -*-

# Scrapy settings for image project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'image'

SPIDER_MODULES = ['image.spiders']
NEWSPIDER_MODULE = 'image.spiders'

ITEM_PIPELINES = ['image.pipelines.MyImagesPipeline']  # ImagePipeline的自定义实现类
IMAGES_STORE = '.\\'   # 图片存储路径
IMAGES_EXPIRES = 90                                   # 过期天数
IMAGES_MIN_HEIGHT = 50                               # 图片的最小高度
IMAGES_MIN_WIDTH = 50                                # 图片的最小宽度
# 图片的尺寸小于IMAGES_MIN_WIDTH*IMAGES_MIN_HEIGHT的图片都会被过滤

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'image (+http://www.yourdomain.com)'
