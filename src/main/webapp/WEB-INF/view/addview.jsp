<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>686 Adminize</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript">
        $(function () {

            var flocal=$("#flocal")
            var cssid=$("#csid")
            flocal.change(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/view/getSecondLocal.do",
                    type:"post",
                    data:{
                        fid:flocal.val(),
                    },
                    dataType:"json",
                    success:function (data) {
                        var secondlist=eval(data);
                        cssid.empty()
                        $.each(secondlist,function (key,value) {
                            cssid.append("<option value='"+value.sid+"'>"+value.slocal+"</option>");
                        })
                    }
                })

            })
        })
    </script>
    <script type="text/javascript">
        $(function () {
            $(".selector").val("${product.fid}");
            $("#psex").val("${product.viewplace}");
            $("#csid").empty();
            // 实际的应用中，这里的option一般都是用循环生成多个了
            <c:forEach items="${two}" var="t">

            var option = $("<option>").val(${t.sid}).text("${t.slocal}");
            $("#csid").append(option);
            </c:forEach>
            $("#csid").val("${product.viewplace}");
            /*$(".selector").find("option[text='特步']").attr("selected",true);*/
        })
    </script>
        <script type="text/javascript">
            function delimg(imgaddress){
                var imgid = imgaddress;
                $.ajax({
                    url:'${pageContext.request.contextPath}/view/delImg.do',
                    type:"post",
                    data:{
                        id:imgid
                    },
                    dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text

                    success:function(a){
                        //alert(imgid)
                        //请求成功的处理
                        //或的页面标签 imglab，并利用attr设置他的属性，括号内第一个是属性名，第二个是属性值
                        if(a="ok"){
                            $("#"+imgid).remove();
                            $("#a"+imgid).remove();
                        }
                    },

                })

            }
        </script>

</head>
<body>

<div class="container">

    <div class="row">

        <div class="span2">

            <div class="main-left-col">

                <h1>
                    <i class="icon-shopping-cart icon-large"></i> Adminize
                </h1>

                <ul class="side-nav">

                    <li class="active">
                        <a href="${pageContext.request.contextPath}/user/tobackindex.do"><i class="icon-home"></i> 个人信息</a>
                    </li>
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath}/view/toaddview.do"><i
                                class="icon-sitemap"></i> 景点添加 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown"
                           href="${pageContext.request.contextPath}/adminbackground/tobackorders.do"><i class="icon-shopping-cart"></i> 订单管理
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown"
                           href="${pageContext.request.contextPath}/product/tobackProduct.do"><i class="icon-signal"></i> 商品管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown"
                           href="${pageContext.request.contextPath}/user/tobackuser.do"><i
                                class="icon-group"></i> 用户管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#settings-dropdown"
                           href="${pageContext.request.contextPath}/DepartmentList"><i class="icon-cogs"></i> 部门管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown"
                           href="${pageContext.request.contextPath}/News"><i class="icon-info-sign"></i> 新闻查看 </a>
                    </li>
                </ul>

            </div>
            <!-- end main-left-col -->

        </div>
        <!-- end span2 -->

        <div class="span10">

            <div class="secondary-masthead">

                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/#"><i class="icon-globe"></i> View Website</a></li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="${pageContext.request.contextPath}/#"><i
                            class="icon-user"></i>
                        John Smith <b class="caret"></b> </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/profile.jsp">Your Profile</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/form.jsp">Account
                                Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/">Logout</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/#">Admin</a> <span class="divider">/</span></li>
                    <li class="active">Dashboard</li>
                </ul>

            </div>

            <div class="main-area dashboard">


                <div class="row">

                    <div class="span10">

                        <div class="slate">

                            <div class="page-header">
                                <h2>商品信息添加</h2>
                            </div>
                            <form class="form-horizontal" id="myfrom" name="theform" action="" method="post" enctype="Multipart/form-data">
                                <fieldset>
                                    <div class="control-group">
                                       <span style="color: #FF7E00">景点名称：</span> <input type="text" name="viewname" value="${product.viewname}" style="height: 30px;border-color: #FF7E00">
                                            <input type="hidden" name="id" value="${product.id}">
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00"> 景点描述：</span><input type="text" name="viewdescription" value="${product.viewdescription}" style="height: 30px;width: 500px;border-color: #FF7E00">
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #BB2B51">门票价格：</span><input type="text" name="viewprice" value="${product.viewprice}" style="height: 30px;width: 100px;border-color: #BB2B51"> 人民币
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #4cae4c">会员价格：</span><input type="text" name="memberprice" value="${product.memberprice}" style="height: 30px;width: 100px;border-color: #4cae4c"> 人民币
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #0e90d2">搜索次数：</span><input type="text" name="hot" value="${product.hot}" style="height: 30px;width: 100px;border-color: #0e90d2">(可设置上架前商品被搜索次数)
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00">门票数量：</span><input type="text" name="number" value="${product.number}" style="height: 30px;width: 100px;border-color: #FF7E00"> 张
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00">景点位置：</span>
                                        <select class="selector" id="flocal" name="Fplace" style="border-color: #FF7E00">
                                            <option value="0">请选择</option>
                                            <option value="1">东北地区</option>
                                            <option value="2">西北地区</option>
                                            <option value="3">东南地区</option>
                                            <option value="4">西南地区</option>
                                    </select>
                                    </div>

                                    <div class="control-group">
                                        <span id="two" style="color: #FF7E00">城市名称：</span>
                                        <select id="csid" name="viewplace" style="border-color: #FF7E00">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                    <div class="control-group" style="width: 300px">
                                        <c:forEach items="${image}" var="img" varStatus="vs">
                                            <c:if test="${!empty img.path}">
                                                <img src="${pageContext.request.contextPath}/${img.path}" id="${product.id}" height="120" width="120"><span class=' closeimg0 close' id="a${product.id}" onclick="delimg('${product.id}')">×</span></br>
                                            </c:if>
                                        </c:forEach>
                                        <div class='upimgcontent' style="margin: 0px auto; width: 990px;">
                                            <div class="fileinput-wrap">
                                                <span style="color: #0e90d2">预览图：</span><input type="file" name="files" id="doc0" imgid="img0"
                                                       style="width: 100px;" onchange="javascript:setImagePreviews()" />
                                            </div>
                                            <div id="dd" style="width: 990px;"></div>
                                        </div>
                                    </div>
                                </fieldset>
                                <button class="btn btn-info" value="next" onclick="next()">下一步</button>
                               <%-- <a href="${pageContext.request.contextPath}/view/addviewMsg.do?end=end">--%>
                                <button class="btn btn-info" value="end" onclick="end()">完成</button>
                                <script type="text/javascript">
                                    function  next()
                                    {
                                        $("#myfrom").removeAttr('action');
                                        $("#myfrom").attr('action','${pageContext.request.contextPath}/view/addviewMsg.do');
                                        $("#myfrom").submit();
                                    }
                                    function  end()
                                    {
                                        $("#myfrom").removeAttr('action');
                                        $("#myfrom").attr('action','${pageContext.request.contextPath}/view/addviewMsg.do?end=end');
                                        $("#myfrom").submit();
                                    }
                                </script>
                            </form>

                        </div>
                    </div>

                    <div class="span10 listing-buttons">

                    </div>

                </div>

                <div class="row">

                    <div class="span10 footer">

                        <p>&copy; Website Name 2019</p>

                    </div>

                </div>

            </div>

        </div> <!-- end span10 -->

    </div> <!-- end row -->

