// Generated by CoffeeScript 1.7.1
Mifan.directive("snslogin", function() {
  var template;
  template = ['<div class="sns-login">', '<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=weibo&in=login" class="weibo"><i></i><span>新浪微博</span></a>', '<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=qq&in=login" class="qq"><i></i><span>腾讯QQ</span></a>', '<a ng-href="http://mifan.us/index.php?app=pubs&ac=plugin&plugin=douban&in=login" class="douban"><i></i><span>豆瓣</span></a>', '</div>'].join("");
  return {
    template: template,
    replace: true,
    restrict: "E"
  };
});
