import scrapy
import re

class MolsSpider(scrapy.Spider):
    name = 'mols'

    def start_requests(self):
        urls = [
            'https://www.thoughtco.com/a-organic-compounds-list-608749',
            'https://www.thoughtco.com/b-organic-compounds-list-608750',
            'https://www.thoughtco.com/c-organic-compounds-list-608751',
            'https://www.thoughtco.com/e-organic-compounds-list-608753',
            'https://www.thoughtco.com/p-organic-compounds-list-608764',
            'https://www.thoughtco.com/v-organic-compounds-list-608770'
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.css('div.flex')
        data = page.css('p')[2].extract()
        p =re.compile(' - .*?<br>')
        data = p.sub('~', data)
        f = open('results.txt', 'a')
        for dat in data.split('~'):
            f.write(dat + '\n')
        f.close()
