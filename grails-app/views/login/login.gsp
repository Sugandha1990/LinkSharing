<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Columns Clear</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'bootstrap.min.css')}">
    <link href="css/multi-columns-row.css" rel="stylesheet">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>
<body>
<div class="container">
    <div class="row multi-columns-row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <!-- <img class="img-responsive" src="http://www.placehold.it/600x400" alt="">	 -->
            <div class="sharetweets">
                <h2 class="sharetweets-heading">Recent Shares</h2>
                <article class="tweet">
                    <img src=""/>
                </article>
                <article class="tweet">
                    <img src=""/>
                </article>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width:450px">
            <!-- 	<img class="img-responsive" src="http://www.placehold.it/600x450" alt="">	 -->
            <g:form class="form-signin">
                <h2 class="form-signin-heading">Login</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <g:textField name="email" class="form-control" placeholder="Email address" required="" autofocus=""/>
                <label class="sr-only">Password</label>
                <g:textField name="password" type="password" class="form-control" placeholder="Password" required=""/>
                <div class="form-control">
                    <g:link title="Forgot Password" controller="login" action="index">Forgot Password</g:link>
                </div>
                <g:submitButton  name="login" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</g:submitButton>
            </g:form>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <!-- 	<img class="img-responsive" src="http://www.placehold.it/600x500" alt=""> -->
            <div class="sharetweets">
                <h2 class="sharetweets-heading">Top posts</h2>

            </article>

            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width:450px">
            <!-- <img class="img-responsive" src="http://www.placehold.it/600x300" alt="">	 -->
            <g:form class="form-signin">
                <h2 class="form-signin-heading">Register</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <g:textField name="email" type="email"  class="form-control" placeholder="Email address" required="" autofocus=""/>
                <label class="sr-only">Password</label>
                <g:textField name="password" type="password" class="form-control" placeholder="Password" required=""/>

                <label class="sr-only">Confirm Password</label>
                <g:textField name="confirmPassword" type="password" class="form-control" placeholder="Confirm Password" required=""/>

                <label  class="sr-only">Username</label>
                <g:textField  name="username" type="email" class="form-control" placeholder="Username" required="" autofocus=""/>

                <label  class="sr-only">First name</label>
                <g:textField  name="fName" class="form-control" placeholder="First name" required="" autofocus=""/>

                <label  class="sr-only">Last name</label>
                <g:textField  name="lastName" class="form-control" placeholder="Last name" required="" autofocus=""/>

                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">

                <g:submitButton name="Register" class="btn btn-lg btn-primary btn-block" style="margin: auto" type="submit">Sign in</g:submitButton>
            </g:form>
        </div>
    </div>
</div>
			<script src="js/respond.js"></script>
			<script src="js/ie-row-fix.js"></script>
</body>
</html>