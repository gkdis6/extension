<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<style>
        *{
            margin:0;
            padding:0;
        }
        .inputbox{
            padding-top:100px;
            max-width: 764px;
            margin:0 auto;
        }
        .section{
            display:flex;
            align-items: center;
            justify-content: space-between;
        }
        .section h1{
            width: 250px;
            font-size:26px;
        }
        .input-form{
            display:flex;
            align-items: center;
        }
        .input-form input{
            width: 200px;
            height: 50px;
            border-radius: 6px;
            font-size:14px;
            box-sizing: border-box;
            padding:10px;
        }
        .input-form input::placeholder{
            font-size:inherit;
            color:#ccc;
        }
        .input-form button{
            outline: none;
            border:none;
            background-color: #1f80fd;
            color:#fff;
            font-size:16px;
            font-weight: bold;
            width: 70px;
            height: 50px;
            border-radius: 6px;
            margin-left: 5px;
        }
        .tag-wrapper{
            width: 100%;
            min-height:300px;
            border-radius:9px;
            border:1px solid #ccc;
            margin-top: 20px;
            box-sizing: border-box;
            padding:20px;
        }
        .tagBox{
        	display:flex;
        	flex-wrap: wrap;
        }
        .tagItem{
        	list-style:none;
        	height: 20px;
        	line-height: 20px;
        	border: 1px solid black;
        	border-radius: 4px;
        	margin: 3px;
        	padding : 1px 5px 1px 5px;
        }
        i{
        	margin : 3px 1px 3px 7px;
        }
        
    </style>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class="inputbox">
    <div class="section section1">
        <h1>고정 확장자</h1>
        <div>
            <label><input type="checkbox" value="bat" onclick='add(event)' id="bat"/>bat</label>
            <label><input type="checkbox" value="cmd" onclick='add(event)' id="cmd"/>cmd</label>
            <label><input type="checkbox" value="com" onclick='add(event)' id="com"/>com</label>
            <label><input type="checkbox" value="cpl" onclick='add(event)' id="cpl"/>cpl</label>
            <label><input type="checkbox" value="exe" onclick='add(event)' id="exe"/>exe</label>
            <label><input type="checkbox" value="scr" onclick='add(event)' id="scr"/>scr</label>
            <label><input type="checkbox" value="js" onclick='add(event)' id="js"/>js</label>
        </div>
    </div>
    <div class="section section2">
        <h1>커스텀 확장자</h1>
        <div>
            <div class="input-form">
                <label>
                    <input type="text" placeholder="확장자 입력" id="tag" maxlength='20'>
                </label>
                <button id="postData">추가</button>
            </div>
        </div>
    </div>
    <div class="tag-wrapper">
        <div>
            <ul style="display:flex; list-style:none">
                <li class="total-custom-item">0</li>
                <li>/</li>
                <li class="total-custom">200</li>
            </ul>
        </div>
        <div class='tagBox'></div>
    </div>
</div>

<script type="text/javascript">
	//버튼 클릭 이벤트
	/* var buttons = [{
		value:"bat",
		is_checked:false
		}, "cmd", "com"] */
		
	let origin = ["bat", "cmd", "com", "cpl", "exe", "scr", "js"];
	let second = [];
	$('#postData').on('click',function(){
		let trimval = $('#tag').val().toLowerCase().replace(/^a-zA-Z0-9/gi, "");
		let form = {
			tag : trimval
		};
		document.getElementById("tag").value = "";
		if(second.length >=200){
			alert("200개까지만 등록할 수 있습니다.");
			return;
		}
		if(second.includes(trimval)){
			alert("이미 존재하는 값입니다.");
			return;
		}
		if(origin.includes(trimval) && document.getElementById(trimval).checked){
			alert("이미 체크된 값입니다.");
			return;
		}
		if(trimval.length !== 0){
			$.ajax({
				url : "./add",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8;",
				dataType : 'json',
				success : function(data) {
					if(origin.includes(data.tag)) {
						console.log(data.tag);
						document.getElementById(data.tag).checked = !document.getElementById(data.tag).checked;
						return;
					}
					$(".tagBox").append("<li class='tagItem' id='"+item.tag+"'>" + item.tag + "<i class='fa-solid fa-x' onclick='removeTag(event)' name='"+item.tag+"'></i></li>")
		            
		            Checktag();
		            second.push(data.tag);
			    },
				error : function(request, status, error){
					alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
				}
			});
		}
	});
	
	function add(event){
		console.log($(event.target));
		let form = {
			tag : $(event.target).val()
		}
		$.ajax({
			url : "./add",
			type : "POST",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8;",
			dataType : 'json',
			success : function(data) {
	            /* $(".tagBox").append("<li class='tagItem' onclick='removeTag(event)'>" + data.tag + "</li>")
	            Checktag(); */
		    },
			error : function(request, status, error){
				alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
			}
		});
	}
	
    function removeTag(event) {
    	console.log(event.target);
    	console.log(event.target.getAttribute("name"));
        let form = {
    			tag : event.target.getAttribute("name")
    		}
    		$.ajax({
    			url : "./add",
    			type : "POST",
    			data : JSON.stringify(form),
    			contentType : "application/json; charset=utf-8;",
    			dataType : 'json',
    			success : function(data) {
    				document.getElementById(data.tag).remove();
    				Checktag();
    				second.pop(data.tag);
    		    },
    			error : function(request, status, error){
    				alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
    			}
    		});
		/* $(event.target).remove();
		Checktag();
		second.pop($(event.target).val()); */
    }

    function Checktag() {
        let count = $(".tagItem").length;
        $(".total-custom-item").text(count);
    }
    
    window.onload = function () {
    	let form = {
   			tag : '1'
   		};
    	$.ajax({
			url : "./read",
			type : "POST",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8;",
			dataType : 'json',
			success : function(data) {
				let list = data.list
		        console.log(list);
				list.forEach(function(item) {
					if(origin.includes(item.tag)) {
						console.log(item.tag);
						document.getElementById(item.tag).checked = !document.getElementById(item.tag).checked;
					}else{
						$(".tagBox").append("<li class='tagItem' id='"+item.tag+"'>" + item.tag + "<i class='fa-regular fa-x' onclick='removeTag(event)' name='"+item.tag+"'></i></li>")
			            Checktag();
						second.push(item.tag);
					}
			    });
		    }, 
			error : function(request, status, error){
				alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
			}
		});
    }
</script>

</body>
</html>