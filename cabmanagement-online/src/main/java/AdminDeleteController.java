

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.service.CustomerService;

/**
 * Servlet implementation class AdminDeleteController
 */
@WebServlet("/admin/deleteCustomer")
public class AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
        customerService = CustomerService.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            int customerId = Integer.parseInt(request.getParameter("id"));
	            boolean isDeleted = customerService.deleteCustomer(customerId);
	            if (isDeleted) {
	                response.sendRedirect(request.getContextPath() + "/admin/viewCustomers");
	            } else {
	                response.getWriter().write("Failed to delete customer.");
	            }
	        } catch (NumberFormatException e) {
	            response.getWriter().write("Invalid customer id.");
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
