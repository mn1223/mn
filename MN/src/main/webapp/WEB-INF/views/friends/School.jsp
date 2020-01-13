<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script type="text/javascript"> 

function SchoolSearch(){
	
}
 
  function createSchoolSearch(){
   var renderTo = $("#school-grid");  
   if(!podo.ui.exists(renderTo)){
    var observable = kendo.observable({
     gubun : "elem_list",
     region : "100260",
     name : "",
     search : function(){
      var $this = this;
      podo.ui.grid(renderTo).dataSource.read({
       name : $this.get('name'),
       gubun: $this.get('gubun'),
       region : $this.get('region')
      });
     }    
    }); 
 
    kendo.bind($('#search-block'), observable);
 
    podo.ui.grid(renderTo, {
     autoBind: false,
     dataSource: { 
      transport: {
             read: {
                 // the remote service url
                 url: "<@spring.url '/accounts/school/list.json'/>",     
                 type: "post",    
                 // the data type of the returned result
                 dataType: "json"
             }
            },
            // describe the result format
            schema: {
            // the data, which the data source will be bound to is in the "list" field of the response
             data : "items",
             total: "totalCount",
             model : {
              id : "seq",
              fields: {
               seq : {type: "number"},
               address:  { type: "string" },
               region:  { type: "string" },
               name:  { type: "string" },
              }
             }
         },
         pageSize: 15,
      serverPaging: true,
      error: podo.ui.handleAjaxError        
     },
     pageable: { refresh:true }, 
     filterable : false,
     height: 300,
     columns: [     
      { field: "name", title: "이름",  width:160}, 
      { field: "region", title: "지역",  width:100 },
      { field: "address", title: "주소" }
     ]   
 
    });
   }    
  }
  </script>
</head>
<body>
<div class="form-horizontal" id="search-block">

   <div class="margin-bottom-5">
    <select class="form-control form-group-margin" id = "gubun" name="gubun" placeholder="구분">
        <option value="elem_list">초등학교</option>
        <option value="midd_list">중학교</option>
        <option value="high_list">고등학교</option>
       </select>  
     </div>
 
<div class="margin-bottom-5">
<select class="form-control form-group-margin" id="region" name="region" placeholder="지역">
        <option value="">전체</option>
        <option value="100260">서울특별시</option>
        <option value="100267">부산광역시</option>
        <option value="100269">인천광역시</option>
        <option value="100271">대전광역시</option>
        <option value="100272">대구광역시</option>
        <option value="100273">울산광역시</option>
        <option value="100275">광주광역시</option>
        <option value="100276">경기도</option>
        <option value="100278">강원도</option>
        <option value="100280">충청북도</option>
        <option value="100281">충청남도</option>
        <option value="100282">전라북도</option>
        <option value="100283">전라남도</option>
        <option value="100285">경상북도</option>
        <option value="100291">경상남도</option>
        <option value="100292">제주도</option>
       </select>              
     </div>
 
<div class="margin-bottom-5">
<input class="form-control" id="name" placeholder="학교이름" type="text">
     </div>
<div class="margin-bottom-5">
<button class="btn btn-default" id = "search" type="button" onclick= "SchoolSearch()">검색</button>
     </div>
</div>
<div id="school-grid">
</div>

</body>
</html>