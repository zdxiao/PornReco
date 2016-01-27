
说明
1. crawler_huaban.py  花瓣网爬虫
2. batchDownloadImages 批量下载某站点所有网页所有图片（尺寸大于50x50的图片），基于scrapy
	使用方法：在batchDownloadImages/ 目录下，打开cmd命令窗口，键入scrapy crawl image_spider
	找到该目录下的image_spider.py 将里面的相应站点描述修改成待爬站点
	下载的图片将在在该目录下新建一个名为full的文件夹下
	如有问题，联系xiao
3. downloadImagesFromSinglePage 下载某一个网页的所有图片（尺寸大于50x50的图片）
	使用方法同上，如有问题联系xiao