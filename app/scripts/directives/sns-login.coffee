Mifan.directive "snslogin", ->

	template = [
		'<div class="sns-login">'
			'<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=weibo&in=login" class="weibo"><i></i><span>新浪微博</span></a>'
			'<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=qq&in=login" class="qq"><i></i><span>腾讯QQ</span></a>'
			'<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=douban&in=login" class="douban"><i></i><span>豆瓣</span></a>'
		'</div>'
	].join ""

	template: template
	replace: yes
	restrict: "E"