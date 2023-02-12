package dckr.simplest.jaxws.api;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * Simplest soap fault web service example - to demonstrated soap fault behaviour
 *
 * This class was generated by Apache CXF 3.4.0
 * 2021-01-31T15:22:44.155+01:00
 * Generated source version: 3.4.0
 *
 */
@WebServiceClient(name = "SimplestWebServiceApi",
                  wsdlLocation = "file:/D:/Study/skoleni.sika/dckr-simplest-jaxws/src/main/resources/META-INF/wsdl/SimplestWebServiceApi.wsdl",
                  targetNamespace = "http://api.jaxws.simplest.dckr")
public class SimplestWebServiceApi extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://api.jaxws.simplest.dckr", "SimplestWebServiceApi");
    public final static QName SimplestWebServiceApiSoap12Http = new QName("http://api.jaxws.simplest.dckr", "SimplestWebServiceApiSoap12Http");
    static {
        URL url = null;
        try {
            url = new URL("file:/D:/Study/skoleni.sika/dckr-simplest-jaxws/src/main/resources/META-INF/wsdl/SimplestWebServiceApi.wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(SimplestWebServiceApi.class.getName())
                .log(java.util.logging.Level.INFO,
                     "Can not initialize the default wsdl from {0}", "file:/D:/Study/skoleni.sika/dckr-simplest-jaxws/src/main/resources/META-INF/wsdl/SimplestWebServiceApi.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public SimplestWebServiceApi(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public SimplestWebServiceApi(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public SimplestWebServiceApi() {
        super(WSDL_LOCATION, SERVICE);
    }

    public SimplestWebServiceApi(WebServiceFeature ... features) {
        super(WSDL_LOCATION, SERVICE, features);
    }

    public SimplestWebServiceApi(URL wsdlLocation, WebServiceFeature ... features) {
        super(wsdlLocation, SERVICE, features);
    }

    public SimplestWebServiceApi(URL wsdlLocation, QName serviceName, WebServiceFeature ... features) {
        super(wsdlLocation, serviceName, features);
    }




    /**
     * Soap fault example processing via soap 1.2 version
     *
     * @return
     *     returns SimplestWebServiceApiPortType
     */
    @WebEndpoint(name = "SimplestWebServiceApiSoap12Http")
    public SimplestWebServiceApiPortType getSimplestWebServiceApiSoap12Http() {
        return super.getPort(SimplestWebServiceApiSoap12Http, SimplestWebServiceApiPortType.class);
    }

    /**
     * Soap fault example processing via soap 1.2 version
     *
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns SimplestWebServiceApiPortType
     */
    @WebEndpoint(name = "SimplestWebServiceApiSoap12Http")
    public SimplestWebServiceApiPortType getSimplestWebServiceApiSoap12Http(WebServiceFeature... features) {
        return super.getPort(SimplestWebServiceApiSoap12Http, SimplestWebServiceApiPortType.class, features);
    }

}
