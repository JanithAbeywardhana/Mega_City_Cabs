

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

/**
 * Servlet implementation class CustomerBookingProgressController
 */
@WebServlet("/customer/bookingProgress")
public class CustomerBookingProgressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerBookingProgressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String bookingIdParam = request.getParameter("bookingId");
        if (bookingIdParam != null) {
            try {
                int bookingId = Integer.parseInt(bookingIdParam);
                
                Booking booking = BookingDAO.getBookingById(bookingId);
                if (booking != null) {
                    request.setAttribute("booking", booking);
                    
                    request.getRequestDispatcher("/registration/customerBookingProgress.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/customer/dashboard.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
