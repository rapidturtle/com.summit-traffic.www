// This script is courtesy of Apple, Inc.
// Requires prototype.js

Effect.DefaultOptions.duration = 0.3;
NewsTicker = Class.create();
Object.extend(NewsTicker.prototype, {
	
	tickerDiv: "ticker", 
	tickerLocation: "billboard", 
	tickerTitle: "news-title",
	tickerDesc: "news-desc",
	tickerLink: "/articles/",
	feedURL: "/articles/ticker.rss",
	pauseLength: 3500,
	timer: 0,
	currentTitle: 0,
	items: null,
	initialize: function() {
		
		this.items = [];
		
		new Ajax.Request(
			this.feedURL, {
				method: "get",
				onSuccess: function(response) {
					this.parseXML(response.responseXML);
					this.buildTicker();
				}.bind(this),
				onFailure: function() {
					console.log("Please visit http://www.summit-traffic.com/news for the latest news and information on Summit Traffic Solutions.");
				},
				onException: function(req, err) {
					// throw(err);
				}
			}
		);
	},
	
	buildTicker: function() {
		// replace the placeholder content with the first news title
		if (this.items[this.currentTitle]) {
			$(this.tickerTitle).innerHTML = this.items[this.currentTitle]['title'];
			$(this.tickerDesc).innerHTML = this.items[this.currentTitle]['description'];
			this.start();// start the timer if we have valid headlines
		}
	},
	
	parseXML: function(xml) {
		// build the array of news titles
		$A(xml.getElementsByTagName("item")).each(function(item) {
			title = item.getElementsByTagName("title")[0].childNodes[0].nodeValue;
			desc = item.getElementsByTagName("description")[0].childNodes[0].nodeValue;
			var link = NewsTicker.tickerLink;
			this.items.push({title: title, description: desc, link: link});
		}.bind(this));
	},
	
	start: function() {
		this.interval = setInterval(this.showNext.bind(this), this.pauseLength);
	},
	
	stop: function() {
		clearInterval(this.interval)
	},
	
	showNext: function() {
		
		//determine next headline
		if ( this.currentTitle < this.items.length-1 ) {
			this.currentTitle = this.currentTitle+1;
		} else {
			this.currentTitle = 0;
		}
		
		new Effect.Fade('news-link', {
			afterFinish: function() {
				this.switchData();
				new Effect.Appear('news-title');
				new Effect.Appear('news-desc') }.bind(this)});
 
	},
	
    switchData: function() {
		$(this.tickerTitle).setAttribute("href", this.tickerLink);
		if (this.items[this.currentTitle]) {
			$(this.tickerTitle).innerHTML = this.items[this.currentTitle]['title'];
			$(this.tickerTitle).innerHTML = this.items[this.currentTitle]['description'];
		}
	}
});
 
Event.observe(window, 'load', function() {
	var ticker = new NewsTicker();
});
