 $.fn.timeTable = function(arguments) {
   var _self = this,
     colorArrays = ["#FF8B8B", "#61BFAD", "#E54B4B", "#32B67A", "#F0CF61", "#384D9D", "#0BBCD6", "#E29AAD"];

   _self.config = arguments || {};

   if (!_self.config.classNum) _self.config.classNum = "10";
   if (!_self.config.itemWidth) _self.config.itemWidth = "1.444"; /*rem*/
   if (!_self.config.itemHeight) _self.config.itemHeight = "1.36";

   drawTable();

   if (!_self.config.wlist) {
     return;
   }

   createClass(_self.config.wlist);

   function drawTable() {
     var timetable = document.createElement("table"),
       thead = document.createElement("thead"),
       tbody = document.createElement("tbody");

     thead.innerHTML = '<tr><th></th><th>周二</th><th>周三</th><th>周四</th><th>周五</th><th>周六</th><th>周日</th></tr>';
     var str = '';
     for (let i = 1; i <= _self.config.classNum; i++) {
		 if(i == 1){
			  str += '<tr><td>' + '9:00' + '</td>';
			  for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else if (i == 2){
			  str += '<tr><td>' + '10:00' + '</td>';
			   for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else if (i == 4){
			  str += '<tr><td>' + '13:00' + '</td>';
			   for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else if (i == 6){
			  str += '<tr><td>' + '15:00' + '</td>';
			   for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else if (i == 9){
			  str += '<tr><td>' + '18:45' + '</td>';
			   for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else if (i == 10){
			  str += '<tr><td>' + '19:00' + '</td>';
			   for (let j = 0; j < 5; j++) {
				 str += '<td></td>';
			   }
		 }else{
			 
		 }
       
       str += '</tr>';
     }
     tbody.innerHTML = str;
     timetable.append(thead);
     timetable.append(tbody);
     _self[0].append(timetable);
     _self[0].className += "tabletime";
   }

   function createClass(list) {
     for (let i = 0; i < list.length; i++) {
       addClass(list[i]);
     }
   }

   function addClass(obj) {
     var w = _self.config.itemWidth,
       h = _self.config.itemHeight,
       cheight = (obj.dur * h).toFixed(3),
       topstart = (0.667 + (obj.seq - 1) * h).toFixed(3),
       leftstart = (0.668 + (obj.week - 1) * w).toFixed(3);

     var iclass = document.createElement("div");
         var colorFlag = obj.evt;
       if(colorFlag.indexOf("硬笔书法") > -1){
           color = "#FF8B8B";
       }else if(colorFlag.indexOf("美术") > -1 || colorFlag.indexOf("动漫") > -1){
             color = "#F0CF61";
         }else if(colorFlag.indexOf("舞蹈") > -1){
             color = "#af93db";
         }else if(colorFlag.indexOf("故事") > -1 || colorFlag.indexOf("主持人") > -1){
           color = "#0BBCD6";
         }else if(colorFlag.indexOf("围棋") > -1){
             color = "#61BFAD";
         }
      // color = setColor();

     iclass.className += "classitem";
     iclass.innerHTML = obj.evt || "";
     iclass.setAttribute("style", "height:" + cheight + "rem;top:" + topstart + "rem;left:" + leftstart + "rem;background-color:" + color+";padding-top:3%;padding-left:1%");

     _self[0].append(iclass);
   }

   function setColor() {
     var num = randomNum(0, colorArrays.length);
     var color = colorArrays[num] || colorArrays[0];
     return color;
   }

   function randomNum(minNum, maxNum) {
     switch (arguments.length) {
       case 1:
         return parseInt(Math.random() * minNum + 1, 10);
         break;
       case 2:
         return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
         break;
       default:
         return 0;
         break;
     }
   }
 };