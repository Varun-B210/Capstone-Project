package viewMenu;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;

import hibernate.Hibernate;
import menu.biriyanihouse;

public class BH extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public BH() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		SessionFactory factory = Hibernate.getSessionFactory();
		Session session = factory.openSession();
		
		
		@SuppressWarnings("unchecked")
		List<biriyanihouse> bhmenu =  session.createQuery("select _biriyanihouse from biriyanihouse _biriyanihouse").getResultList();
		PrintWriter out = response.getWriter();
		out.println("menu" + bhmenu);
		
		List<HashMap<Object, Object>> menumap = new ArrayList<HashMap<Object, Object>>();
		for (biriyanihouse biriyanihouse: bhmenu) {
			HashMap<Object, Object> classMap = new HashMap<>();
			classMap.put("productid",biriyanihouse.getProductid());
			classMap.put("description",biriyanihouse.getDescription());
			classMap.put("price", biriyanihouse.getPrice());

			menumap.add(classMap);
		}JSONArray jsonArray = new JSONArray(menumap);
		request.getRequestDispatcher("Dashboard.jsp?biriyanihouse=" + jsonArray.toString()).forward(request, response);

	} catch (Exception ex) {
		System.out.println("Error");
		ex.printStackTrace();
		
	}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
