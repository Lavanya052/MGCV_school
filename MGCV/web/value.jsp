<%@page import="java.util.Arrays"%>
<%

        String[] sub = request.getParameterValues("sub");
        if(Arrays.asList(sub).contains(""))
            out.println("no data");
        else {
            out.println("yes data");
            out.println(sub[0]);
        }
        
        
%>
