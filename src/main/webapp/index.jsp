<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row">

            <%  ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = productDao.getProducts();

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> categoryList = categoryDao.getCategories();
            %>

            <div class="col-md-2 mt-2">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                

                    <%
                        for (Category category : categoryList) {
                    %>
                            <a href="#" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
                     <%   }
                    %>
                </div>
            </div>

            <div class="col-md-8">
                
                <div class="row mt-2">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                              for(Product p : list){
                            
                            %>
                            
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName() %></h5>
                                    <p class="card-text">
                                        Some quick example text to build on the card title and make up the bulk of the card's content.
                                    </p>
                                </div>
                            </div>
                            
                            <%  }  
                            %>
                        </div>
                    </div>
                </div>
                
                <h1>No of products <%= list.size()%></h1>

                <%
                    for (Product product : list) {
                        out.println(product.getpName() + "<br>");
                    }
                %>
            </div>
        </div>
    </body>
</html>
