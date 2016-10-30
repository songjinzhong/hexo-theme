var my_fun = {
	init : function(){
		this.insertWeiBo();
		this.searchModule();
        this.back_to_top();
        this.go_to_comments();
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
    }
};
$(function(){
	my_fun.init();
});
$(window).on("resize", function() {
    my_fun.insertWeiBo();
});