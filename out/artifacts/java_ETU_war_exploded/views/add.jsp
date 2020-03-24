<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>
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

        <title>BBallers9: <%=res.getString("addtitle")%></title>
    </head>
    <body>
        <header>
            <h1><%=res.getString("addhdr")%></h1>
        </header>

        <div>
            <div>
                <%
                    if (request.getAttribute("playerName") != null) {
                        out.println("<p>"+res.getString("addsuccess")+": "+request.getAttribute("playerName")+"</p>");
                    }
                %>
            </div>
            <div>
                <form method="post">
                    <label><%=res.getString("name")%>:
                        <input type="text" name="name"><br />
                    </label>
                    <label><%=res.getString("pass")%>:
                        <input type="password" name="pass"><br />
                    </label>
                    <button type="submit"><%=res.getString("submit")%></button>
                </form>
            </div>
        </div>

        <footer>
            <button onclick="location.href='/'"><%=res.getString("backtomain")%></button>
        </footer>
    </body>
</html>
