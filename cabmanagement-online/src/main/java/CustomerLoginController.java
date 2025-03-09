

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
 * Servlet implementation class CustomerLoginController
 */
@WebServlet("/registration/login")
public class CustomerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    public void init() throws ServletException {
    	this.customerService = new CustomerService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			Customer customer = customerService.authenticateCustomer(email, password);
			if(customer != null){
				HttpSession session = request.getSession();
				session.setAttribute("customerId", customer.getCustomer_id());
				session.setAttribute("customer", customer);
				response.sendRedirect(request.getContextPath() + "/registration/customerDashboard.jsp");
			}else {
				response.getWriter().write("Invalid Email or Password! Please try again.");
			}
		}catch(IllegalArgumentException e){
			response.getWriter().write("Error" + e.getMessage());
		}
		
		
	}

}
