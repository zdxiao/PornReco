from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.selector import HtmlXPathSelector
import time

from image.items import ImageItem

class MyImageSpider(CrawlSpider):
    name = "image_spider"
    allowed_domains = ["meizitu.com"]
    start_urls = [
        "http://www.meizitu.com/",]
    rules = (
        Rule(SgmlLinkExtractor(allow=(), restrict_xpaths=('//a',)), callback="parse_items", follow= True),
        #Rule(SgmlLinkExtractor(allow=(), restrict_xpaths=('//a[@class="clickSorting"]',)), callback="parse_items", follow= True),
    )
    def parse_items(self, response):
        hxs = HtmlXPathSelector(response)
        imgs = hxs.select('//img/@src').extract() 
        item = ImageItem()
        item['image_urls']=imgs
        time.sleep(2)
        return item