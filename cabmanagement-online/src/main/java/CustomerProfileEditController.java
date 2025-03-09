

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Customer;
import com.example.service.CustomerService;

/**
 * Servlet implementation class CustomerProfileEditController
 */
@WebServlet("/customer/editProfile")
public class CustomerProfileEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerProfileEditController() {
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
		 HttpSession session = request.getSession(false);
	        if(session == null || session.getAttribute("customerId") == null) {
	            response.sendRedirect(request.getContextPath() + "/registration/login.jsp");
	            return;
	        }
	        int customerId = (Integer) session.getAttribute("customerId");
	        Customer customer = customerService.getCustomerById(customerId);
	        request.setAttribute("customer", customer);
	        request.getRequestDispatcher("/registration/editCustomerProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("customer_id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        String nic = request.getParameter("nic");
        
        Customer customer = new Customer(customerId, name, email, password, address, phone_number, nic);
        boolean isUpdated = customerService.updateCustomerProfile(customer);
        if(isUpdated) {
            response.sendRedirect(request.getContextPath() + "/registration/customerDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update your profile. Please try again.");
            request.getRequestDispatcher("/registration/editCustomerProfile.jsp").forward(request, response);
        }
    }

}
