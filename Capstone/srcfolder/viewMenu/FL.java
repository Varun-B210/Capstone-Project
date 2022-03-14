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
import menu.foodlands;

/**
 * Servlet implementation class FL
 */
public class FL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FL() {
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
			List<foodlands> fmenu =  session.createQuery("select _foodlands from foodlands _foodlands").getResultList();
			PrintWriter out = response.getWriter();
			out.println("menu" + fmenu);
			
			List<HashMap<Object, Object>> menumap = new ArrayList<HashMap<Object, Object>>();
			for (foodlands foodlands: fmenu) {
				HashMap<Object, Object> classMap = new HashMap<>();
				classMap.put("productid",foodlands.getProductid());
				classMap.put("description",foodlands.getDescription());
				classMap.put("price", foodlands.getPrice());

				menumap.add(classMap);
			}JSONArray jsonArray = new JSONArray(menumap);
			request.getRequestDispatcher("Dashboard.jsp?foodlands=" + jsonArray.toString()).forward(request, response);

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
