vcl 4.0;

backend default {
  .host = "10.5.0.12";
  .port = "80";
}

sub vcl_init {
}
 
sub vcl_recv {
  if (req.method != "GET" && req.method != "HEAD") {
    return (pass);
  }

  if (req.http.X-Requested-With == "XMLHttpRequest") {
    return(pass);
  }

  if (req.http.Authorization || req.method == "POST") {
    return (pass);
  }
    
  if (req.url ~ "(/wp/wp-admin|post\.php|edit\.php|wp-login)") {
    return(pass);
  }

  if (req.url ~ "/wp/wp-cron.php" || req.url ~ "preview=true") {
    return (pass);
  }
}
 
sub vcl_backend_response {
}