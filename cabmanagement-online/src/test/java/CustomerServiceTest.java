import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.example.model.Customer;
import com.example.service.CustomerService;

public class CustomerServiceTest {

	
	private CustomerService customerService;
    private Customer validCustomer;
    private int testCustomerId;
    private String uniqueEmail;

    @Before
    public void setUp() {
        customerService = CustomerService.getInstance();
        String randomString = UUID.randomUUID().toString().substring(0, 8);
        uniqueEmail = "test-" + randomString + "@example.com";
        
        validCustomer = new Customer(
            testCustomerId, "Janiya",
            uniqueEmail,
            "Janiya!123",
            "123 Main St",
            "0771234567",
            "200012345678"
        );
    }
    
    @Test
    public void testRegisterCustomerWithValidData() {
       
        boolean result = customerService.registerCustomer(validCustomer);
        assertTrue("Registration should succeed with valid data", result);
        
        
        Customer dbCustomer = customerService.getCustomerByEmail(uniqueEmail);
        assertNotNull("Customer should exist in database", dbCustomer);
        assertEquals("Name should match", validCustomer.getName(), dbCustomer.getName());
        
       
        testCustomerId = dbCustomer.getCustomer_id();
    }
    
    
    @Test
    public void testRegisterWithExistingEmail() {
       
        boolean firstResult = customerService.registerCustomer(validCustomer);
        assertTrue("Initial registration should succeed", firstResult);
        
       
        Customer firstCustomer = customerService.getCustomerByEmail(uniqueEmail);
        testCustomerId = firstCustomer.getCustomer_id();
        
       
        Customer duplicate = new Customer(
            testCustomerId, "Janiya",
            uniqueEmail,  
            "AnotherPass!123",
            "456 Oak St",
            "0777654321",
            "200098765432"
        );
        
        customerService.registerCustomer(duplicate);
    }
    
    
    @Test
    public void testRegisterWithInvalidPassword() {
        Customer invalidPassCustomer = new Customer(
            testCustomerId, "Test User",
            "invalid-pass-test@example.com",
            "weak",  
            "Test Address",
            "0771111111",
            "200011111111"
        );
        
        try {
            customerService.registerCustomer(invalidPassCustomer);
        } finally {
            
            Customer shouldNotExist = customerService.getCustomerByEmail("invalid-pass-test@example.com");
            assertNull("Invalid customer should not be persisted", shouldNotExist);
        }
    }
    
    
 
    @Test
    public void testAuthenticateValidCustomer() {
        customerService.registerCustomer(validCustomer);
        Customer authenticated = customerService.authenticateCustomer(
            validCustomer.getEmail(), 
            validCustomer.getPassword()
        );
        assertNotNull("Authentication should succeed", authenticated);
    }
    
    
    
    @Test
    public void testAuthenticateInvalidPassword() {
        customerService.registerCustomer(validCustomer);
        customerService.authenticateCustomer(
            validCustomer.getEmail(), 
            "wrongpassword"
        );
    }
    
    
    @Test
    public void testGetAllCustomers() throws SQLException {
        int initialCount = customerService.getAllCustomers().size();
        customerService.registerCustomer(validCustomer);
        
        List<Customer> customers = customerService.getAllCustomers();
        assertEquals("Customer count should increase by 1", initialCount + 1, customers.size());
    }
    
    
    @Test
    public void testDeleteCustomer() {
        customerService.registerCustomer(validCustomer);
        Customer dbCustomer = customerService.getCustomerByEmail(validCustomer.getEmail());
        
        boolean deleted = customerService.deleteCustomer(dbCustomer.getCustomer_id());
        assertTrue("Delete should succeed", deleted);
        
        Customer deletedCustomer = customerService.getCustomerById(dbCustomer.getCustomer_id());
        assertNull("Customer should be deleted", deletedCustomer);
    }
    
    
    @Test
    public void testRegisterWithNullValues() {
        Customer nullCustomer = new Customer(
            testCustomerId, 
            null, 
            null,  
            null,  
            null,  
            null,  
            null   
        );
        customerService.registerCustomer(nullCustomer);
    }
    
    
    @Test
    public void testRegisterWithInvalidPhoneFormat() {
        Customer invalidPhone = new Customer(
            testCustomerId, 
            "Test User",
            "Blaaaa.test@example.com",
            "ValidPass!123",
            "Test Address",
            "invalid-phone",  
            "200012345678"
        );
        customerService.registerCustomer(invalidPhone);
    }

    

}
