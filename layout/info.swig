{% extends 'includes/layout.swig' %}

{% block body %}
 	<div class="post info">
 		<h1 class="overview">
 			{% include 'includes/overview.swig' %}
 		</h1>
 		<div class="about-me clear">
 			<p class="header"><strong>About-Me</strong><span>/关于我</span></p>
 			<div class="about-info">
 			{% if theme.me %}
 				<img src="{{theme.me}}">
 			{% endif %}
 			<p>My name is Song JinZhong (宋进忠). My blog's name is YuRen (渔人). I was born in 1994.</p>
 			<p>I am a Master degree candidate in Software Engineering at East China Normal University.</p>
 			<p>I like programming, I am a JS Lover and Open Source Lover, 我喜欢交朋友, You can contact me at <em>songjz.ecnu[at]gmail.com</em>.</p>
 			<p>我正在努力寻找一份前端的实习&工作！(我很想做全栈) <span class="resume">浏览我的<a href="{{url_for(config.resume_dir)}}">简历</a>。<span></p>
 			<p><span class="resume">浏览我在 GitHub 上的<a href="{{url_for(config.projects_dir)}}">项目</a>。<span></p>
 			</div>
 		</div>
 		<div class="about-pape">
 			<p class="header"><strong>About the Web</strong><span>/关于本站内容</span></p>
 			<p><span>版权声明：</span><span>自由转载-非商用-保持署名</span><a href="https://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh">(创意共享3.0许可证)</a></p>
 			<p>本站内容均属原创，我不会抄袭别人的作品，也请你在转载的时候附上署名。</p>
 			<p>本站源码(不包括主题和 public 文件夹)：<a href="https://github.com/songjinzhong/yuren.space">源码</a>。</p>
 			<p>本站 Hexo 主题(请放到上面 Hexo 的 theme 目录下面)：<a href="https://github.com/songjinzhong/hexo-theme">主题</a>。</p>
 			<p>本站是静态博客，由 GitHub 或 Coding (Coding 的速度貌似要快一些)，先前用服务器搭过动态博客<a href="http://songjz.cn">原博</a>，太烧钱，穷学生。</p>
 			<p><strong>说明一下</strong>，博客和主题是分开的，分别在上面两个项目中，具体使用请参考 Hexo 的主题介绍。Hexo 我手动修改了部分插件(hexo-util 中的 markdown插件和 search插件 )，但是我把修改后的源码放到node_module目录下面，你可以直接复制替换。同时，Hexo 的主题未进行优化，如果你有看不懂的地方，欢迎随时给我发邮件。邮件是实时提醒的，其他联系方式不保证即时回复。</p>
 			<p><strong>另外</strong>，本站还没有考虑兼容性，我设计的时候尽量使用通用的样式，在Chrome 和 FireFox (目前最新版本)下显示是正常的，IE 11 目前也没有问题，手机 Chrome 也暂时没问题，如果你在浏览过程中遇到任何 Bug 或兼容性问题，请及时向我反馈，<strong>非常感谢</strong>!</p>
 		</div>
 		<div class="link" id="link">
 			<p class="header"><strong>About the Links</strong><span>/链接信息</span></p>
 			<ul>
 				<li><span>Github:</span><a href="{{theme.github}}">@songjinzhong</a></li>
 				<li><span> WeiBo :</span><a href="{{theme.weibo}}">微博</a></li>
        <li><span>Resume :</span><a href="{{url_for(config.resume_dir)}}">简历</a></li>
        <li><span>Projects :</span><a href="{{url_for(config.projects_dir)}}">我的项目</a></li>
 				<li><span>Old Blog:</span><a href="http://songjz.cn">旧博(不再使用)</a></li>
 				<li><span>Mail Me:</span><a href="mailto:songjz.ecnu@gmail.com">邮件</a></li>
 			</ul>
 		</div>
 		<div class="last-update">
 			<span>最后修改时间:{{date(page.date, 'YYYY年MM月DD日')}}</span>
 		</div>
 		{% if page.comments %}
{# 	 		<div class="duoshuo-part">
				{% include 'includes/duoshuo.swig' %}
			</div> #}
      <div class="disqus-part" id="comments">
        <p class="header"><strong>About the Comments</strong><span>/发表评论</span></p>
        {% include 'includes/disqus.swig' %}
      </div>
		{% endif %}
 		{% include 'includes/web-info.swig' %}
 	</div>
{% endblock %}
