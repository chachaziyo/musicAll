
let selectedSeatsArray = new Array();
const seatWrapper = document.querySelector('.seat-wrapper');
let clicked = '';
let div = '';

const selectedSeats = document.querySelector('.selected-seats');
const selectedSeats2 = document.querySelector('.selected-seats2');
const allSeat = document.querySelector('.all-seats');
const reserveNumber = document.querySelector('.reserve-number');
const selectSeatListNormal = document.querySelectorAll(
    '.select-seat-ul-normal li'
);
let selectSeatListUlActive = '';
const allMoney = document.querySelector('.allMoney');
let money=0;


const payMoney = document.querySelector('.payMoney');
const seatForm = document.querySelector('.seatForm');
const reserveButton = document.querySelector('.reserve-button');
const selectedSeat = document.querySelector('.selectedSeat');

toastr.options = {
    positionClass: 'toast-top-right',
    progressBar: true,
    timeOut: 1000,
    preventDuplicates: true,
};

for (let i = 0; i < 10; i++) {
    div = document.createElement('div');
    div.classList = 'seatButtonWrapper';
    seatWrapper.append(div);

    for (let j = 0; j < 16; j++) {
        const input = document.createElement('input');
        input.type = 'button';
        input.name = 'seats';
        input.classList = 'seat';
        const input2 = document.createElement('input');
        input2.type='hidden';
        
        //3중포문을 사용하지 않기위해
        mapping(input,input2, i, j);
        div.append(input);
        div.append(input2);
        //클릭시 이벤트
        inputClickEvent(input);
    }

}

const seatLevel = document.querySelectorAll('.seatButtonWrapper');
for(let i=0;i<4;i++){
	$(seatLevel[i]).children().css("backgroundColor",'#CCA63D');
}
for(let i=4;i<6;i++){
	$(seatLevel[i]).children().css("backgroundColor",'#DB3A00');
}
for(let i=6;i<seatLevel.length;i++){
	$(seatLevel[i]).children().css("backgroundColor",'green');
}
let seat = document.querySelectorAll('.seat');
seat.forEach(data => {
	//console.log(data.value);
    //console.log(data.value.substring(1, data.value.length));
    // console.log(data.value.substring(0, data.value.length - 1));
    //좌석이 2나 9로 끝나는얘들은 왼쪽이나 오른쪽으로 띄워주기위한 class추가
    if (data.value.substring(1, data.value.length) === '4') {
        data.classList.add('left-margin');
    } else if (data.value.substring(1, data.value.length) === '11') {
        data.classList.add('right-margin');
    }
    //앞자리가 E로끝나는 좌석들에 class 추가
    if (
        data.value.substring(0, data.value.length - 1) === 'E' ||
        data.value.substring(0, data.value.length - 2) === 'E'
    ) {
        data.classList.add('top-margin');
    }
    
    if(data.value==='D8'){
    	data.classList.add("selected");
    	data.classList.remove("seat");
    	$(".selected").css("backgroundColor","#B4B4B4");
    	$(".selected").css("color","#B4B4B4");
    	}
});





function inputClickEvent(input) {
if(input.value!='D8'){
    input.addEventListener('click', function(e) {
        //console.log(e.target.value);
        const seatName = e.target.value;
        //console.log(seatName);
        const seatPrice=(Number)(document.querySelector('.'+seatName).value);
        //console.log(seatPrice);
      
    	color = input.value.substring(0,input.value.length-1);
        color2 = input.value.substring(0,input.value.length-2);
        //중복방지 함수
        selectedSeatsArray = selectedSeatsArray.filter(
            (element, index) => selectedSeatsArray.indexOf(element) != index
        );

        //click class가 존재할때(제거해주는 toggle)
        if (input.classList.contains('clicked')) {

            input.classList.remove('clicked');
            money-=seatPrice;
            clicked = document.querySelectorAll('.clicked');
            
            
           	if(color==='E'||color2 ==='E'||color==='F'||color2 ==='F'){
           		input.style.backgroundColor='#DB3A00';
           	}else if(color==='A'||color2 ==='A'||color==='B'||color2 ==='B'
           	||color==='C'||color2 ==='C'||color==='D'||color2 ==='D'){
           		input.style.backgroundColor='#CCA63D';
           	}else{
           		input.style.backgroundColor='green';
           	}
           	
           
			//배열안의 값 제거
            selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
            

            //class가 존재안할때 추가해주는 toggle
        } else {
            input.classList.add('clicked');
          
            clicked = document.querySelectorAll('.clicked');
        	 money+=seatPrice;
        	 
        	 for(let i=0;i<clicked.length;i++){
        		clicked[i].style.removeProperty('background-color');
        	}
        	
        	
            //선택한 번호의 갯수를 넘기면 동작 못하게 하는 코드
            if (clicked.length > 4) {
                input.classList.remove('clicked');
                money-=seatPrice;
                
           		
                if(color==='E'||color2 ==='E'||color==='F'||color2 ==='F'){
           			input.style.backgroundColor='#DB3A00';
           		}else if(color==='A'||color2 ==='A'||color==='B'||color2 ==='B'
          	 	||color==='C'||color2 ==='C'||color==='D'||color2 ==='D'){
           			input.style.backgroundColor='#CCA63D';
           		}else{
           			input.style.backgroundColor='green';
           		}
                toastr.error(
                    '<div style="color:white">지정한 인원수를 넘었습니다</div>',
                    '<div style="color:white">인원수 확인</div>', {
                        timeOut: 2000
                    }
                );
                
          		  clicked.forEach(data => {
               		 selectedSeatsArray.push(data.value);
           		 });
           		 selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
                return;
                
            }

            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
        }

		
        //console.log(selectedSeatsArray.length);
        console.log(selectedSeatsArray);
        //좌석번호의 innerHTML 설정
        selectedSeats.innerHTML = selectedSeatsArray;
        reserveNumber.innerHTML = selectedSeatsArray.length;
      	//console.log(money);
        allMoney.innerHTML=money.toLocaleString('ko-KR')+'원';
      
    });}
}

function mapping(input,input2, i, j) {
    if (i === 0) {
        input.value = 'A' + j;
        input2.value= 99000
        input2.classList = 'A'+j;
    } else if (i === 1) {
        input.value = 'B' + j;
        input2.value= 99000
        input2.classList = 'B'+j;  
    } else if (i === 2) {
        input.value = 'C' + j;
        input2.value= 99000
        input2.classList = 'C'+j;
    } else if (i === 3) {
        input.value = 'D' + j;
        input2.value= 99000
        input2.classList = 'D'+j;
    } else if (i === 4) {
        input.value = 'E' + j;
        input2.value= 89000
        input2.classList = 'E'+j;
    } else if (i === 5) {
        input.value = 'F' + j;
        input2.value= 89000
        input2.classList = 'F'+j;
    } else if (i === 6) {
        input.value = 'G' + j;
        input2.value= 79000
        input2.classList = 'G'+j;
    } else if (i === 7) {
        input.value = 'H' + j;
        input2.value= 79000
        input2.classList = 'H'+j;  
    } else if (i === 8) {
        input.value = 'I' + j;
        input2.value= 79000
        input2.classList = 'I'+j;         
    } else if (i === 9) {
        input.value = 'J' + j;
        input2.value= 79000
        input2.classList = 'J'+j;         
    } else if (i === 10) {
        input.value = 'K' + j;
        input2.value= 79000
        input2.classList = 'K'+j;      
    }
}
