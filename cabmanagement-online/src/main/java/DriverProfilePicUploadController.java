

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.example.dao.DriverDAO;
import com.example.model.Driver;

/**
 * Servlet implementation class DriverProfilePicUploadController
 */
@WebServlet("/DriverReg/uploadProfilePic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1,maxFileSize = 1024 * 1024 * 5,maxRequestSize = 1024 * 1024 * 10)
public class DriverProfilePicUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private static final String UPLOAD_DIR = "uploads/drivers";
	
    public DriverProfilePicUploadController() {
        super();
        // TODO Auto-generated constructor stub
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
		
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("driver") == null) {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverLogin.jsp");
            return;
        }
        
        Driver driver = (Driver) session.getAttribute("driver");
        int driverId = driver.getDriver_id();
        
        
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        
        Part filePart = request.getPart("profilePic");
        String fileName = getFileName(filePart);
        if (fileName == null || fileName.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverDashBoard.jsp?error=No file selected");
            return;
        }
        
       
        String newFileName = "driver_" + driverId + "_" + System.currentTimeMillis() + "_" + fileName;
        String filePath = uploadPath + File.separator + newFileName;
        filePart.write(filePath);
        
        
        String profilePicPath = UPLOAD_DIR + "/" + newFileName;
        boolean isUpdated = DriverDAO.updateDriverProfilePicture(driverId, profilePicPath);
        
        if (isUpdated) {
            
            driver.setProfilePic(profilePicPath);
            session.setAttribute("driver", driver);
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverDashBoard.jsp?success=Profile picture updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverDashBoard.jsp?error=Failed to update profile picture");
        }
	}
	
	
	private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
