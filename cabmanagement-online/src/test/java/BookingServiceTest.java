import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.example.model.Booking;
import com.example.model.Customer;
import com.example.service.BookingService;
import com.example.service.CustomerService;

public class BookingServiceTest {

	private BookingService bookingService;
    private CustomerService customerService;
    private int testCustomerId;
    private int testBookingId;

    @Before
    public void setUp() {
        bookingService = new BookingService();
        customerService = CustomerService.getInstance();
        Customer testCustomer = new Customer(
            testBookingId, 
            "Booking Test User",
            "testuuuuuu@example.com",
            "TestPass!123",
            "Test Address",
            "0771122334",
            "200098765432"
        );
        customerService.registerCustomer(testCustomer);
        testCustomerId = customerService.getCustomerByEmail("booking.test@example.com").getCustomer_id();
    }
    
    
    @Test
    public void testCreateValidBooking() {
        
        Booking booking = new Booking(
            0, 
            testCustomerId,
            "City Center",
            "Suburb Station",
            12.5,
            "4-passenger",
            bookingService.calculateFare(12.5, "4-passenger"),
            LocalDate.now().plusDays(1),
            Timestamp.valueOf(LocalDateTime.now().plusHours(2)),
            "Pending",
            2,
            1,
            "New"
        );
        
       
        boolean result = bookingService.createBooking(booking);
        
       
        assertTrue("Booking creation should succeed", result);
        assertTrue("Booking ID should be generated", booking.getBookingId() > 0);
        
       
        Booking dbBooking = bookingService.getBookingById(booking.getBookingId());
        assertNotNull("Booking should exist in DB", dbBooking);
        assertEquals("Pickup location mismatch", 
                    "City Center", dbBooking.getPickupLocation());
        assertEquals("Fare calculation error", 
                    1550.0, dbBooking.getFare(), 0.001);
        
        testBookingId = booking.getBookingId();
    }
    
    
    
    @Test
    public void testStatusUpdateWorkflow() {
        Booking booking = createTestBooking("Office", "Home");
        assertEquals("New", booking.getBookingStatus());
        boolean result1 = bookingService.updateBookingStatus(
            booking.getBookingId(), "Confirmed"
        );
        assertTrue("Status update should succeed", result1);
        boolean result2 = bookingService.updateBookingStatus(
            booking.getBookingId(), "Completed"
        );
        assertTrue("Status update should succeed", result2);
        Booking updated = bookingService.getBookingById(booking.getBookingId());
        assertEquals("Completed", updated.getBookingStatus());
    }
    
    
    @Test
    public void testCalculateFare() {
       
        assertEquals(1000.0, 
            bookingService.calculateFare(10, "4-passenger"), 0.001);
        
       
        assertEquals(3000.0, 
            bookingService.calculateFare(15, "8-passenger"), 0.001);
        
        
        assertEquals(0.0, 
            bookingService.calculateFare(5, "bicycle"), 0.001);
    }
    
    
    @Test
    public void testGetBookingsByCustomerId() {
        
        Booking booking1 = createTestBooking("Location A", "Location B");
        Booking booking2 = createTestBooking("Location C", "Location D");
        
        List<Booking> bookings = bookingService.getBookingsByCustomerId(testCustomerId);
        assertEquals("Should retrieve 2 bookings", 2, bookings.size());
        assertTrue("Should contain first booking", 
                 bookings.stream().anyMatch(b -> b.getBookingId() == booking1.getBookingId()));
    }
    
    
    @Test
    public void testDriverAssignment() {
        Booking booking = createTestBooking("Hotel", "Airport");
        int driverId = 123; 
        
        
        boolean result = bookingService.assignDriverToBooking(
            booking.getBookingId(), driverId, "Assigned"
        );
        
        assertTrue("Driver assignment should succeed", result);
        
        // Verify update
        Booking updated = bookingService.getBookingById(booking.getBookingId());
        assertEquals("Driver ID should be set", driverId, updated.getCustomerId());
        assertEquals("Status should update", "Assigned", updated.getBookingStatus());
    }
    
    
    
    
    private Booking createTestBooking(String pickup, String drop) {
        Booking booking = constructValidBooking();
        booking.setPickupLocation(pickup);
        booking.setDropLocation(drop);
        bookingService.createBooking(booking);
        testBookingId = booking.getBookingId();
        return booking;
    }

   
    private Booking constructValidBooking() {
        return new Booking(
            0, 
            testCustomerId,
            "City Center",
            "Suburb Station",
            12.5,
            "10-passenger",
            bookingService.calculateFare(12.5, "4-passenger"), 
            LocalDate.now().plusDays(1),
            Timestamp.valueOf(LocalDateTime.now().plusHours(2)),
            "Pending",
            2,
            1,
            "New"
        );
    }
    
    
    
}
