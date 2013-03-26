<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpLoad.aspx.cs" Inherits="qiniuDemo.FileUpLoad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="qiniuDemo" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="/Scripts/jquery-1.4.1.js" type="text/javascript"></script>

<head runat="server">
    <title></title>
</head>
<body>
    <%--<form method="POST" enctype="multipart/form-data" action="http://up.qbox.me/upload" target="_parent">--%>
   <form>
   
        <a href="/FileDetail.aspx">已经上传的文件演示</a>
        <br />
        <br />
        <br />
    <div>
    <input type="hidden" name="auth" value="" />
    <input type="hidden" name="action" value="" />
    <input type="hidden" name="params" value="bucket=&key=" />
    <input name="file" type="file" />
    <input type="submit" value="Upload File" onclick="cd()"/>
    <script type="text/javascript">
        function cd() {
            var fileName = $("input[name='file']").val().replace(/\\/g, "/");
            if (fileName.length > 0) {
                fileName = fileName.indexOf('/') > 0 ? fileName.substring(fileName.lastIndexOf('/')+1) : fileName;
                $.ajax({
                    type: "GET",
                    contentType: "application/json; charset=UTF-8",
                    url: "/Service/Service.ashx",
                    data: "Method=UpLoadFile&key=" + fileName,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        $("input[name='auth']").val(data.upToken);
                        $("input[name='action']").val("/rs-put/" + data.entryUrl);
                        $("input[name='params']").val("bucket=" + data.bucketName + "&key=" + data.key);

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.readyState);
                        alert(errorThrown);
                    }
                });
                ///////
//                alert(2);
//                var _auth = $("input[name='auth']").val();
//                var _action = $("input[name='action']").val();
//                var _params = $("input[name='params']").val();
//                var _file = $("input[name='file']").val();
////                $.post("http://up.qbox.me/upload", {"auth":""+_auth+"", "action":""+_action+"", "params":""+_params+"", "file":""+_file+""}, 
////                function(data){alert{data};}, "json");
////                var param = '{"auth":"' + _auth + '", "action":"' + _action + '", "params":"' + _params + '", "file":"' + _file + '"}';
//                var param = 'auth=' + _auth + '&action=' + _action + '&params=' + _params + '&file=' + _file + '';
//                $.ajax({
//                    type: "POST",
//                    url: "http://up.qbox.me/upload",
//                    data: param,
//                    contentType: "application/text",
//                    async: false,
//                    dataType: "json",
//                    success: function (data) {
//                        alert("s");
//                        alert(data);
//                    },
//                    error: function (XMLHttpRequest, textStatus, errorThrown) {
//                        alert(XMLHttpRequest.readyState);
//                        alert(errorThrown);
//                        alert("f");
//                    }
//                });
            }
        }
    </script>

    </div>
    </form>
</body>
</html>
