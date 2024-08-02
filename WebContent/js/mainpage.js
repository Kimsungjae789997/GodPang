/**
 * 
 */
// 검색 '단어입력창' 입력시 클릭시
$.search_suggestion = function(){
	
	const selectedCategory = $("#lprod_category").val();
    const userInput = $(this).val();
    const suggestBox = $("#suggestion_box").removeClass("invisible").html("");
    
    const categories = {
	
        "전체": ['티셔츠', '박해민', '이정후', '원태인', '구자욱', '오승환'],
        "패션의류/잡화": ['티셔츠', '박해민', '이정후', '원태인', '구자욱', '오승환'],
        "뷰티": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "출산/유아동": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "식품": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "주방용품": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "생활용품": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "홈인테리어": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠'],
        "스포츠/레저": ['두산 베어스', '삼성 라이온즈', 'NC 다이노스', '기아 타이거즈', '롯데 자이언츠']
        // 다른 카테고리와 해당 카테고리의 아이템을 추가할 수 있습니다.
    };

    if (selectedCategory in categories) {
        const items = categories[selectedCategory];
        
        if (items && items.length > 0) {
            $.each(items, function(index, item) {
                if (item.includes(userInput)) {
                    const itemDiv = $("<div></div>")
                        .addClass("item")
                        .text(item)
                        .on("click", function() {
                            $("#name").val($(this).text().split(" ")[0]);
                            // 클릭된 아이템의 처리 코드 추가
                            suggestBox.addClass("invisible");
                        });
                    
                    suggestBox.append(itemDiv);
                }
            });
        }
    }
}


// '검색'하기
$.mainSearch = function(input_name){
	
	vstype = $('#lprod_category option:selected').val().trim();
	vsword = $('#search_prod').val().trim();
	// 전체 카테고리
	$.ajax({ // key : value,
		url : `${mypath}/mainSearch.do`,
		type : 'get',
		data : {num : vidx}, // vidx: 글번호
		success : function(result){
			//alert("성공");
			
			// 화면의 조회수 숫자를 변경
			vp = $(gthis).parents('.card'); // 공통조상 먼저 찾기
			
			// 게터 getter
			// 조회수('.hi')찾아서 숫자로변환해서 '+1'
			vhit = parseInt($(vp).find('.hi').text()) + 1; 
			
			// 세터 setter ==> 게터해와서 바로 세터해주기
			$(vp).find('.hi').text(vhit);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}
