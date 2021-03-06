<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <style>
 html,body{
  height : 100%;
  width : 100%;
}
 
#myChart{
  height : 100%;
  width : 100%;
}
 
 </style>
<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script> 
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
</script>
<script src="https://cdn.zingchart.com/modules/zingchart-dragging.min.js"></script>
<script type="text/javascript">

$(function(){
	var ganttData = [
	{
	  id : 'Market Research',
	  start : "10/2/15",
	  end : "10/10/15",
	  progress : "10%",
	  next : 'R&D',
	  type : 'standard'
	},
	 {
	   id : 'R&D',
	   start : "10/14/15",
	   end : "10/28/15",
	   progress : 0.9,
	   slack : "10/30/15",
	   type : 'critical',
	 },
	 {
	   id : 'Funding',
	   start : "10/21/15",
	   end : "10/31/15",
	   progress : 0.2,
	   next : "Marketing",
	   type : 'critical',
	 },
	 {
	   id : 'Marketing',
	   start : "10/25/15",
	   end : "11/5/15",
	   progress : 0.9,
	   next : "Development",
	   type : 'standard'
	 },
	 {
	   id : 'Development',
	   start : "10/5/15",
	   end : "10/20/15",
	   progress : 0.7,
	   next : null,
	   type : 'critical'
	 },
	 {
	   id : 'Testing',
	   start : "10/15/15",
	   end : "10/18/15",
	   progress : 1,
	   next : null,
	   type : 'standard'
	 },
	 {
	   id : 'Beta Testing',
	   start : "10/8/15",
	   end : "10/16/15",
	   progress : 0.2,
	   next : null,
	   type : 'standard'
	 },
	 {
	   id : 'Release',
	   start : "10/15/15",
	   end : "10/18/15",
	   progress : 0.1,
	   slack : "10/18/15",
	   next : 'donghwa',
	   type : 'project1'
	 },
	 {
       id : 'donghwa',
       start : "10/20/15",
       end : "10/23/15",
       progress : 0.1,
       slack : "10/25/15",
       next : null,
       type : 'project1'
	     }
	 ]
	;
	
	var palette = {
	 // critical : ["#F44336","#EF9A9A"],
	 // standard : ["#2196F3","#90CAF9"],
	 // project1 : ["#4CAF50","#A5D6A7"]
	 critical : ["#D31E1E", "#ea7a7a"],
	 standard : ["#29A2CC", "#7ecce7"],
	 project1 : ["#7CA82B", "#b1e159"]
	};
	
	var projectNames = [];
	function createTimeline(arr){
	var series = [];
	var scaleYIndex = 0;
	
	var map = {};
	 for(var i = 0; i < arr.length; i++){
	   
	   //Convert date to ms
	   arr[i].start = Date.parse(arr[i].start);
	   arr[i].end = Date.parse(arr[i].end);
	   map[arr[i].id] ={
	     start : arr[i].start,
	     end : arr[i].end,
	     index : scaleYIndex
	   };
	   
	   //Convert percent to float
	   if(typeof arr[i].progress === 'string'){
	     arr[i].progress = parseFloat(((arr[i].progress.slice(0,(arr[i].progress).length-1)/100) ).toFixed(2));
	   }
	
	    if(arr[i].progress === 0 ){
	      series.push({
	        values : [[arr[i].start, scaleYIndex], [arr[i].end, scaleYIndex]],
	        lineColor : palette[arr[i].type][1],
	        tooltip : {
	          text : arr[i].id + " : Not started"
	        }
	      })
	    }
	    else if(arr[i].progress === 1){
	      series.push({
	        values : [[arr[i].start, scaleYIndex], [arr[i].end, scaleYIndex]],
	        lineColor : palette[arr[i].type][0],
	        tooltip : {
	          text : arr[i].id + " : Completed"
	        },
	      })
	    }
	    else{
	      var progressDate = arr[i].start +  (arr[i].progress * (arr[i].end - arr[i].start));
	      var progressStart = {
	        values : [[arr[i].start, scaleYIndex], [progressDate, scaleYIndex]],
	        lineColor : palette[arr[i].type][0],
	        tooltip : {
	          text : arr[i].id + " \n Complete : " + ((arr[i].progress).toFixed(2) * 100) + "%" + "\n" + unixToDate(arr[i].start) + " to " +unixToDate(arr[i].end)
	        },
	        "data-dragging" : true,
	      };
	      var progressEnd = {
	        values : [[progressDate, scaleYIndex], [arr[i].end, scaleYIndex]],
	        lineColor : palette[arr[i].type][1],
	        tooltip : {
	          text : arr[i].id + " \n Incomplete : " + ((1-arr[i].progress).toFixed(2) * 100) + "%"+ "\n" + unixToDate(arr[i].start) + " to " +unixToDate(arr[i].end)
	        },
	        "data-dragging" : true,
	      };
	      //Reversed order for tooltip mapping
	      series.push(progressEnd);
	      series.push(progressStart);
	    }
	    if(arr[i].slack){
	      //Draw a line from the end to the slack date.
	      var slack = {
	        values : [ [arr[i].end, scaleYIndex], [Date.parse(arr[i].slack), scaleYIndex] ],
	        lineColor : "#515151",
	        lineWidth : "1px",
	        tooltip : {
	          text : "Slack : " + arr[i].slack
	        }
	      };
	      series.push(slack);
	    }
	    projectNames[scaleYIndex -1] = "";
	    projectNames[scaleYIndex] = arr[i].id;
	    
	    scaleYIndex += 2;
	  }
	  //Need to loop through a map and draw arrows!
	  //Testing : Pushing a line from market research to R&D
	  
	  for(var i = 0; i < arr.length; i++){
	    var connector = {
	      lineWidth : "1px",
	      lineColor : "#3c3c3c",
	      lineStyle : "dashed",
	      shadow : false,
	      tooltip : {
	        text : ""
	      },
	      marker : {
	        type : 'triangle',
	        borderWidth : 0,
	        angle : 90,
	        rules : [
	          {
	            rule : "%i == 5",
	            offsetX :-6,
	            size : 5,
	            visible : true,
	            backgroundColor : "#3c3c3c"
	          }
	        ]
	      }
	    };
	    if(arr[i].next){
	      
	      //Build connector line
	      var unit = 86400000; //day in ms
	      var values = [];
	      var current = map[arr[i].id];
	      var next = map[arr[i].next];
	      values.push([current.end, current.index]);
	      values.push([current.end + unit, current.index]);
	      connector.tooltip.text = "From " + arr[i].id + "\n to " + arr[i].next;
	      //TODO : Calculate a back movement?
	      if(current.end > next.start){
	        values.push([current.end + unit, current.index + 1]);
	        values.push([next.start - (unit), current.index + 1]);
	        values.push([next.start - (unit), next.index]);
	        values.push([next.start, next.index]);
	      }
	      else{
	        values.push([current.end + unit, next.index]);
	        values.push([next.start - unit + unit, next.index]);
	        connector.marker.rules[0].rule = "%i == 3";
	      }
	 
	      connector.values = values;
	      series.unshift(connector)
	    }
	    // series.push({
	    //   values : [[5,0], [6,0], [6,1], [1,1], [1,2], [2,2]],
	    //   lineWidth : "1px",
	    //   lineColor : "#3c3c3c",
	    //   lineStyle : "dashed",
	    //   shadow : false,
	    //   tooltip : {
	    //     text : "connector"
	    //   }
	    // });
	  }
	 
	  //Create dependency links
	  return series;
	  
	  function unixToDate(unix){
	     var date = new Date(unix);
	      return (date.getMonth()+1) + "/" + date.getDate() + "/" + date.getFullYear();
	  }
	}
	 
	var myConfig = {
	    type: "line", 
	    theme : 'light',
	    plot :{
	      lineWidth : 20,
	      marker : {
	        visible : false
	      },
	    },
	    globals : {
	      shadow : false
	    },
	    plotarea : {
	       maskTolerance : 80,
	       marginTop : "20",
	       marginBottom : "50",
	       marginLeft : "dynamic",
	       marginRight : "dynamic",
	    },
	    scrollX:{},
	    scaleX : {
	      zooming : true,
	      placement : "opposite",
	    minValue : Date.parse("10/1/15"),
	    step : "day",
	      item : {
	        //visible : false
	      },
	      guide : {
	        lineWidth : "1px"
	      },
	      tick : {
	        visible : false
	      },
	      transform : {
	        type : "date",
	        text : "%M-%d"
	      }
	    },
	    scaleY : {
	      itemsOverlap : true,
	    labels : projectNames,
	      offset : 25,
	      mirrored : true,
	      guide : {
	        visible : true,
	        lineWidth : 1,
	        lineStyle : "solid",
	        rules : [
	          {
	            rule : "%v % 2 === 0",
	            visible : false
	          }
	        ]
	      },
	      minorTicks : 1,
	      minorTick : {
	        visible : false
	      },
	      tick : {
	        visible : false
	      }
	    },
	  series : createTimeline(ganttData)
	};
	 
	calculateLineWidth(myConfig);
	 
	function calculateLineWidth(dataset){
	    var chart = document.getElementById('myChart');
	    var data = zingchart.exec('myChart', 'getdata');
	    var width = (chart.clientHeight-50) / dataset.series.length;
	    dataset.plot.lineWidth = Math.floor(width);
	    
	    dataset.plot.lineWidth = Math.min(dataset.plot.lineWidth , 50);
	}
	 
	window.addEventListener('resize', function(){
	  calculateLineWidth(myConfig);
	  zingchart.resize = function(p){
	    zingchart.exec('myChart', 'setdata', {
	      data : myConfig
	    });
	  };
	});
	 
	zingchart.render({ 
	    id : 'myChart', 
	    data : myConfig, 
	    height: "100%", 
	    width: "100%",
	    modules : "dragging"
	});
	
});
</script>
 </head>
 <body>
     <div id='myChart' style="height: 100%; width: 100%;"></div>
 </body>
</html>
