package com.web;

import java.io.*;
import javax.script.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.Cookie;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class CodeExec extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CodeExec() {
        super();
    }
    /**
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
    /**
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //String action = request.getParameter("action");
        //System.out.println("Post action is: " + action);
        String code = request.getParameter("code");

        // create a script engine manager
        ScriptEngineManager factory = new ScriptEngineManager();
        // create a JavaScript engine
        ScriptEngine engine = factory.getEngineByName("JavaScript");
        // evaluate JavaScript code from String
        String output;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            engine.getContext().setWriter(pw);
            engine.eval(code);
            output = sw.getBuffer().toString();
        }
        catch (javax.script.ScriptException ex)
        {
            output = "Script error on line: "+ex.getLineNumber()+"\n"+ex.getMessage();
        }

        request.setAttribute("data",output);
        String forward = "/WEB-INF/data.jsp";

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}