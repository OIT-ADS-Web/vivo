/*
Copyright (c) 2011, Cornell University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of Cornell University nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package edu.cornell.mannlib.vitro.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Collection;
import java.util.Iterator;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.rdf.model.Literal;

import edu.cornell.mannlib.vitro.webapp.beans.DataProperty;
import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.dao.IndividualDao;
import edu.cornell.mannlib.vitro.webapp.beans.VClass;
import edu.cornell.mannlib.vitro.webapp.beans.VClassGroup;
import edu.cornell.mannlib.vitro.webapp.controller.freemarker.IndividualListController;
import edu.cornell.mannlib.vitro.webapp.dao.DisplayVocabulary;
import edu.cornell.mannlib.vitro.webapp.dao.ObjectPropertyStatementDao;
import edu.cornell.mannlib.vitro.webapp.dao.WebappDaoFactory;
import edu.cornell.mannlib.vitro.webapp.dao.jena.VClassGroupCache;
// import edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.EditConfiguration;
// import edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.SelectListGenerator;
import edu.cornell.mannlib.vitro.webapp.search.beans.ProhibitedFromSearch;
// import edu.cornell.mannlib.vitro.webapp.utils.pageDataGetter.DataGetterUtils;

public class OrganizationServiceServlet extends VitroHttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Log log = LogFactory.getLog(OrganizationServiceServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        VitroRequest vreq = new VitroRequest(req);

        IndividualDao iwDao = vreq.getWebappDaoFactory().getIndividualDao();
        String uri = vreq.getParameter("uri");

        try{
          if (uri != null && vreq.getParameter("getTree") != null) {
            JSONObject map = getTreeForOrg(uri, iwDao);
            renderJSONResult(map.toString(), resp);
          } else if (uri != null && vreq.getParameter("getIndex") != null) {
            JSONArray array = getIndexForOrg(uri, iwDao);
            renderJSONResult(array.toString(), resp);
          } else if (vreq.getParameter("getCGIParams") != null) {
            JSONObject params = getCGIParams(req);
            renderJSONResult(params.toString(), resp);
          } else {
            // handle invalid request
          }
        } catch(Exception ex){
          log.warn(ex,ex);
        }
        return;
    }

    private void renderJSONResult(String result, HttpServletResponse resp) throws IOException {
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("application/json;charset=UTF-8");
      Writer writer = resp.getWriter();
      writer.write(result);
    }

    private JSONObject getTreeForOrg(String uri, IndividualDao iwDao) throws JSONException  {
       Individual org = iwDao.getIndividualByURI(uri);
       JSONObject map = new JSONObject();
       map.put("URI", org.getURI());
       map.put("name", org.getName());
       List<Individual> subOrgs = org.getRelatedIndividuals("http://purl.obolibrary.org/obo/BFO_0000051");
       Iterator<Individual> iterator = subOrgs.iterator();
       List<JSONObject> jsonSubOrgs = new ArrayList();
       while (iterator.hasNext()) {
         Individual i = iterator.next();
         log.info("getting tree for org " + i.getURI() + " " + i.getName());
         jsonSubOrgs.add(getTreeForOrg(i.getURI(), iwDao));
       }
       map.put("subOrgs",jsonSubOrgs);
       return map;
    }

    private JSONArray getIndexForOrg(String uri, IndividualDao iwDao) throws JSONException  {
       JSONArray array = new JSONArray();
       buildIndexForOrg(uri, "", iwDao, array);
       return array;
    }

    private void buildIndexForOrg(String uri, String parent_uri, IndividualDao iwDao, JSONArray array)  throws JSONException  {
       JSONObject map = new JSONObject();
       Individual org = iwDao.getIndividualByURI(uri);
       map.put("URI", org.getURI());
       map.put("name", org.getName());
       map.put("PARENT_URI", parent_uri);
       array.put(map);

       List<Individual> subOrgs = org.getRelatedIndividuals("http://purl.obolibrary.org/obo/BFO_0000051");
       Iterator<Individual> iterator = subOrgs.iterator();
       List<JSONObject> jsonSubOrgs = new ArrayList();
       while (iterator.hasNext()) {
         Individual i = iterator.next();
         buildIndexForOrg(i.getURI(), org.getURI(), iwDao, array);
       }
    }

    private JSONObject getCGIParams(HttpServletRequest req) throws JSONException {
      JSONObject map = new JSONObject();
      map.put("AUTH_TYPE",req.getAuthType());
      map.put("REMOTE_USER",req.getRemoteUser());
      for (Enumeration<String> headers = req.getHeaderNames();headers.hasMoreElements();) {
        String headerName = headers.nextElement();
        map.put(headerName,req.getHeader(headerName));
      }
      return map;
    }
}
