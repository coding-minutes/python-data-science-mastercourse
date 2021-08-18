import scrapy

class BooksSpider(scrapy.Spider):

	name = "books"

	def start_requests(self):
		urls = [
			"https://books.toscrape.com/catalogue/page-1.html"
		]


		for u in urls:
			yield scrapy.Request(url=u, callback=self.parse)


	def parse(self, response):

		all_books = response.css("ol.row li")

		for book in all_books:
			img = book.css("div.image_container a img::attr(src)").get()
			name = book.css('h3 a::text').get()
			price = book.css('div.product_price p::text').get()

			yield {
				'url' : img,
				'name' : name,
				'price' : price
			}

		next_page = response.css("ul.pager li.next a::attr(href)").get()

		if next_page is not None:
			next_page = response.urljoin(next_page)
			yield scrapy.Request(url=next_page, callback=self.parse)









