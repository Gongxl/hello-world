package com.google.appengine.demos.guestbook;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class Worker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String key = request.getParameter("key");
        String value = request.getParameter("value");
        // Do something with key.
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Entity d1 = new Entity("TaskData",key);
        Date date = new Date();
        d1.setProperty("key",key);
        d1.setProperty("value", value);
        d1.setProperty("date",date);
        datastore.put(d1);
    }
}