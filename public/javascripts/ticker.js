Effect.DefaultOptions.duration = 0.3;

NewsTicker = Class.create();

Object.extend(NewsTicker.prototype, {
	tickerDiv: "ticker",
	// tickerLocation: "billboard",
	tickerTitle: "news-title",
	tickerLink: "/news/",
	feedURL: "/articles/ticker.rss",
	pauseLength: 3500,
	timer: 0,
	currentTitle: 0,
	items: null,
	
	initialize: function() {
		this.items = [];
		new Ajax.Request(this.feedURL, {
			method: "get",
			onSuccess: function(a) {
				this.parseXML(a.responseXML);
				this.buildTicker()
			}.bind(this),
			onFailure: function() {
				console.log("Please visit http://www.summit-traffic.com/news for the latest news and information on Summit Traffic Solutions.")
			},
			onException: function(b,a) {}
		})
	},
	
	buildTicker: function() {
		if(this.items[this.currentTitle]) {
			$(this.tickerTitle).innerHTML = this.items[this.currentTitle]["title"];
			this.start()
		}
	},
	
	parseXML: function(a) {
		$A(a.getElementsByTagName("item")).each(function(c) {
			title = c.getElementsByTagName("title")[0].childNodes[0].nodeValue;
			var b = NewsTicker.tickerLink;
			this.items.push({
				title: title,
				link: b
			})
		}.bind(this))
	},
	
	start: function() {
		this.interval = setInterval(this.showNext.bind(this), this.pauseLength)
	},
	
	stop: function() {
		clearInterval(this.interval)
	},
	
	showNext: function() {
		if(this.currentTitle < this.items.length - 1) {
			this.currentTitle = this.currentTitle + 1
		} else {
			this.currentTitle = 0
		}
		new Effect.Fade("news-title", {
			afterFinish: function() {
				this.switchData();
				new Effect.Appear("news-title")
			}.bind(this)
		})
	},
	
	switchData: function() {
		// $(this.tickerTitle).setAttribute("href",this.tickerLink);
		if(this.items[this.currentTitle]) {
			$(this.tickerTitle).innerHTML = this.items[this.currentTitle]["title"]
		}
	}
});

Event.observe(window, "load", function() {
	var a = new NewsTicker()
});
