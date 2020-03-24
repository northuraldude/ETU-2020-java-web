<%@ page import="java.util.List" %>
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
        <title>BBallers9: <%=res.getString("listtitle")%></title>
    </head>
    <body>
        <header>
            <h1><%=res.getString("listhdr")%></h1>
        </header>

        <div>
            <div>
                <%
                    List<String> names = (List<String>) request.getAttribute("playerNames");

                    if (names != null && !names.isEmpty()) {
                        out.println("<ui>");
                        for (String s : names)
                            out.println("<li>" + s + "</li>");
                        out.println("</ui>");
                    } else
                        out.println("<p>"+res.getString("noplayers")+"</p>");
                %>
            </div>
        </div>

        <footer>
            <button onclick="location.href='/'"><%=res.getString("backtomain")%></button>
        </footer>
    </body>
</html>
