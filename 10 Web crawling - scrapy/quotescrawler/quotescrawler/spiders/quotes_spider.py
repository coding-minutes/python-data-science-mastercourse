import scrapy

class QuotesSpider(scrapy.Spider):
	name = "quotes"

	def start_requests(self):
		urls = [
			'https://quotes.toscrape.com/page/1/'
		]

		# Generator function
		for u in urls:
			yield scrapy.Request(url=u, callback = self.parse)


	def parse(self, response):
		# page_no = response.url.split('/')[-2]
		# filename = "quotes-{}.html".format(page_no)

		# with open(filename, 'wb') as f:
		# 	f.write(response.body)

		# self.log("saved file "+ filename)

		all_quotes = response.css('div.quote')

		for quote in all_quotes:
			title = quote.css('span.text::text').get()
			author = quote.css('small.author::text').get()
			tags = quote.css('a.tag::text').getall()

			result = {
				'text' : title,
				'author': author,
				'tags' : tags
			} 

			yield result

			next_page = response.css('li.next a::attr(href)').get()

			if next_page is not None:
				next_page = response.urljoin(next_page)
				yield scrapy.Request(url=next_page, callback = self.parse)








