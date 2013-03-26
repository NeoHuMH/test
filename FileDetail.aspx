<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileDetail.aspx.cs" Inherits="qiniuDemo.FileDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<a href="/FileUpLoad.aspx">返回上传页面</a>
    <br />
    <br />
    <br />
    <div>
    <%--<a href="http://sean1194.qiniudn.com/8-布局的嵌套.avi?avthumb/mp4/r/30/vb/256k/vcodec/libx264/ar/22050/ab/64k/acodec/libmp3lame" title="参数对照
    http://sean1194.qiniudn.com/8-布局的嵌套.avi?avthumb/mp4/r/30/vb/256k/vcodec/libx264/ar/22050/ab/64k/acodec/libmp3lame
    地址?MP4格式/帧率30/视频比特率 256k/使用 x264 进行视频编码/音频采样频率 22050/音频比特率 64k/使用 mp3 进行音频编码"><img alt="8-布局的嵌套" src="http://sean1194.qiniudn.com/8-布局的嵌套.avi?vframe/jpg/offset/1/w/120/h/120" />
    
    </a>--%>

    </div>

    <div>
    <a href="http://sean1194.qiniudn.com/formp47.mp4?avthumb/mp4/r/30/vb/256k/vcodec/libx264/ar/22050/ab/64k/acodec/libmp3lame" title="参数对照
    http://sean1194.qiniudn.com/formp47.mp4?avthumb/mp4/r/30/vb/256k/vcodec/libx264/ar/22050/ab/64k/acodec/libmp3lame
    地址?MP4格式/帧率30/视频比特率 256k/使用 x264 进行视频编码/音频采样频率 22050/音频比特率 64k/使用 mp3 进行音频编码"><img alt="8-布局的嵌套" src="http://sean1194.qiniudn.com/formp47.mp4?vframe/jpg/offset/1/w/120/h/120" />
    </a>
    </div>
<script type='text/javascript' src='/Scripts/jwplayer.js'></script>

<div id='mediaspace'>This text will be replaced</div>

<script type='text/javascript'>
    jwplayer('mediaspace').setup({
        'flashplayer': 'http://www.longtailvideo.com/support/player.swf',
        'file': 'http://sean1194.qiniudn.com/formp47.mp4?avthumb/mp4/r/30/vb/256k/vcodec/libx264/ar/22050/ab/64k/acodec/libmp3lame',
//        'duration': ,
        'controlbar': 'bottom',
        'width': '500',
        'height': '500'
    });
</script>

    </form>
</body>
</html>
