<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/style/public/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/style/public/meta.jsp"%>
<link href="${ctx}/style/css/form.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/style/public/multiselect.min.js"></script>
<title>${sys_title}</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章抓取</title>
</head>
<body>

<div style="margin-left: 42%;margin-top: 2%; width: 15%;">
<input class="btn btn-danger" type="button" id="timer" onclick="removeQuartz('抓取文章')" value="开启用户分润" style="margin-top: 1%;margin-left: 26%;"/> 
<hr/>
<input class="btn btn-info" type="button" id="openVideo" onclick="startQuartz('抓取视频')" value="开启抓取视频"/>
<input class="btn btn-info" type="button" id="closeVideo" onclick="removeQuartz('抓取视频')" value="关闭抓取视频"/>  <hr/>
<input class="btn btn-info" type="button" id="openArticle" onclick="startQuartz('抓取文章')" value="开启抓取文章"/>
<input class="btn btn-info" type="button" id="closeArticle" onclick="removeQuartz('抓取文章')" value="关闭抓取文章"/>   <hr/>
<input class="btn btn-info" type="button" id="openVipLogin" onclick="startQuartz('霸屏')" value="开启会员霸屏"/>
<input class="btn btn-info" type="button" id="closeVipLogin" onclick="removeQuartz('霸屏')" value="关闭会员霸屏"/>   <hr/>

</div>



</body>
<script type="text/javascript">

$(document).ready(function(){
	$.ajax({
		type:"GET",
		url:"${ctx}/sys/findQuartz",
		success:function(data){
			if(data.video==0){
				$("#openVideo").attr("disabled",false);
				$("#closeVideo").attr("disabled",true);
			}
			if(data.video==1){
				$("#openVideo").attr("disabled",true);
				$("#closeVideo").attr("disabled",false);
			}
			if(data.article==0){
				$("#openArticle").attr("disabled",false);
				$("#closeArticle").attr("disabled",true);
			}
			if(data.article==1){
				$("#openArticle").attr("disabled",true);
				$("#closeArticle").attr("disabled",false);
			}
			if(data.VIPLogin==0){
				$("#openVipLogin").attr("disabled",false);
				$("#closeVipLogin").attr("disabled",true);
			}
			if(data.VIPLogin==1){
				$("#openVipLogin").attr("disabled",true);
				$("#closeVipLogin").attr("disabled",false);
			}
			if(data.timer==1){
				$("#timer").attr("disabled",true);
			}
		}
	})
})

function startQuartz(data){
	var time="";
	if(data=="抓取文章"||data=="抓取视频"){
		  time = "0 0/10 * * * ?";
	}
	if(data=="霸屏"){
		  time = "0 0/15 * * * ?";
	}
	$.ajax({
		type:"GET",
		url:"${ctx}/sys/startQuartz?jobName="+data+"&jobGroup=1&time="+time,
		success:function(data){
			location.reload();
			alert(data.msg);
		}
	});
}

function removeQuartz(data){
	$.ajax({
		type:"GET",
		url:"${ctx}/sys/removeQuartz?jobName="+data+"&jobGroup=1",
		success:function(data){
			location.reload();
			alert(data.msg);
		}
	});
}

</script>
</html>