<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not login!! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">

            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/seo-and-web.png" width="width" height="height" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/list.png" width="width" height="height" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/product.png" width="width" height="height" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/keys.png" width="width" height="height" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card" data-toggle="modal" data-target="#add-product-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 110px" class="img-fluid rounded-circle" src="img/plus.png" width="width" height="height" alt="user_icon"/>
                                </div>
                                <p class="mt-2">Click here to add new product</p>
                                <h1 class="text-uppercase text-muted">Add product</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Button trigger modal -->
            

            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOperationServlet" method="post">
                                <input type="hidden" name="operation" value="addcategory"/>
                                <div class="form-group">
                                    <input required class="form-control" type="text" name="catTitle" placeholder="Enter your category title">
                                </div>

                                <div class="form-group">
                                    <textarea style="height: 200px;" required class="form-control" name="catDescription" placeholder="Enter your description"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Category</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Product Modal-->

            <!-- Button trigger modal -->
          

            <!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="addproduct"/>
                                <div class="form-group">
                                    <input required class="form-control" type="text" name="pName" placeholder="Enter your product title">
                                </div>

                                <div class="form-group">
                                    <textarea style="height: 100px;" required class="form-control" name="pDescription" placeholder="Enter your description"></textarea>
                                </div>

                                <div class="form-group">
                                    <input required class="form-control" type="number" name="pPrice" placeholder="Enter your product price">
                                </div>

                                <div class="form-group">
                                    <input required class="form-control" type="number" name="pDiscount" placeholder="Enter your product discount">
                                </div>

                                <div class="form-group">
                                    <input required class="form-control" type="number" name="pQuantity" placeholder="Enter your product quantity">
                                </div>

                                <%  CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list = categoryDao.getCategories();
                                %>

                                <div class="form-group">
                                    <select class="form-control" name="catId" id="">

                                        <%
                                            for (Category c : list) {

                                        %>

                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                        <%    }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="pPic">Select picture of product</label>
                                    <input type="file" name="pPic" id="pPic" required>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Product</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!--End Product Modal-->

    </body>
</html>
