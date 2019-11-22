var xhttp = new XMLHttpRequest();
	var txt;
	var ceramics;
	var totalLen;
	var perPage = 5;
	var totalPage;
	var pageNo;
	var currentPage = 1;
	var txt = "<tr><th>ID<th>產品名稱<th>設計者<th>生產日期<th>大小<th>價錢";
	xhttp.onload = function(){
		var xmlDoc = xhttp.responseXML;
		txt = "<tr><th>ID<th>產品名稱<th>設計者<th>生產日期<th>大小<th>價錢";
		ceramics = xmlDoc.getElementsByTagName("ceramic");
		totalLen = ceramics.length;
		totalPage = Math.ceil(totalLen / perPage);// 總頁數			
		viewCol(0, perPage);
			
			var pNos; 
			for(pageNo = 1; pageNo <= totalPage; pageNo++){
				pNos += "<option value='" + pageNo + "'>" + pageNo;
				//console.log(totalPage);
			}
		document.getElementById("pNos").innerHTML = pNos;
	}
	xhttp.open("Get", "res/book3.xml", true);
	xhttp.send();
	
	function viewCol(startInd, endInd){
		var contentTxt = txt;
		if(endInd <= totalLen){
			for(i = startInd; i < endInd; i++){  
				contentTxt += "<tr><td>" + ceramics[i].getAttribute("id");
				contentTxt += "<td>" + ceramics[i].getAttribute("title");
				contentTxt += "<td>" + ceramics[i].getAttribute("designer");
				contentTxt += "<td>" + ceramics[i].getAttribute("productDate");
				contentTxt += "<td>" + ceramics[i].getAttribute("size");
				contentTxt += "<td>" + ceramics[i].getAttribute("fobPrice");
			}
		}else{
			for(i = startInd; i < totalLen; i++){  
				contentTxt += "<tr><td>" + ceramics[i].getAttribute("id");
				contentTxt += "<td>" + ceramics[i].getAttribute("title");
				contentTxt += "<td>" + ceramics[i].getAttribute("designer");
				contentTxt += "<td>" + ceramics[i].getAttribute("productDate");
				contentTxt += "<td>" + ceramics[i].getAttribute("size");
				contentTxt += "<td>" + ceramics[i].getAttribute("fobPrice");
			}
		}
		
		document.getElementById("demo").innerHTML = contentTxt;
		console.log(startInd);
	}
	
	function gotoPage(){
		currentPage = document.getElementById("pNos").value;
		viewCol(perPage * (currentPage-1), perPage * currentPage);
		
	}
	
	function pageUp(){
		if(currentPage == 1){
			alert("This is the front page!");
		}else{
			currentPage = parseInt(currentPage) - 1;
			document.getElementById("pNos").value = currentPage;
			viewCol(perPage * (currentPage-1), perPage * currentPage);
		}//end of else	
	}//end of pageUp
	
	function pageDown(){
		if(currentPage == totalPage){
			alert("This is the last page!");
		}else{
			console.log(currentPage);
			currentPage = parseInt(currentPage) + 1;
			document.getElementById("pNos").value = currentPage;
			console.log(currentPage);
			viewCol(perPage * (currentPage-1), perPage * currentPage);
			//console.log(currentPage);
		}//end of else	
	}//end of pageDown