

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.DriverDAO;

/**
 * Servlet implementation class DeleteDriverController
 */
@WebServlet("/admin/deleteDriver")
public class DeleteDriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDriverController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            int driverId = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = DriverDAO.deleteDriver(driverId);
            if (isDeleted) {
                response.sendRedirect(request.getContextPath() + "/admin/viewDrivers");
            } else {
                response.getWriter().write("Failed to delete driver.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("Invalid driver id.");
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
