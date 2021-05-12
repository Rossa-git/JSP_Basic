# JSP Action Tag - Java Bean
## 1. Java Bean
java 언어의 데이터(변수)와 기능(메서드)로 이루어진 클래스.

데이터를 저장하는 변수, 데이터를 읽어오는 메서드(getter), 데이터를 저장하는 메서드(setter)로 이루어져있다.


## 2. 기본 문법
```jsp
<jsp:useBean id="객체이름" class="실제 경로" scope="범위" />
```
#### 속성 설명
* id : bean의 이름 (JSP 페이지에서 자바빈 객체에 접근할 때 사용할 이름)
* class : 실제 사용할 클래스의 경로 (패키지 이름을 포함한 자바빈 클래스의 완전한 경로)
* scope : 자바빈 사용 범위 (자바빈 객체를 저장할 영역)
	- page: 현재 페이지에 (하나의 JSP 페이지를 처리할 때)
	- request: 다음 페이지까지 (하나의 요청을 처리할 때)
	- session: 브라우저가 종료되기까지 (하나의 웹 브라우저와 관련되었을 때)
	- application: 톰캣이 종료되기까지 (하나의 웹 어플리케이션과 관련되었을 때)
	
	
## 3. 자바빈으로 이용할 클래스 선언
자바빈으로 이용할 클래스는 form과 DB의 통신 과정에서 변수들의 처리를 쉽게하기 위해 사용한다.

#### 관례이자 규칙
* 관련 변수를 동일한 이름으로 선언한다
* 반드시 getter와 setter메서드를 생성한다.
* 반드시 기본생성자도 생성한다

src/bean.example/User.java
```java
public class User {

	private String id;
	private String pw;
	private String name;
	private String email;
	
	public User() { } //기본 생성자
	
	public User(String id, String pw, String name, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
	}

	// getter , setter
	public String getId() { return id; }
	public void setId(String id) { this.id = id;	 }
	public String getPw() { return pw; }
	public void setPw(String pw) {	this.pw = pw;	}
	public String getName() { return name; }
	public void setName(String name) { this.name = name;	}
	public String getEmail() {	return email;	}
	public void setEmail(String email) { this.email = email; }
}
```


## 4. 예제
### 값을 보내는 페이지 생성
bean_basic.jsp
```jsp
	<form action ="bean_basic_ok.jsp" method="post">
		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		이름:<input type="text" name="name"><br/>
		이메일:<input type="email" name="email"><br/>
		<input type="submit" value="확인">
	</form>
```

### 값을 받는 페이지 생성
bean_basic_ok.jsp
```jsp
<%	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email"); %>
```
```request.getParameter```로 값을 받아온다.


### 자바빈 생성
```jsp
<jsp:useBean id="user" class="bean.example.User" scope="request"/>
```
자바빈을 만들고 ```User```클래스와 연결.
이 자바빈의 ```id```는 ```user``` 이다.


### setter 사용
```jsp
<jsp:setProperty property="id" name="user" value="<%=id %>"/>
<jsp:setProperty property="pw" name="user" value="<%=pw %>"/>
<jsp:setProperty property="name" name="user" value="<%=name %>"/>
<jsp:setProperty property="email" name="user" value="<%=email %>"/>
```
```name``` 속성에는 자바빈의 ```id```가 들어간다.

```value``` 속성에는 넣을 값을 지정한다. 액션 태그는 자바 코드가 아니기 때문에 값을 입력할 때는 표현식을 사용한다.<% %>

### getter 사용
```
<jsp:getProperty property="id" name="user"/>
<jsp:getProperty property="pw" name="user"/>
<jsp:getProperty property="name" name="user"/>
<jsp:getProperty property="email" name="user"/>
```
```getProperty```를 사용하면 출력까지 함께 된다.