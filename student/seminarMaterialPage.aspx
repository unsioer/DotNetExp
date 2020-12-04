<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seminarMaterialPage.aspx.cs" Inherits="DotNetExp.student.seminar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>讨论课管理</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <!-- #include file="studentHeader.aspx" -->
        <div>
            <h1 class="page-header">文件上传</h1>
            <input type="file" id="avatar" name="avatar">
        </div>
        <button type="button">保存</button>

        <div class="alert" role="alert" id="result"></div>

        <!-- #include file="/footer.aspx" -->
    </div>
    <script type="text/javascript">
        $('button').click(function () {
            if ($('#avatar').prop('files')[0] == null) {
                alert('上传文件为空！');
            }
            else {
                var files = $('#avatar').prop('files');
                var data = new FormData();
                data.append('avatar', files[0]);
                $.ajax({
                    url: './upload.aspx',
                    type: 'POST',
                    data: data,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        console.log(data);
                        $("#result").text(JSON.stringify(data)).addClass("alert-success").removeClass("alert-danger");
                    },
                    error: function (err) {
                        console.error(err);
                        $("#result").html(err.responseText).removeClass("alert-success").addClass("alert-danger");
                    }


                });
            }
        });
    </script>
</body>
</html>
