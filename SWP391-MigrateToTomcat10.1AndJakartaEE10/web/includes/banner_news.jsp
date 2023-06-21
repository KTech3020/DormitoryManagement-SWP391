<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Section --><%@page contentType="text/html" pageEncoding="utf-8" %>
<section>
    <header class="major">
        <h2>Thông báo</h2>
        <li><a href="addNews.jsp" class="button">Create News</a></li>
    </header>
    <div class="posts">
       
        <c:forEach items="${listP}" var= "o">
        <article>
            <a href="#" class="image"><img src="${o.image}" alt="" /></a>
            <h3>${o.subject} </h3>
            <p>${o.content}</p>
            

            <ul class="actions">
                <li><a href="News.jsp" class="button">More</a></li>
                <li><a href="editNews.jsp" class='button'>Edit </a></li>
                <li><a href="delete?notiID=${o.notiID}" class='button'>Delete </a></li>
            </ul>
        </article>
        </c:forEach>
        							
    </div>
</section>

</div>
</div>