package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cs.Notepad;
import com.factory.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title =request.getParameter("title");
			String content = request.getParameter("content");
			int noteid = Integer.parseInt(request.getParameter("noteId").trim()); 
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx =session.beginTransaction();
			
			Notepad note =session.get(Notepad.class, noteid);
			note.setTitle(title);
			note.setContent(content);
			note.setAddeddate(new Date());
			tx.commit();
			session.close();
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