</div> <!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script type="text/javascript">
    var magId=0;
    function setImagePreviews(){
        var docobj=document.getElementById("doc"+magId);
        var dd=document.getElementById("dd");
        var fileList=docobj.files;
        for( var i=0;i<fileList.length;i++){
            magId++;
            $(dd).append("<div class='img-wrap' imgid='img"+(magId-1)+"'><img id='img"+(magId-1)+"'/><span class=' closeimg"+(magId-1)+" close'>×</span></div>");
            $(".fileinput-wrap [imgid=img"+(magId-1)+"]")[0].style.position="absolute";
            $(".fileinput-wrap [imgid=img"+(magId-1)+"]")[0].style.left="-10000px";
            $(".fileinput-wrap").append('<input type="file" name="files" id="doc'+magId+'" imgid="img'+magId+'" style="width:100px;" onchange="javascript:setImagePreviews()" />');
            $(".closeimg"+(magId-1)).on("click",function(e){
                var id=$(this).parents(".img-wrap").attr("imgid");
                $(this).parent().remove();
                $(".fileinput-wrap input[imgid="+id+"]").remove();
            })
            var imgObjPreview=document.getElementById("img"+(magId-1));
            if(docobj.files&&docobj.files[i]){
                imgObjPreview.style.display="block";
                imgObjPreview.style.width="100px";
                imgObjPreview.style.height="120px";
                imgObjPreview.src=window.URL.createObjectURL(docobj.files[i]);
            }else{
                //IE
                docobj.select();
                var imgsrc=document.selection.createRange().text;
                var localImageId=document.getElementById("img"+(magId-1));
                localImageId.style.width="100px";
                localImageId.style.height="120px";
                try{
                    localIamgeId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localIamgeId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src=imgsrc;
                }catch(e){
                    alert("上传图片出错")
                    return false;
                }
                imgObjPreview.style.display="none";
                document.selection.empty();
            };
        }
        return true;
    };
</script>
</body>
</html>