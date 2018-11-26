<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
    font-size: 30px !important;
}

#emplName{
    font-size: 20px;
}
.btn-sm {
    width : 80px;
    margin-right:5px; 
}
label {
    font-size: 20px !important;
}
.col-md-11 {
    margin: 10px;
}

/*  .row { */
/*     margin-right:50px;  */
/*     margin-left:50px;  */
/*  } */
img{
    display: table-cell;
}

.modalTxt{
    font-size: 20px;
}

.hoverImg {
   padding-left : 30px;
    width: 25px;
    height: 25px;
}

.hoverImg img:last-child{
    display: none;
}

.hoverImg:hover img:first-child{
    display: none;
}
.hoverImg:hover img:last-child{
    display: inline-block;
}

.modal-dialog{
    width:500px;
    height:1000px;
}

.btn btn-primary{
        font-size: 20px;
}

input[type=checkbox]
{
     width:70px;
    transform: scale(1.5);
    float: right;
}
</style>


<script>
function onoff(){
    ele = document.getElementById("check2");
    ele2 = document.getElementById("check1");
            
    if(ele.src.match("check2")){
        ele.src = "${pageContext.request.contextPath }/images/icons/checkmark1.png";
        ele2.src = "${pageContext.request.contextPath }/images/icons/checkmark2.png";
        
    }else{
        ele.src = "${pageContext.request.contextPath }/images/icons/check2.png";
        ele2.src = "${pageContext.request.contextPath }/images/icons/check1.png";
    }
    
}

</script>  


    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row" >
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <b class="box-title">회의 상세내용</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
<!--              <form role="form"> -->
                <!-- text input -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label" >회의제목</label>
                  <div class="col-sm-8" >
                    <input type="email" class="form-control" id="inputEmail3" style="border-radius: 1em;" placeholder="회의제목">
                  </div>
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련프로젝트</label>
                     <div class="col-sm-8"  align="center">
                    <select class="form-control select2" style="border-radius: 1em;" >
                      <option selected="selected">선택하세요</option>
                      <option>정부청사 통합시스템 유지보수</option>
                      <option>식약청 구축 1단계</option>
                      <option>질병관리본부 유지보수</option>
                    </select>
                     </div>
                 </div>
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">개설일자</label>
                  <div class="col-sm-3">
                    <input type="email" class="form-control" id="inputEmail3" style="border-radius: 1em;" placeholder="시작시간">
                  </div>   <label for="inputEmail3" class="col-sm-1 control-label" >  ~</label>
                  <div class="col-sm-3"  align="center">
                    <input type="email" class="form-control" id="inputEmail3"  style="border-radius: 1em;" placeholder="종료시간">
                  </div>                  
                </div>
                <br/><br/><br/>
                
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">참여인원</label>
                      <button  id="btn1" type="button" style="width:15%;" class="btn btn-block btn-info" data-toggle="modal" data-target="#modal1">+ 직원 조회</button>
                  </div>
                  
                  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> </label>
                  <div class="col-sm-8"  align="center" style="width:68%; height: auto; border: 1px solid #d2d2d2; border-radius: 1em;">
                    <table >
                    
                            <tr >
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">김동동</td>
                                
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">이동동</td>
                                
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">최동동</td>
                            </tr>
                            <tr >
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">김동동</td>
                                
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">이동동</td>
                                
                                <td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                                <td width="200" height="50">최동동</td>
                                
                            </tr>
                    </table>
<!--                     <input type="email" class="form-control" id="inputEmail3" placeholder="참여인원"> -->
                  </div>
                  </div>
                <br/><br/><br/><br/> <br/> <br/> <br/>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">회의내용</label>
                  <textarea class="col-sm-10" rows="10" placeholder="회의내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
                </div>
               <br/><br/>
                <div class="form-group">
                     <label for="inputEmail3" class="col-sm-2 control-label">첨부파일:</label>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
            
<!--            <!-- Indicators --> 
<!--                        <ol class="carousel-indicators"> -->
<!--                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--                            <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--                        </ol> -->
<!--            <!-- Wrapper for slides --> 
                    </div>
            <!-- Left and right controls -->
                        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>
                </div>
<!--               </form> -->
                <div class="box-footer clearfix">
                <div class="col-sm-10">
                <input value="다음" type="button" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;"  class="btn btn-info btn-lg btn-flat pull-right">
                </div>
                </div>
                </div>
          <!-- /.box -->
        </div>
        </div>
    </section>
    
    
<!-- 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content"   >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title" id="exampleModalLabel">직원 조회</h3>
      </div>
      <div class="modal-body" style=" border-top:1px solid orange;">
         <div  class="row" style="padding-left:35px">
           <select class="col-sm-3" style="margin:5px; height:30px;" >
            <option selected="selected">분류</option>
            <option>DA</option>
            <option>UA</option>
            <option>AA</option>
            <option>TA</option>
            <option>BA</option>
           </select>
           <input class="col-sm-4"type="text" style="margin:5px; height:30px;">
           <button class="col-sm-2" class="btn btn-flat" style="margin:5px; height:30px;">검색</button>
           </div >
            <div  class="row"  style="padding:30px;">
                <div class="form-group">
                 <table class="modalTxt" >
                       <tr >
                           <td class="hoverImg" width="70" height="50">
                                <img id="check1" src="${pageContext.request.contextPath }/images/icons/check1.png" >
                                <img id="check2" onclick="onoff()" src="${pageContext.request.contextPath }/images/icons/check2.png" >
                            </td>
                           <td width="70" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" > </td>
                           <td width="200" height="50">김동동</td>
                       </tr>
                       

                      
                    </table>
              </div>                
             </div>


         
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">추가</button>
      </div>
    </div>
  </div>
  </div>
</div>
</div>