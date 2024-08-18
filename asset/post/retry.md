# Retry 처리하기

## *인트로*

개발자에게있어 애러를 마주하는 자세는 굉장히 중요한것같다.

개린이 시절에는 이녀석과 마주하기를 굉장히 꺼려했다.

사실 정말 개린이 시절에는 애러라는 녀석에 대해 고려할 여력이 없었다.

애러를 핸들링 한다는것 자체가 이미 기본적인 기능 구현만으론 숨쉴만 한 상황이고,

이제 한숨 돌리나 싶어서 다른곳에 눈을 돌리다 보니

![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled.png)

어느센가 저쪽에 산더미처럼 쌓여있는 애러들의 눈초리를 느낄 수 있다.

이때 선택할 수 있는건 2가지뿐, 프로젝트를 갈아 엎던가, 아니면 덮던가..


[애러를 처리하기위한 고군분투 이야기](https://www.notion.so/Handling-Error-9319b4dea3f5471bb27249b035e4027f?pvs=21) 는 여기있으니 한번 참고해보시고..

애러 처리에 관한 방법론중 하나인 ‘재시도’ 에 관한 생각을 얼마전 겪은 경험을 통해

글로 남기고자한다.

## *🪲애러 발견!*

앱 개발자인 hann씨는 오늘도 열심히 기능 개발에 열을 올렸다.

이번에 구현할 기능은 Push Notification 기능! 두둥등장.

![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%201.png)

< 푸바오 성은 푸씨라고 한다 >

간단한 기능 구현에 대해 설명 하자면, Firebase Cloud messaging (FCM) 을 이용할 것이며,

FCM instance 를 생성 및 initialize 를 한후, instance 를 통해 token 을 발급 요청한다.

그리고 이 발급 받은 token 을 통해 알림을 받을 수 있다.

기능 구현 끗! 퇴근! .. 이라면 좋곘지만..

역시나 발급중 애러 발생!!..

한참을 원인 파악하던 hann씨의 구원투수 [스택오버플로우](https://stackoverflow.com/questions/77089496/flutter-apns-token-has-not-been-set-yet-please-ensure-the-apns-token-is-avail) 왈..

![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%202.png)

![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%203.png)

## *그래서 어쩔건데*

정리하자면..

이 버그는 인스턴스 생성의 동기 & 비동기 쪽에 문제가 있어, 인스턴스 생성후 delay 1초를 주었지만..

여전히 버그는 간헐적으로 발생했다.

그래서 선택한 방법은 ‘재시도’. 1초가 해당 기기의 성능 & 네트워크 환경에 따라 충분하지 않을수 있기에

애러가 발생했을때 delay 후 재시도를 하는것으로 덧칠을 해주었다.

그럼 재시도는 어떻게 할것인가!? ‘재귀함수’  혹은 ‘반복’ 문을 이용해서 처리하면 될것인데,

재귀함수는 개인적으로는 가독성 & 메모리 차원에서 별로 사용하고 싶지 않았고..

반복문을 어떻게 쓰면 좋을까 고민하던차, 옆에 날 유심히 보시던 서버 개발자분이 씨-익 웃으시면서

이렇게 써보시죠? 라고 재미난 코드를 하나 알려주셨다.



![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%204.png)

### 재귀함수

```jsx
String token=""
int count=0;
void loadToken()async{
	count++;
	if(count>10){
		break;
	}
	token = await fcmService.loadToken();
	if(token.isEmpty){
		loadToken();
	}
}
```

일단은 내가 생각한 재귀함수의 방법은 이랬다. 그냥 평범한 재귀함수

### 반복문

```jsx
String token="";
for(int index=0;index<10;index++){
	try{
		token = await fcmService.token();
		if(token.isNotEmpty){
			break;
		}
	}catch(e){
		continue;
	}
}
```

이건 서버 개발자 분이 알려주신 코드 ( 난 이걸 사파(邪派)식 코드라고 부른다 )

처음봤을때, 정말 띠용 했다! ‘이게 뭐야!?



![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%205.png)

한참 살펴보고 고민끝에 서버 개발자분이 권해주신 방식을 적용해보기로했다.

## *마무리*

 사실 나는 나도 몰랐던 곤조(근성)가 있는것 같다. 개발을 하게되면서 생긴것인지 모르겠는데,

나만의 규칙을 만들고 그것을 되도록이면 지키려고 하는 버릇이 곤조가 되어버린것이다.

![Untitled](Retry%20%E1%84%8E%E1%85%A5%E1%84%85%E1%85%B5%E1%84%92%E1%85%A1%E1%84%80%E1%85%B5%20c4caa643c0c0488ead8518ccd7995e78/Untitled%206.png)

  <수많은 코드를 모여, 자아가 되어버렸다>

이번 글은 이런 것까지 굳이 남길 필요가 있을까? 라는 생각을 할수도 있지만,

나에겐 한번 더 돌아볼 수 있는 기회가 된것같다.

어느 순간부터는 내가만든 룰에 빠져, 매번 틀에 박힌 생각없는 코드만 찍어내는 일상이었다.

입으로만 다른 개발자와 문제를 공유하고, 서로의 의견을 받아드림으로

한층 더 성숙한 개발자가 되겠다는 소리는 하고 다니지만, 정작 그런 마인드가 없었던것 같았다.

이번 기회에 그런 나에게 한번의 출렁이는 파도가 온것이 아닐까 싶다.

코드가 나쁘다 좋다를 떠나, 그분은 나에게 의견을 주었고, 서로의 의견을 공유하며,

뭔지 모를 많은 반성과 깨우침을 하게되는 시간이었다.

시간이 지나 다시금 나의 개발일상이 틀에 갇혀버릴즘, 이때를 돌아보고, 이 글을 돌아보며,

그 틀을 무너트릴 수 있는 용기를 갖기를 바란다.

개발 일상에서 발생하는 오류에 대해 적절한 Retry 로 성장하는 개발자가 될 수 있기를..

```dart
Future devLife() async {
  const tryCount = double.maxFinite;
  for (int index = 0; index < tryCount; index++) {
    try {
      final isOK = await beGoodDev();
      if (isOK) {
        break;
      }
    } catch (e) {
      await Future.delayed(takeRest);
    }
  }
}
```
