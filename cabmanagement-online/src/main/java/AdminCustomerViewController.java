

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Customer;
import com.example.service.CustomerService;

/**
 * Servlet implementation class AdminCustomerViewController
 */
@WebServlet("/admin/viewCustomers")
public class AdminCustomerViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCustomerViewController() {
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

		List<Customer> customers = new ArrayList<Customer>();
		try {
			customers = customerService.getAllCustomers();
			request.setAttribute("customers", customers);
		} catch ( SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/Admin/adminCustomerList.jsp").forward(request, response);
			return;
		}

	    request.getRequestDispatcher("/Admin/adminCustomerList.jsp").forward(request, response);
	    
	}
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
