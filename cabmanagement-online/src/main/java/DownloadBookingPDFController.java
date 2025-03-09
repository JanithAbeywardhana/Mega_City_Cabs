

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.example.dao.BookingDAO;
import com.example.model.Booking;

/**
 * Servlet implementation class DownloadBookingPDFController
 */
@WebServlet("/customer/downloadBookingPDF")
public class DownloadBookingPDFController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadBookingPDFController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            Booking booking = BookingDAO.getBookingById(bookingId);
            
            if (booking == null) {
                response.getWriter().write("Booking not found.");
                return;
            }
            
            
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"Booking_" + bookingId + ".pdf\"");
            
            
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
         
            document.add(new Paragraph("Booking Details"));
            document.add(new Paragraph("Booking ID: " + booking.getBookingId()));
            document.add(new Paragraph("Customer Name: " + booking.getCustomerName()));
            document.add(new Paragraph("Pickup Location: " + booking.getPickupLocation()));
            document.add(new Paragraph("Drop Location: " + booking.getDropLocation()));
            document.add(new Paragraph("Vehicle Type: " + booking.getVehicleType()));
            document.add(new Paragraph("Fare: Rs. " + booking.getFare()));
            document.add(new Paragraph("Booking Date: " + booking.getBookingDate()));
            document.add(new Paragraph("Booking Time: " + booking.getBookingTime()));
            document.add(new Paragraph("Payment Status: " + booking.getPaymentStatus()));
            document.add(new Paragraph("Booking Status: " + booking.getBookingStatus()));
            document.add(new Paragraph("Passenger Count: " + booking.getPassengerCount()));
            document.add(new Paragraph("Luggage Count: " + booking.getLuggageCount()));
            
           
            document.close();
        } catch (DocumentException | NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("Error generating PDF: " + e.getMessage());
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
