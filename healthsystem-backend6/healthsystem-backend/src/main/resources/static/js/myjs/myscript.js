// 此文件保存一些公共的方法
// 使用方法：记得在需要用到此脚本的地方 加入下面这一行，当然位置可能需要相应改变(一般要先引入 Layui)
// <script src="../js/myjs/myscript.js"></script>

// 用于处理 后端shiro异常时，弹出公告，进行重新登陆
function reLoginForShiroExecption() {
    layer.open({
        type: 1
        , title: false //不显示标题栏
        , closeBtn: false
        , area: '300px;'
        , shade: 0.8
        , id: 'LAY_layuipro' //设定一个id，防止重复弹出
        , btn: ['重新登陆']
        , btnAlign: 'c'
        , moveType: 1 //拖拽模式，0或者1
        , content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">亲！登录信息失效，请重新登陆<br><br> ^_^</div>'
        , success: function (layero) {
            var btn = layero.find('.layui-layer-btn');
            btn.find('.layui-layer-btn0').attr({
                href: 'login.html'
                , target: '_self'
                // , target: '_blank'
            });
        }
    });
}

// 从localStorage获得token
function getToken() {
    var localHealthSystem = layui.data('HealthSystem');
    return localHealthSystem.Authorization
}

function getUserInfo() {
    var localHealthSystem = layui.data('HealthSystem');
    return localHealthSystem.UserInfo
}

// 从出生日期计算 年龄
function jsGetAge(strBirthday) { //传入形式yyyy-MM-dd
    //strBirthday = util.formatTime(strBirthday);转换成yyyy-MM-dd形式
    var returnAge
    var strBirthdayArr = strBirthday.split('-')
    var birthYear = strBirthdayArr[0]
    var birthMonth = strBirthdayArr[1]
    var birthDay = strBirthdayArr[2]
    var d = new Date()
    var nowYear = d.getFullYear()
    var nowMonth = d.getMonth() + 1
    var nowDay = d.getDate()
    if (nowYear == birthYear) {
        returnAge = 0 //同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear //年之差
        if (ageDiff > 0) {
            if (nowMonth == birthMonth) {
                var dayDiff = nowDay - birthDay //日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1
                } else {
                    returnAge = ageDiff
                }
            } else {
                var monthDiff = nowMonth - birthMonth //月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1
                } else {
                    returnAge = ageDiff
                }
            }
        } else {
            returnAge = -1 //返回-1 表示出生日期输入错误 晚于今天
        }
    }
    return returnAge //返回周岁年龄
}

// 标注单个用户
function editDepressed(data, token, obj, $) {
    layer.prompt({
        formType: 2
        ,title: '修改姓名为 ['+ data.realName +'] 的 抑郁程度为'
        , shadeClose : true // 点击遮罩关闭
        ,value: data.depressed
    }, function(value, index){
        // 点击确定才会进入下面
        layer.close(index);

        var newDepressed = value;
        var newRemark = $("#zxr2").val();
        // console.log(newDepressed);
        // console.log(newRemark);

        var userIdList = [];
        // 组装 userIdList
        if(data.length == null){
            userIdList.push(data.userId);
        } else {
            data.forEach(function (item) {
                userIdList.push(item.userId);
            })
        }
        console.log(userIdList);

        //这里一般是发送修改的Ajax请求
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/doctor/updateDepressedInfo",
            headers: {
                Authorization: token
            },
            data: JSON.stringify({
                "depressed": newDepressed,
                "remark": newRemark,
                "userIdList": userIdList
            }),
            contentType: "application/json;charset=UTF-8",//指定消息请求类型
            success: function (data,status) {
                if(data.code == 200) {
                    //同步更新表格和缓存对应的值
                    console.log(obj);
                    obj.update({
                        depressed: value,
                        remark: newRemark
                    });
                } else if(data.code == 401) {
                    reLoginForShiroExecption();
                } else {
                    layer.alert('错误代码：' + data.code + '==>' + data.message + ', 请联系后台管理员');
                }
            }
        });
    });
    $(".layui-layer-content").append("<br/><textarea type=\"text\" id= \"zxr2\" class=\"layui-textarea\" placeholder=\"请输入备注信息\"/></textarea>")
    $("#zxr2").text(data.remark);
}

// 批量标注用户
function markUser(data, token, tableIns, $) {
    layer.prompt({
        formType: 2
        , shadeClose : true // 点击遮罩关闭
        ,title: '批量标注 ['+ data.length +'] 位用户的抑郁程度为'
    }, function(value, index){
        // 点击确定才会进入下面
        layer.close(index);

        // 组装数据
        var newDepressed = value;
        var newRemark = $("#zxr2").val();
        var userIdList = [];
        // 组装 userIdList
        if(data.length == null){
            userIdList.push(data.userId);
        } else {
            data.forEach(function (item) {
                userIdList.push(item.userId);
            })
        }
        console.log(userIdList);
        // 数据组装完成

        //这里一般是发送修改的Ajax请求
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/doctor/updateDepressedInfo",
            headers: {
                Authorization: token
            },
            data: JSON.stringify({
                "depressed": newDepressed,
                "remark": newRemark,
                "userIdList": userIdList
            }),
            contentType: "application/json;charset=UTF-8",//指定消息请求类型
            success: function (data,status) {
                if(data.code == 200) {
                    //同步更新表格和缓存对应的值
                    // 只能用这种方法刷新了，好在效果不错
                    tableIns.reload({});
                } else if(data.code == 401) {
                    reLoginForShiroExecption();
                } else {
                    layer.alert('错误代码：' + data.code + '==>' + data.message + ', 请联系后台管理员');
                }
            }
        });
    });
    $(".layui-layer-content").append("<br/><textarea type=\"text\" id= \"zxr2\" class=\"layui-textarea\" placeholder=\"请输入备注信息\"/></textarea>")

}
