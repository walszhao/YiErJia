$(function() {  
      
    var address = $("#pro_city");  
    var province = $("#province");  
    var city = $("#city");  
    var area = $("#area");  
    var preProvince = "<option value=\"\">选择省（市）</option>";  
    var preCity = "<option value=\"\">选择市（区）</option>";  
    var preArea = "<option value=\"\">选择区（县）</option>";  
      
    //初始化  
    province.html(preProvince);
    city.html(preCity);  
    area.html(preArea);  
      
    //文档加载完毕:即从province_city_select_Info.xml获取数据,成功之后采用  
    //func_suc_getXmlProvice进行 省的 解析  
    $.ajax({  
        type : "GET",  
        url : "js/province_city_select_Info.xml",  
        success : func_suc_getXmlProvice  
    });  
      
    //省 下拉选择发生变化触发的事件  
    province.change(function() {
        //province.val()  : 返回是每个省对应的下标,序号从0开始  
        if (province.val() != "") {
            city.html(preCity);  
              
            //根据下拉得到的省对于的下标序号,动态从从province_city_select_Info.xml获取数据,成功之后采用  
            //func_suc_getXmlProvice进行省对应的市的解析  
            $.ajax({  
                type : "GET",  
                url : "js/province_city_select_Info.xml",  
                success : func_suc_getXmlCity  
            });  
              
        }  
    });  
      
    //市 下拉选择发生变化触发的事件  
    city.change(function() {  
        area.html(preArea);  
        $.ajax({  
            type : "GET",  
            url : "js/province_city_select_Info.xml",  
              
            //根据下拉得到的省、市对于的下标序号,动态从从province_city_select_Info.xml获取数据,成功之后采用  
            //func_suc_getXmlArea进行省对应的市对于的区的解析  
            success : func_suc_getXmlArea  
        });  
    });  
      
    //区 下拉选择发生变化触发的事件  
    area.change(function() {  
        var value = province.find("option:selected").text()  
                + city.find("option:selected").text()  
                + area.find("option:selected").text();  
        address.text(value);  
        //$("#txtProCity").val(value);
    });  
      
    //解析获取xml格式文件中的prov标签,得到所有的省,并逐个进行遍历 放进下拉框中  
    function func_suc_getXmlProvice(xml) {
        //jquery的查找功能 
        var sheng = $(xml).find("prov");  
          
        //jquery的遍历与查询匹配 eq功能,并将其放到下拉框中  
        sheng.each(function(i) {  
            province.append("<option value=" + i + ">"  
                    + sheng.eq(i).attr("text") + "</option>");  
        });
    }  
      
    function func_suc_getXmlCity(xml) {  
        var xml_sheng = $(xml).find("prov");  
        var pro_num = parseInt(province.val());  
        var xml_shi = xml_sheng.eq(pro_num).find("city");  
        xml_shi.each(function(j) {  
            city.append("<option  value=" + j + ">"  
                    + xml_shi.eq(j).attr("text") + "</option>");  
        });  
    }  
      
    function func_suc_getXmlArea(xml) {  
        var xml_sheng = $(xml).find("prov");  
        var pro_num = parseInt(province.val());  
        var xml_shi = xml_sheng.eq(pro_num).find("city");  
        var city_num = parseInt(city.val());  
        var xml_xianqu = xml_shi.eq(city_num).find("county");  
        xml_xianqu.each(function(k) {  
            area.append("<option  value=" + k + ">"  
                    + xml_xianqu.eq(k).attr("text") + "</option>");  
        });  
    }  
});  