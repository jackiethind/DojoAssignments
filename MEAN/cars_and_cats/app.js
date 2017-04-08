// get the http module:
var http = require('http');
// fs module allows us to read and write content for responses!!
var fs = require('fs');
// creating a server using http module: !!!!!! IMPORTANT !!!!!!!!
var server = http.createServer(function (request, response){
    // see what URL the clients are requesting:
    console.log('client request URL: ', request.url);
    // this is how we do routing:
    // HTML
    if(request.url === '/cars') {
        fs.readFile('views/cars.html', 'utf8', function (errors, contents){
            response.writeHead(200, {'Content-Type': 'text/html'});  // send data about response
            response.write(contents);  //  send response body
            response.end(); // finished!
        });
    }
    else if (request.url === "/cats") {
       fs.readFile('views/cats.html', 'utf8', function (errors, contents){
           response.writeHead(200, {'Content-type': 'text/html'});
           response.write(contents);
           response.end();
       });
    }
    else if (request.url === "/cars/new") {
       fs.readFile('views/new.html', 'utf8', function (errors, contents){
           response.writeHead(200, {'Content-type': 'text/html'});
           response.write(contents);
           response.end();
       });
    }
    // CSS
    else if(request.url === '/stylesheets/style.css'){
        fs.readFile('./stylesheets/style.css', 'utf8', function(errors, contents){
            response.writeHead(200, {'Content-type': 'text/css'});
            response.write(contents);
            response.end();
        });
    }
    // IMAGES
    else if(request.url === '/images/cat1.jpg'){
        // notice we won't include the utf8 encoding
        fs.readFile('./images/cat1.jpg', function(errors, contents){
            response.writeHead(200, {'Content-type': 'image/jpg'});
            response.write(contents);
            response.end();
        });
    }
    else if(request.url === '/images/hoodcat.jpg'){
        // notice we won't include the utf8 encoding
        fs.readFile('./images/hoodcat.jpg', function(errors, contents){
            response.writeHead(200, {'Content-type': 'image/jpg'});
            response.write(contents);
            response.end();
        });
    }
    else if(request.url === '/images/buggati.png'){
        // notice we won't include the utf8 encoding
        fs.readFile('./images/buggati.png', function(errors, contents){
            response.writeHead(200, {'Content-type': 'image/jpg'});
            response.write(contents);
            response.end();
        });
    }
    else if(request.url === '/images/lambo.png'){
        // notice we won't include the utf8 encoding
        fs.readFile('./images/lambo.png', function(errors, contents){
            response.writeHead(200, {'Content-type': 'image/jpg'});
            response.write(contents);
            response.end();
        });
    }
    else if(request.url === '/images/car1.jpg'){
        // notice we won't include the utf8 encoding
        fs.readFile('./images/car1.jpg', function(errors, contents){
            response.writeHead(200, {'Content-type': 'image/jpg'});
            response.write(contents);
            response.end();
        });
    }
    // request didn't match anything:
    else {
        response.writeHead(404);
        response.end('File not found!!!');
    }
});
// tell your server which port to run on
server.listen(6969);
// print to terminal window
console.log("Running in localhost at port 6969");
