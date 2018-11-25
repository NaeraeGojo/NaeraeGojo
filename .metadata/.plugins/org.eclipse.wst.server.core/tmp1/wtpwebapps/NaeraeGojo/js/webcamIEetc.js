var socket = null;
var isClose = false;
(function() {
	// 태그 셀렉트
	var video = document.querySelector('video');

	var canvas = document.querySelector('canvas');
	var context = canvas.getContext('2d');

	var img = document.querySelector('img');

	socket = new WebSocket('ws://127.0.0.1/SpringToddler/wscam');

	socket.onopen = function onOpen(event) {
		alert("웹캠 서버 소켓 오픈");
	};

	socket.onclose = function onClose(event) {
		alert("웹캠 서버 소켓 종료 : " + event.code + " | " + event.reason);
		socket = null;
	};

	socket.onerror = function onClose(err) {
		alert("웹캠 서버 소켓 : " + err.data);
	};

	var constraints = {
		video : true,
		audio : false
	};
	// 브라우저 웹캠 디바이스 활성화 설정을 기초로 video 태그 대상 스트리밍 설정
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		video.srcObject = stream;
		video.play();
	});

	setInterval(main, 100);
	function main() {
		// video 태그 스트리밍을 canvas 태그 대상 드로잉
		drawCanvas();
		// video 태그 스트리밍의 canvas 태그 대상 드로잉 후 캡처 이미지 취득
		readCanvas();
	}

	function drawCanvas() {
		context.drawImage(video, 0, 0, canvas.width, canvas.height);
	}

	// 코덱 확인
	// alert(canvas.toDataURL('image/jpeg', 1));

	function readCanvas() {
			var blobData = null;
			var canvasData = canvas.toDataURL('image/jpeg', 1);
			var decodeAString = atob(canvasData.split(',')[1]);
	
			var charArray = [];
			for (var i = 0; i < decodeAString.length; i++) {
				charArray.push(decodeAString.charCodeAt(i));
			}
	
			// 개발자 신텍스 에러 type => tpye
			blobData = new Blob([ new Uint8Array(charArray) ], {
				tpye : 'image/jpeg'
			});
			window.console.log("blobData 사이즈 : " + blobData);
			if (socket != null) {
				window.console.log("socket readyState : " + socket.readyState
						+ " | buffer : " + socket.bufferedAmount);
				socket.send(blobData);
				socket.addEventListener('message', function(event) {
					img.src = window.URL.createObjectURL(event.data);
				});
			}
	}
})();
