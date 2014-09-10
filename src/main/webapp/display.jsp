<!DOCTYPE html>
<%@ page import="com.google.appengine.api.search.Document" %>
<%@ page import="com.google.appengine.api.search.Field" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>

<%
  String outcome = (String) request.getAttribute("outcome");
  if (outcome == null || outcome.isEmpty()) {
    outcome = "&nbsp;";
  }
  String query = (String) request.getParameter("query");
  if (query == null) {
    query = "";
  }
  String limit = (String) request.getParameter("limit");
  if (limit == null || limit.isEmpty()) {
    limit = "10";
  }
    
    String outcome2 = (String) request.getAttribute("outcome2");
    // window.alert(outcome2);
%>
<script>
  alert("value of <%= outcome2 %> ");  
  </script>
<html>
  <head>
    <title>Singapore Pools Predictor</title>
   
  </head>
  <body>
    <form name="search" action="/search" method="get">
      <input placeholder="Search" style="width:500px;"
        type="search" name="query" id="query" value='<%=query%>'/>
      <!--<select name="limit">
        <option <%="5".equals(limit)? "selected" : ""%>>5</option>
        <option <%="10".equals(limit)? "selected" : ""%>>10</option>
        <option <%="15".equals(limit)? "selected" : ""%>>15</option>
        <option <%="20".equals(limit)? "selected" : ""%>>20</option>
        <option <%="50".equals(limit)? "selected" : ""%>>50</option>
      </select>-->
    </form>
    <hr/>
    <!--
    <form name="index" acton="/search" method="get">
      <b>Document</b>:
      <br/>
      <textarea style="width: 500px; height: 20ex;" name="doc"></textarea>
      <br/>
      Rating (<span id="rating-display">3</span>):
      <input id="rating" name="rating" type="range" min="0" max="5"
        value="3" onchange='updateRangeValue("rating-display", "rating")' />
      <br/>
      <input style="width: 500px;" placeholder="Comma separated tags"
        name="tags" type="text" value=""/>
      <br />
      <input name="index" type="submit" value="Add" style="width: 500px;"/>
  
      <input type="hidden" name="query" value="<%=query%>"/>
    </form>
    -->
    <hr/>
    <%
      List<Document> found = (List<Document>) request.getAttribute("found");
      if (found != null) {
    %>
    <!--<form name="delete" action="/search" method="get">-->
      <!-- repeated so that we can execute a search after deletion -->
      <input type="hidden" name="query" value="<%=query%>"/>
      <table>
        <tr>
          <th>
            <input type="checkbox" name="x" onclick="toggleSelection(this);"/>
          </th>
          <th>Author</th>
          <th>Content</th>
        </tr>
    <%
        if (found.isEmpty()) {
    %>
        <tr>
          <td colspan='4'><i>No Data Found</i></td>
        </tr>
    <%
        } else {
          for (Document doc : found) {
    %>
        <tr>
          <!--<td>
            <input type="checkbox" name="docid" value="<%=doc.getId()%>"/>
          </td>-->
          <td>
            <%=doc.getOnlyField("number").getText()%>
          </td>
          <td>
            <%=doc.getOnlyField("category").getText()%>
          </td>
           <td>
            <%=doc.getOnlyField("date").getText()%>
          </td>
        </tr>
    <%
          }
        }
    %>
      </table>
     <!-- <input name="delete" type="submit" value="Delete"/>-->
   <!-- </form>-->
    <%
      }
    %>
  </body>
</html>
