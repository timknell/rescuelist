<html ng-app="rescueApp">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title ng-bind="pageTitle + ' &dash; Resuce List &dash; West Bridgewater Ward'">Resuce List : West Bridgewater Ward</title>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.9/angular.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.9/angular-route.min.js"></script>
    <script src="includes/javascript/controllers.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      
     	.completed {
     	  background-color: #eee;
     	}
      
    </style>
    
  </head>
  <body>
    <nav class="navbar navbar-default" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <div class="navbar-brand">WBW Rescue List</div>
      </div>
      
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a ng-href="#/stream"><i class="glyphicon glyphicon-comment"></i> Stream</a></li>
          <li><a ng-href="#/members"><i class="glyphicon glyphicon-list"></i> Members</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#" class="navbar-link"><i class="glyphicon glyphicon-user"></i> Tim Knell</a></li>
          <li><a href="?logout" class="navbar-link"><i class="glyphicon glyphicon-log-out"></i> Sign out</a></li>
        </ul>
        
      </div><!-- /.navbar-collapse -->
    </nav>

    <div ng-view>       
    </div>
  </body>
</html>