<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <title>TOURMATE</title>
</head>

<style>
  
 
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
    }

   

    label.radio {
        padding: 8px 12px;
        border: 2px solid #007BFF;
        border-radius: 4px;
        margin-right: 10px;
        cursor: pointer;
    }

    input[type="radio"]:checked + label.radio {
        background-color: #007BFF;
        color: white;
    }

    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        resize: none;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    
    .form-container {
            width: 100%;
            margin: 0 auto; /* 중앙 정렬 */
            display: flex;
            justify-content: center;
        }

        .form-section {
            width: 100%; /* 각 섹션의 너비 조절 */
            padding: 20px;
            border: none;
         
        }
        
         .mbti-btn {
      display: inline-block;
      padding: 10px 20px;
      border: 1px solid #000;
      color: #000;
      transition: background-color 0.3s, color 0.3s;
  }

  /* 선택될 때의 스타일 */
  .mbti-btn:checked + label {
      background-color: #007BFF;
      color: #fff;
  }

  /* 실제 라디오 버튼은 숨김 */
  .mbti-btn[type="radio"] {
      display: none;
  }
  
  .mbti-group {
    display: inline-block; /* 그룹을 가로로 배치 */
    margin-right: 10px; /* 그룹 간의 간격 조절 */
}
</style><script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('mbtiForm').addEventListener('submit', function() {
        var mbti = '';
        for(var i = 1; i <= 4; i++) {
            var selectedValue = document.querySelector('input[name="mbti' + i + '"]:checked').value;
            mbti += selectedValue;
        }
        document.getElementById('mbtiValue').value = mbti;
    });
});
</script>

<body style="background-color:#fff">

  <jsp:include page="../common/header.jsp" />
 
 
  <br><br><br>
 <div class="form-container">
        <form action="/users/register" method="post">
            <div class="form-section">
                <h3><img src="../img/pin.svg"> 아이디/비밀번호</h3>
                <br>
                아이디 <input type="text" id="username" name="username" required><br>
                비밀번호 <input type="password" id="password" name="password" required><br>
                 비밀번호 확인 <input type="password" id="password" name="password" required><br>
                닉네임 <input type="text" id="nickname" name="nickname" required><br>
            </div>
            
            <div class="form-section">
                <h3><img src="../img/pin.svg"> 기본정보</h3>
                <br>
                이름 <input type="text" id="name" name="name" required><br>
                생년월일 <input type="text" id="birthdate" name="birthdate" required><br>
                성별<br>
                <input type="radio" name="gender" value="남성"> 남성
                <input type="radio" name="gender" value="여성"> 여성<br><br>
                주소<input type="text" id="address" name="address" required><br>
                핸드폰번호<input type="text" id="phone" name="phone" required><br>
                SMS 수신동의<br>
                <input type="radio" name="smsConsent" value="허용" checked> 허용
                <input type="radio" name="smsConsent" value="거부"> 거부<br><br>
                이메일 <input type="text" id="email" name="email" required><br>
                이메일 수신동의<br>
                  <input type="radio" name="emailConsent" value="허용" checked> 허용
                <input type="radio" name="emailConsent" value="거부"> 거부<br><br>
                
                
                
           
            </div>
            
            
 <div class="form-section">
    <h3><img src="../img/pin.svg"> MBTI</h3>
    <br>
    <div class="mbti-group">
    <input class="mbti-btn" type="radio" name="mbti1" id="E" value="E">
    <label for="E" class="mbti-btn">E</label>
    <input class="mbti-btn" type="radio" name="mbti1" id="I" value="I">
    <label for="I" class="mbti-btn">I</label>
    </div>



<div class="mbti-group">
    <input class="mbti-btn" type="radio" name="mbti2" id="S" value="S">
    <label for="S" class="mbti-btn">S</label>
    <input class="mbti-btn" type="radio" name="mbti2" id="N" value="N">
    <label for="N" class="mbti-btn">N</label>
    
</div>



<div class="mbti-group">
    <input class="mbti-btn" type="radio" name="mbti3" id="T" value="T">
    <label for="T" class="mbti-btn">T</label>
    <input class="mbti-btn" type="radio" name="mbti3" id="F" value="F">
    <label for="F" class="mbti-btn">F</label>
    </div>
    
    <div class="mbti-group">
    <input class="mbti-btn" type="radio" name="mbti4" id="J" value="J">
    <label for="J" class="mbti-btn">J</label>
    <input class="mbti-btn" type="radio" name="mbti4" id="P" value="P">
    <label for="P" class="mbti-btn">P</label>
    </div>
</div>
 <input type="hidden" name="mbti" id="mbtiValue" />

			<div class="form-section">
            <h3><img src="../img/pin.svg"> 간단한 소개</h3>
            <br>
                <textarea name="introduction" maxlength="50" rows="4" cols="4"  placeholder="자신에 대해 간단히 소개해주세요. (50자 이내)"></textarea><br><br>
            </div>
            
            <div class="form-section">
            <input type="submit" value="등록하기">
            </div>
        </form>
    </div>


</body>
</html>