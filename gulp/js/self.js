var my_fun = {
  init : function(){

    // init data
    this.$w = $(window);
    this.headerlinkTop = [];
    this.doScroll = false;

	  this.insertWeiBo();
	  this.searchModule();
		this.back_to_top();
		this.go_to_comments();
		this.closeToc();
		this.consoleToYou();
    this.scroll2Toc();
    this.showDisqus();
  },
	data: {
		showConsole: {
			welcome: "欢迎来到/渔人/的个人博客",
			email: "我的邮件：songjz.ecnu@gmail.com",
			webinfo: "网站信息：http://yuren.space/blog/web-info/",
			resume: "我的简历：http://yuren.space/resume/"
		},
		buddha: [
			" .............................................  ",
			"          佛祖保佑             永无BUG ",
			"                    _ooOoo_  ",
			"                   o8888888o  ",
			'                   88" . "88  ',
			"                   (| -_- |)  ",
			"                    O\\ = /O  ",
			"                ____/`---'\\____  ",
			"              .   ' \\\\| |// `.  ",
			"               / \\\\||| : |||// \\  ",
			"             / _||||| -:- |||||- \\  ",
			"               | | \\\\\\ - /// | |  ",
			"             | \\_| ''\\---/'' | |  ",
			"              \\ .-\\__ `-` ___/-. /  ",
			"           ___`. .' /--.--\\ `. . __  ",
			"        .\"\" '< `.___\\_<|>_/___.' >'\"\".  ",
			"       | | : `- \\`.;`\\ _ /`;.`/ - ` : | |  ",
			"         \\ \\ `-. \\_ __\\ /__ _/ .-` / /  ",
			" ======`-.____`-.___\\_____/___.-`____.-'======  ",
			"                    `=---='  ",
		]
	},
  insertWeiBo : function(){
	var weibo_html = '<iframe width="330" height="750" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=330&height=750&fansRow=2&ptype=1&speed=0&skin=1&isTitle=0&noborder=0&isWeibo=1&isFans=0&uid=3822969136&verifier=d420dd2b&dpc=1"></iframe>';
	var $w_b = $('.weibo-frame');
	if($('.blog-content').width() > 650){
	  if(!$w_b.find('iframe').length){
		$w_b.append(weibo_html);
	  }
	}
  },
	searchModule : function() {
		var $openSearchBtn = $('.search-icon');
		var $closeSearchBtn = $('.close-icon');
		var $bigSearchContainer = $('.big-search');
		// ghost hunter init
		var ghostHunter = $('.js-search-input').ghostHunter({
			results: '.js-search-results',
			info_template: "<p>搜索结果 : {{amount}}</p>",
			result_template: '<li><a href="{{link}}">{{title}}</a><span>{{pubDate}}</span></li>',
			onKeyUp: true
		});
		$openSearchBtn.on('click', function(e) {
			e.preventDefault();
			$bigSearchContainer.addClass('open');
			$(window).scrollTop(0);
			$bigSearchContainer.find('input[type=text]').focus();
		});
		$closeSearchBtn.on('click', function(e) {
			e.preventDefault();
			ghostHunter.clear();
			$bigSearchContainer.removeClass('open');
		});
	},
	closeToc: function(){
		var $tocCloseButton = $('.toc-icon');
		var $tocContainer = $('.toc');
		var open = true;
		$tocCloseButton.on('click', function(e){
			e.preventDefault();
			if(open){
				$tocContainer.addClass('close');
				$tocCloseButton.css({'transform': 'rotate(45deg)'});
				open = false;
			}else{
				$tocContainer.removeClass('close');
				$tocCloseButton.removeAttr('style');
				open = true;
			}
		});
	},
	back_to_top : function(){
		var $toTop = $('.back-to-top');
		$(window).on("scroll", function() {
			if ($(window).scrollTop() >= $(window).height()) {
				$toTop.css("display", "block").fadeIn();
			} else {
				$toTop.fadeOut();
			}
		});
		$toTop.on("click", function(e) {
			var $obj = $("body,html");
			$obj.animate({
				scrollTop: 0
			}, 500);
			e.preventDefault();
		});
	},
	go_to_comments : function(){
		$(".goto-comments").on("click", function(e) {
			e.preventDefault();
			if (/#comments/.test(window.location.href)) {
				window.location.href = window.location.href;
			} else {
				window.location.hash = "#comments";
			}
		});
	},
	// show console
	consoleToYou: function(){
		var self = this;
		if(window.console && window.console.log){
			$(document).ready(function(){
				var data = self.data.showConsole;
				setTimeout(function(){
					console.log(data.welcome);
					console.log(data.email);
					console.log(data.webinfo);
					console.log(data.resume);
				}, 500);
				setTimeout(function(){
					self.data.buddha.forEach(function(d){
						console.log(d);
					});
				},1000)
			});
		}
	},
	// 实现监听滚动
	scroll2Toc: function(){
    // 判断是非为 post 页面
    if(!($("#toc")[0])){
      return ;
    }

    var $w = this.$w;

    //判断宽度是非满足条件
    if($w.width() <= 1090){
      return ;
    }
    
		// 修正响应不及时的问题
		var HEADFIX = 30;
		var $toclink = $('.toc-link'),
			$headerlink = $('.headerlink'),
			$tocchild = $('.toc-child');

    //var debounce = this.debounce;
    var throttle = this.throttle;

		var headerlinkTop = this.headerlinkTop;
    headerlinkTop = $.map($headerlink, function(link) {
			return $(link.parentNode).offset().top - HEADFIX;
		});

    // 修正参数
    headerlinkTop[0] = -1;
    headerlinkTop.push(Infinity);

    var pos = 0;
    var getActive = function(s_top){
      for(var i = 0; i < $toclink.length; i++){
        var currentTop = headerlinkTop[i];
        var nextTop = headerlinkTop[i+1];

        if(s_top > currentTop && s_top <= nextTop){
          $toclink.removeClass('active');
          $tocchild.removeClass('toc-show');
          pos = i;
          var nowlink = $toclink[i];
          $(nowlink).addClass('active');
          while($(nowlink.parentNode.parentNode).hasClass('toc-child')){
          	nowlink = nowlink.parentNode.parentNode;
          	$(nowlink).addClass('toc-show');
          }
          break;
        }
      }
    }
    getActive($w.scrollTop());

    // 修复 image load bug
    var link_length = $headerlink.length;
    var $link_last = link_length > 1 ? $($headerlink[$headerlink.length - 1].parentNode) : null;
    var fixLoading = function(){
      if(link_length > 1 ){
        if(($link_last.offset().top - HEADFIX) - headerlinkTop[link_length - 1] != 0){
          headerlinkTop = $.map($headerlink, function(link) {
            return $(link.parentNode).offset().top - HEADFIX;
          });
          // 修正参数
          headerlinkTop[0] = -1;
          headerlinkTop.push(Infinity);
          console.log('fix loading bug!');
        }
      }
    }

    // callback 抖动函数
    var cb = function(){
      var scrollTop = $w.scrollTop();
      fixLoading();
      if(scrollTop > headerlinkTop[pos + 1] || scrollTop <= headerlinkTop[pos]){
        getActive(scrollTop);
        console.log('jump!');
      }
    }

    if(!this.doScroll){
      this.doScroll = true;
      //$w.scroll(debounce(cb, 50));
      $w.scroll(throttle(cb, 50, 300));
    }
	},


  // 防止抖动
  debounce: function(fn, delay){
    var timer = null,
      self = this;
    return function(){
      var args = arguments;
      clearTimeout(timer);
      timer = setTimeout(function(){
        fn.apply(self, args);
      }, delay)
    }
  },

  //节流函数
  throttle: function(fn, delay, mustRun){
    var timer = null, startTime = new Date(), self = this;
    return function(){
      var args = arguments, now = new Date();
      clearTimeout(timer);
      if(now - startTime >= mustRun){
        startTime = now;
        fn.apply(self, args);
      }else{
        timer = setTimeout(function(){
          fn.apply(self, args);
        }, delay)
      }
    }
  },

  // show disqus
  showDisqus: function(){
    var doOnce = function(){
      var d = document, s = d.createElement('script');
      s.src = 'https://yurenspace.disqus.com/embed.js';
      s.async = true;
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
      console.log('Show disqus!');
      var random = ['#ffeb3b', '#009688', '#795548', '#673ab7', '#ff5722', '#9c27b0']
      var error, r;
      var loading = setInterval(function(){
        error = disqus.find('.disqus-error');
        r = random.shift();
        random.push(r);
        if(error.length){
          error.css({
            color: r
          })
        }
      },500)
      setTimeout(function(){
        clearInterval(loading);
        var err = disqus.find('.disqus-error');
        if(err.length){
          err.text('对不起，无法打开评论！');
          err.css({
            color: '#ff5722'
          })
        }
      }, 6000)
    }
    var $w = this.$w,
      disqus = $('#disqus_thread'),
      throttle = this.throttle;
    var cb = throttle(function(){
      if($w.scrollTop() + $w.height() + 30 >= disqus.offset().top){
        doOnce();
        $w.off('scroll', cb);
      }
    }, 30, 100);
    if(disqus.length){
      $w.on('scroll', cb);
    }
  }
};

/* 不好用
$(function(){
  my_fun.init();
});
*/

$(document).ready(function(){
  my_fun.init();
});
$(window).on("resize", function() {
	my_fun.insertWeiBo();
	my_fun.scroll2Toc();
});