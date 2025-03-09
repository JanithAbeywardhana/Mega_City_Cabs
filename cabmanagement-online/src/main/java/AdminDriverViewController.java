

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.DriverDAO;
import com.example.model.Driver;
import com.example.service.DriverService;

/**
 * Servlet implementation class AdminDriverViewController
 */
@WebServlet("/admin/viewDrivers")
public class AdminDriverViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DriverService driverService;  
    
    
    public void init() throws ServletException{
    	driverService = new DriverService();
    }
    public AdminDriverViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Driver> drivers = driverService.getAllDrivers();
	        request.setAttribute("drivers", drivers);
	        request.getRequestDispatcher("/Admin/adminDriverList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
