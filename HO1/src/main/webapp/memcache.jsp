<%@ page import="java.util.logging.Level" %>
<%@ page import="com.google.appengine.api.memcache.ErrorHandlers"%>
<%@ page import="com.google.appengine.api.blobstore.BlobKey;"%>
<%@ page import="com.google.appengine.api.memcache.MemcacheService;"%>
<%@ page import="com.google.appengine.api.memcache.MemcacheServiceFactory;"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
<title>task data</title>
</head>
<body>

<%
    MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();
    syncCache.setErrorHandler(ErrorHandlers.getConsistentLogAndContinue(Level.INFO));
    String key = request.getParameter("key");
    pageContext.setAttribute("key", key);
    String value = (String)syncCache.get(key); // read from cache
    //if(value==null)
    //	pageContext.setAttribute("value", value);
    //else
    	pageContext.setAttribute("value", value);
%>
<p>The value in keyname '${fn:escapeXml(key)}' stored in Memcache is '${fn:escapeXml(value)}' !</p>



</body>
</html>