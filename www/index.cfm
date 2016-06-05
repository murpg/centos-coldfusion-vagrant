<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>CDE - Custom Development Environment</title>

  <!-- Fonts -->
  <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,700" rel="stylesheet" type="text/css">
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  <!-- Bootstrap Core CSS -->
  <link href="assets/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- CDE Bootstrap Custom CSS -->
  <link href="assets/cdebootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfoutput>
  <!-- Header -->
  <header class="cde-page-header">
    <div class="container">
      <h1>CDE</h1>
      <p>CDE is a local custom development environment with ColdFusion 11</p>
    </div>
  </header>
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading panel-title">
            General Info
          </div>
          <div class="panel-body">
            Date: <strong>#dateFormat( now(), "full" )#</strong>
            <br>
            Access the ColdFusion Server Administration at:
            <a href="http://#cgi.server_name#/CFIDE/administrator/index.cfm" target="_blank">http://#cgi.server_name#/CFIDE/administrator/index.cfm</a>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading panel-title">
            Sites configured on your VM
          </div>
          <div class="panel-body">
            Run <code>"vagrant reload --provision"</code> after adding or removing repos
          </div>
          <table class="table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Url</th>
              </tr>
            </thead>
            <tbody>
              @@siteList@@
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</cfoutput>
</body>
</html>
