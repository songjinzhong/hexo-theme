var my_fun = {
	init : function(){
		this.insertWeiBo();
	},
	insertWeiBo : function(){
		var weibo_html = '<iframe width="330" height="400" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=1&isTitle=0&noborder=0&isWeibo=1&isFans=0&uid=3822969136&verifier=d420dd2b&dpc=1"></iframe>';
		var $w_b = $('.weibo-frame');
		if($('.blog-content').width() > 650){
			if(!$w_b.find('iframe').length){
				$w_b.append(weibo_html);
			}
		}
	}
}
!function(){
	my_fun.init();
}();
$(window).on("resize", function() {
    my_fun.insertWeiBo();
});