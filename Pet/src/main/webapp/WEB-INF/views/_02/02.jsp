<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Blog 管理系統</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">會員文章列表</a></li>
        <li><a href="#">檢舉文章管理</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">進階設定 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">管理設置</a></li>
            <li><a href="#">廣告設置</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">刪除帳號</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">登出</a></li>
    </div>
  </div>
</nav>

<div class="container">
  <div class="btn btn-primary" style="margin-bottom:10px">新增文章</div>
  
  <table class="table table-striped table-bordered">
    <tr>
      <th>標題</th>
      <th>發表日期</th>
      <th>操作</th>
    </tr>
    <tr>
      <td>第一篇文章</td>
      <td>2016.12.01</td>
      <td>
        <span class="btn btn-primary">編輯</span>
        <span class="btn btn-danger">刪除</span>
      </td>
    </tr>
    <tr>
      <td>第二篇文章</td>
      <td>2016.12.02</td>
      <td>
        <span class="btn btn-primary">編輯</span>
        <span class="btn btn-danger">刪除</span>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
</body>
</html>