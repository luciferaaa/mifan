"use strict"

Mifan.controller "loginCtrl", ($scope, $http, $cookieStore, $timeout) ->
    
  API = $scope.API
  IsDebug = $scope.IsDebug
  LOC = $scope.LOC

  $scope.error = null

  userLoginSuccessCb = (data, status) ->
    ###
    {
      "msg": "密码错误！",
      "ret": "104003"
    }

    {
      "msg": "Email不存在，你可能还没有注册！",
      "ret": "104002"
    }

    {
      "msg": "OK",
      "ret": "100000",
      "result": {}
    }
    ###

    ret = data["ret"]

    # 成功
    if ret is "100000"
      
      result = data["result"]

      $scope.user.username = result["user"]["username"] or ""
      $scope.user.email = result["user"]["email"] or ""
      $scope.user.face = result["user"]["face"] or ""
      $scope.user.sex = result["user"]["sex"] or "1cookieStore"
      $scope.user.blog = result["user"]["blog"] or ""

      $cookieStore.put "MifanUser", JSON.stringify $scope.user

      LOC["href"] = "#!/"

      $scope.isLoging = no



  userLoginErrorCb = (data, status) ->

    ret = data["ret"]

    # 密码错误
    if ret is "104003"
      $scope.error = type: "password", msg: "密码错误 :("

    # 用户名错误
    else if ret is "104002"
      $scope.error = type: "username", msg: "用户名不存在 T_T"


    if $scope.error
      $timeout ->
        $scope.error = null
      , 3000


    $scope.isLoging = no


  userLogin = ->
    $http(
      method: "POST"
      url: API.user
      data:
        user_email: $scope.email
        user_password: $scope.password
    )
    .success(userLoginSuccessCb)
    .error(userLoginErrorCb)

  $scope.$on "$viewContentLoaded", -> $scope.$emit "pageChange", "login"

  $scope.$watch "email + password", ->
    $scope.isLogValid = $scope.email and $scope.password

  # 是不是正在登录，等待服务器返回登录状态
  $scope.isLoging = no

  $scope.onSubmit = ->
    $scope.isLoging = yes

    userLogin()



