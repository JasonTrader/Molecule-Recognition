import scrapy
import re
import urllib, cStringIO
from PIL import Image

class PicsSpider(scrapy.Spider):
    name = 'pics'

    def start_requests(self):
        with open('../results.txt') as f:
            content = f.readlines()
        content = map(lambda x: x.rstrip(), content)
        urls = map(lambda x: 'https://www.ncbi.nlm.nih.gov/pccompound?term=' + x.replace(' ', '+'), content)

        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        data = response.css('div.rsltcont > p > a')
        iupacdata = response.css('dl.details')
        if data:
            data = data[0].extract()
            cid = re.findall(r'\d+', data)[0]
            iupac = iupacdata[1].css('dd').extract()[0].replace('<dd>','').replace('</dd>','').replace('<b>','').replace('</b>','')
            title = response.url.split('=')[-1].replace('+', ' ')

            imgurl = 'https://pubchem.ncbi.nlm.nih.gov/image/imagefly.cgi?cid=' + cid + '&width=500&height=500'
            imgpath = '../images/' + cid + '.png'
            file = cStringIO.StringIO(urllib.urlopen(imgurl).read())
            img = Image.open(file)
            img.save(imgpath)


            state = 'INSERT INTO mol VALUES (\''+ cid + '\', \'' + title + '\', \'' + iupac + '\');'
            f = open('../statements.txt', 'a')
            f.write(state + '\n')
            f.close()
            """
            conn = sqlite3.connect('../mol.db')
            c = conn.cursor()
            c.execute(state)
            conn.commit()
            conn.close()
            """
