<!DOCTYPE html>
<html>
	<head>
		<title>Columns Clear</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'bootstrap.min.css')}">
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'popupcss.css')}">
		<style>
			.multi-columns-row .col-xs-6 {
				margin-bottom: 30px;
			}
		</style>
	</head>
	<body>
		<div class="container">
		
		
				
				 
				 
			<div id="closed"></div>
            <a href="#popup" class="popup-link">Click to show Pop Up</a>
            <div class="popup-wrapper" id="popup">
           <div class="popup-container"><!-- Popup Contents, just modify with your own -->
               <g:form controller="user" action="createTopic" class="form-signin2popup" name="userForm">
                   <div class="myHeading2">
                       <h2>Create Topic</h2>
                   </div>
                   <br/>
                   <g:textField name="name" class="form-control" placeholder="Topic Name" />
                   <g:select name="seriousness"  class="form-control" from="${linksharingapplication.Subscription.SeriousnessValue}"/>
                   <g:select name="visibility" class="form-control" from="${linksharingapplication.Topic.VisibilityValue}"/>
                   <g:hiddenField name="createdById" value="${session.user.id}"/>
                   <br/>
                   <g:submitButton name="save"  class="btn btn-lg btn-primary btn-block" style="background-color: rgb(213, 162, 242)"/>
                   <button name="Cancel" class="btn btn-lg btn-primary btn-block"  value="Cancel"  style="background-color: rgb(213, 162, 242)">Cancel</button>
               </g:form>
<!-- Popup Content is untill here--><a class="popup-close" href="#closed">X</a>
           </div>
           </div>
				 
			
		</div>

	</body>
</html>
