package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cs.Notepad;
import com.factory.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		int noteid = Integer.parseInt(request.getParameter("id").trim());
		Session session=FactoryProvider.getFactory().openSession();
		Transaction tx =session.beginTransaction();
		Notepad note=(Notepad)session.get(Notepad.class,noteid);
		session.delete(note);
		
		tx.commit();
		session.close();
		response.sendRedirect("all_notes.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}
}
