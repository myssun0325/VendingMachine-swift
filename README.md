# VendingMachine 

> 콘솔 환경에서의 음료자판기를 구현한다. 관리자모드와 사용자모드가 있으며 실제 관리자모드는 재고를 추가하거나 삭제할 수 있고, 유통기한이 지난 음료를 삭제할 수 있다. 사용자 모드에서는 구매를 하기 위해서 금액을 추가할 수 있고 이를 통해 음료수를 구매할 수 있다.

## 구현화면
- 관리자모드  
<img src="images/admin.png" height=500>

- 사용자모드  
<img src="images/user.png" height=500>


## Step1 keyword
- 프로토콜
- CustomStringConvertible 프로토콜
- 클래스 상속
- override
- Date class, DataFormatter
- protocol의 associated type과 제네릭 활용
	- [참고링크1](http://minsone.github.io/programming/swift4-grouping-with-protocol-extension)
	- [참고링크2](https://outofbedlam.github.io/swift/2016/04/01/TypeVariable/)
- [Generic Protocols with Associated Type](https://blog.bobthedeveloper.io/generic-protocols-with-associated-type-7e2b6e079ee2)
- 기본타입 extension
- CustomStringConvertible 프로토콜 외에 description을 구현하는 방법이 무엇이 있을까?
	- NSObject를 상속받아서 description을 override하기
		- 만약에 하위 클래스에서 상속받은 상위클래스가 NSObject의 하위클래스라면 CustomStringConvertible 프토로콜을 적용해줄 필요 없이 description만 override하면 된다.
- 코드를 줄이기 위해 생각해보고 적용해본 방법 : 상속받는 모든 클래스가 flavor를 가지고 있고 description을 가지고 있다. 하지만 모든 클래스의 flavor타입이 다르므로 이를 상위 클래스에서 제네릭으로 구현해주고 상속받은 하위 클래스에서는 타입만 지정해주면 된다. 이렇게 되면 하위 클래스마다 일일히 해줘야하는 것들을 줄일 수 있다. *하지만* 기존 하위클래스에서 nested type을 사용했던 것을 밖으로 빼주어 구분해줘야 한다.(2단계 초반 커밋에 적용했다가 해제)

## Step2 keyword
- TimeInterval은 Double의 typealias
- 하위의 공통 인터페이스를 상위 클래스에서 구현하기. -> 하위클래스의 중복코드를 줄일 수 있다.
- __단순한 코드를 구현하려면 요구사항을 만족하는 "최소한의 클래스, 메소드, 중복을 없애는 것"이 중요하다.__
- 단위테스트
	- **구현된 코드에 대한 단위 테스트들을 갖고 있다면 코드의 변경과 상관없는 구현코드들이 이상없이 동작할 수 있다는 신뢰를 갖고 수정해야될 부분의 코드를 작성할 수 있다.**
	- 하나의 행동에 대해서만 테스트를 수행하고, 서로에 대해 독립적이어야 한다.
	- Right - BICEP
	- 참고 : 피드백강의자료, 제1회 마스터즈 세미나 - '나는 왜 TDD에 집착하는가(by.포비), [단위테스트와 TDD](https://medium.com/@sryu99/%EB%8B%A8%EC%9C%84-%ED%85%8C%EC%8A%A4%ED%8A%B8-tdd-bdd%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90-3d25fab5ccb2), "빠르게!"
- TDD
	- 테스트 코드를 작성한다.
	- 작성한 테스트 코드와 기존에 작성된 다른 테스트들을 수행한다.
	- 이 시점에서 새로 추가된 테스트 코드는 실패할 것이다.
	- 만일 실패하지 않는다면 올바른 것을 테스트하고 있지 않은 것이므로 그 안에 버그가 있는 것이다.
	- 실패한 테스트를 성공시키기 위한 최소한의 코드를 구현부에 작성한다.
	- 실패한 테스트가 성공하는지 확인하기 위해 테스트를 재수행한다.
	- 필요에 따라 작성한 코드를 리펙토링한다.
	- 다시 처음부터 반복
- TDD 장점
	- 소스코드 품질 향상
	- 필요한 코드만 작성
	- 디버깅 시간 절약
	- 유지보수 용이성
	- 리팩토링 용이성
	- 테스트 코드 문서화
- TDD Rule
	- Fast
	- Independent
	- Repeatable
	- Self-validating
	- Timely
- TDD given // when // then
	- given - 테스트를 실행 하기 위해서 주어진 ex: 변수를 생성한다든지
	- when - 테스트할 코드가 내뱉는 결과?
	- then - test하는 assertion
- BDD : 구현이 아닌 동작을 테스트하는 것.
- 잘못알고 있던 부분 수정
	- 리스코프 원칙은 상위 추상 타입이 하위 추상 타입을 대체할 수 있는거라 상속과 프로토콜 채택도 동일.
	- 상속을 (super를 물려받아 꼭 구현해야 하는) 구현 상속 이라고 부르고, 프로토콜을 인터페이스 상속이라고 한다.
	- 스위프트에서 프로토콜로 프로퍼티를 추상화할 경우 private처리가 안되기 때문에 이를 처리하기 위해 이를 클래스로 상속받아 처리할 수도 있다.
	- 상황에 맞게 프로토콜과 클래스 상속을 고려할 것.

## Setp3 Keyword
- 객체구조
- 어떻게 추상화 할 것인가?
- 화면에 보여지는 대로 입력을 받을 수 있는 방법에 대해 고민해보기
- (User or Admin) <-> VendingMachine <-> StockManager <-> Products <-> Beverage의 관계

## Step4 Keyword
- ObjectIdentifier
- MetaType을 활용해서 인스턴스화하기
- MetaType의 배열

## Step5 Keyword
- 스위프트 린트 적용하기

```
 Lint

lint는 컴퓨터 프로그래밍에서 의심스럽거나, 에러를 발생하기 쉬운 코드에 표시(flag)를 달아 놓는 것을 말한다. 원래는 C 언어에서 사용하던 용어였으나 지금은 다른 언어에서도 일반적으로 사용된다.

위키백과, 우리 모두의 백과사전.
```
