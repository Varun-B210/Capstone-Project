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
import menu.coriander;

/**
 * Servlet implementation class Cor
 */
public class Cor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cor() {
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
			List<coriander> cmenu =  session.createQuery("select _coriander from coriander _coriander").getResultList();
			PrintWriter out = response.getWriter();
			out.println("menu" + cmenu);
			
			List<HashMap<Object, Object>> menumap = new ArrayList<HashMap<Object, Object>>();
			for (coriander cr: cmenu) {
				HashMap<Object, Object> classMap = new HashMap<>();
				classMap.put("productid",cr.getProductid());
				classMap.put("description",cr.getDescription());
				classMap.put("price",cr.getPrice());

				menumap.add(classMap);
			}JSONArray jsonArray = new JSONArray(menumap);
			request.getRequestDispatcher("Dashboard.jsp?coriander=" + jsonArray.toString()).forward(request, response);

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
