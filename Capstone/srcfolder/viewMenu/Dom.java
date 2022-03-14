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
import menu.dominos;

/**
 * Servlet implementation class Dom
 */
public class Dom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SessionFactory factory = Hibernate.getSessionFactory();
			Session session = factory.openSession();
			
			
			@SuppressWarnings("unchecked")
			List<dominos> dmenu =  session.createQuery("select _dominos from dominos _dominos").getResultList();
			PrintWriter out = response.getWriter();
			out.println("menu" + dmenu);
			
			List<HashMap<Object, Object>> menumap = new ArrayList<HashMap<Object, Object>>();
			for (dominos d: dmenu) {
				HashMap<Object, Object> classMap = new HashMap<>();
				classMap.put("productid",d.getProductid());
				classMap.put("description",d.getDescription());
				classMap.put("price", d.getPrice());

				menumap.add(classMap);
			}JSONArray jsonArray = new JSONArray(menumap);
			request.getRequestDispatcher("Dashboard.jsp?dominos=" + jsonArray.toString()).forward(request, response);

		} catch (Exception ex) {
			System.out.println("Error");
			ex.printStackTrace();
			
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
