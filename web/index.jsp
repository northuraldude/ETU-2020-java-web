<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <%
      response.setContentType("text/html;charset=UTF-8");
      String lang = request.getParameter("lang");

      if(lang == null) {
        for(Cookie cookie : request.getCookies()) {
          if(cookie.getName().equals("lang")) {
            lang = cookie.getValue();
            break;
          }
        }
        if(lang == null) {
          lang = "en";
        }
      } else {
        if(!"en".equals(lang) && !"ru".equals(lang)) {
          lang = "en";
        }
        response.addCookie(new Cookie("lang", lang));
      }

      Locale locale = new Locale(lang);
      ResourceBundle res = ResourceBundle.getBundle("Text", locale);
    %>
    <meta charset="UTF-8">
    <title>BBallers9: <%=res.getString("maintitle")%></title>
  </head>
  <body>
    <header>
      <h1>BBALLERS9</h1>
    </header>

    <div>
      <div>
        <button onclick="location.href='/list'"><%=res.getString("listbtn")%></button>
        <button onclick="location.href='/add'"><%=res.getString("addbtn")%></button>
      </div>
    </div>

    <footer>
      (c) 2020 V5NA9
    </footer>
  </body>
</html>
