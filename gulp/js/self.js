var my_fun = {
	init : function(){
		this.insertWeiBo();
		this.searchModule();
	},
	insertWeiBo : function(){
		var weibo_html = '<iframe width="330" height="400" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=1&isTitle=0&noborder=0&isWeibo=1&isFans=0&uid=3822969136&verifier=d420dd2b&dpc=1"></iframe>';
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
    }
};
$(function(){
	my_fun.init();
});
$(window).on("resize", function() {
    my_fun.insertWeiBo();
});