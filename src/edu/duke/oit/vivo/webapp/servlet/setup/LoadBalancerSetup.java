package edu.duke.oit.vivo.webapp.servlet.setup;

import edu.cornell.mannlib.vitro.webapp.config.ConfigurationProperties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.net.InetAddress;
import org.apache.commons.io.FileUtils;
import java.io.File;

public class LoadBalancerSetup implements ServletContextListener {

  private static final Log log = LogFactory.getLog(LoadBalancerSetup.class.getName());

  public void contextInitialized(ServletContextEvent servletContextEvent) {
    log.debug("Starting LoadBalancerSetup");
    try {
      InetAddress localMachine = InetAddress.getLocalHost();
      String hostname = localMachine.getHostName();
      String tomcat_home = ConfigurationProperties.getBean(servletContextEvent).getProperty("tomcat.home");
      String webapp_name = ConfigurationProperties.getBean(servletContextEvent).getProperty("webapp.name");
      String lb_path = tomcat_home + "/webapps/" + webapp_name + "/lb.html";

      log.info("Writing " + lb_path + " for " + hostname +  " ...");
      String lb_contents = "<html><head></head><body>"+ hostname + "</body></html>";
      FileUtils.writeStringToFile(new File(lb_path),lb_contents);
      log.info("... Success!");
    }
    catch(java.net.UnknownHostException e) {
      log.error("Could not deternime local hostname for lb file!");
      log.error(e);
      e.printStackTrace();
    }
    catch(java.io.IOException e) {
      log.error("Could not write lb file!");
      log.error(e);
      e.printStackTrace();
    }

    log.debug("Finished LoadBalancerSetup");
  }

  public void contextDestroyed(ServletContextEvent servletContextEvent) {
    log.debug("Stopping LoadBalancerSetup.");
  }

}
