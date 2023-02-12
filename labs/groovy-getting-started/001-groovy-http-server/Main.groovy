import com.sun.net.httpserver.Authenticator.*;
import com.sun.net.httpserver.BasicAuthenticator;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpContext;
import groovy.util.logging.Log
import java.time.LocalDateTime

/**
 * https://docs.oracle.com/en/java/javase/11/docs/api/jdk.httpserver/com/sun/net/httpserver/package-summary.html
 */
def server = com.sun.net.httpserver.HttpServer.create(new InetSocketAddress(8082), 0)
HttpContext context = server.createContext("/", new HttpHandler() {
    @Override
    void handle(HttpExchange exchange) {
        exchange.responseHeaders.set("Content-Type", "text/html")
        exchange.responseBody.withStream { OutputStream stream ->
            doExecute(exchange, exchange.requestBody, stream)
        }
    }

    protected void doExecute(HttpExchange exchange, InputStream input, OutputStream output) {
        String response = "<html><title>Hola | Groovy</title><body><span>Hello world from <b>Groovy</b>, ID:"+UUID.randomUUID().toString()+"</span></body></html>";
        exchange.sendResponseHeaders(200,response.length())
        output.write(response.getBytes());
        output.flush();
    }
})
// https://www.rgagnon.com/javadetails/java-do-basic-authentication-using-jdk-http-server.html
context.setAuthenticator(new BasicAuthenticator("simple") {
    @Override
    boolean checkCredentials(String user, String pwd) {
        return user.equals("user") && pwd.equals("password")
    }
})
server.setExecutor(null)//default executor
server.start()
