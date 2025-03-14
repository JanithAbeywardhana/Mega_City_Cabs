

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Driver;
import com.example.service.BookingService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


@WebServlet("/driver/downloadEarningsPDF")
public class DownloadEarningsPDFController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService = new BookingService();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadEarningsPDFController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("driver") == null) {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverLogin.jsp");
            return;
        }
        Driver driver = (Driver) session.getAttribute("driver");
        double earnings = bookingService.calculateDriverEarnings(driver.getDriver_id());

        // Set response content type to PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"driverEarnings.pdf\"");

        try {
             Document document = new Document();
             PdfWriter.getInstance(document, response.getOutputStream());
             document.open();
             document.add(new Paragraph("Driver Earnings Report"));
             document.add(new Paragraph("Driver Name: " + driver.getName()));
             document.add(new Paragraph("Total Earnings: Rs. " + earnings));
             document.close();
        } catch (Exception e) {
             e.printStackTrace();
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
