
import com.example.model.Customer;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.service.CustomerService;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/registration/registerCustomer")
public class CustomerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CustomerService customerService;
       
	
	public void init() throws ServletException{
		this.customerService = new CustomerService();
	} 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone_number  = request.getParameter("phone_number");
		String nic = request.getParameter("nic");
		
		
		Customer customer = new Customer(0, name, email, password, address, phone_number, nic);
		try {
			boolean isRegistered = customerService.registerCustomer(customer);
			if(isRegistered) {
				response.sendRedirect(request.getContextPath() + "/registration/login.jsp");
				
			}else {
				response.getWriter().write("Faild to Register as Customer.");
			}
		}catch(IllegalArgumentException e){
			response.getWriter().write("Error: " + e.getMessage());
		}
	}
	
	



}
