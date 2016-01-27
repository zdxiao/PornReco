from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor

from image.items import ImageItem

class MyImageSpider(BaseSpider):
    name = "image_spider"
    allowed_domains = ["mynakedteens.com"]
    start_urls = [
        "http://www.mynakedteens.com/teen-masturbation/",]
    def parse(self, response):
        hxs = HtmlXPathSelector(response)
        imgs = hxs.select('/html/body/div/div/a/img/@src').extract()
        #print imgs
        item = ImageItem()
        item['image_urls']=imgs
        return item