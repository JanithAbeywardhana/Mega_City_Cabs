import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;

import com.example.dao.DriverDAO;
import com.example.model.Driver;
import com.example.service.DriverService;

public class DriverServiceTest {

	private DriverService driverService;
    private Driver validDriver;
    private int[] generatedId;

    @Before
    public void setUp() {
        driverService = DriverService.getInstance();
        generatedId = new int[1];
        
       
        validDriver = new Driver(
            0, "John Doe",
            "john.doe@example.com",
            "DL-123456",
            "123 Main St",
            "SecurePass!123",
            "night",
            "Male", null
            
        );
    }
    
    @Test
    public void testRegisterDriverWithValidData() {
        boolean result = driverService.registerDriver(validDriver, generatedId);
        
        assertTrue("Registration should succeed with valid data", result);
        assertTrue("Generated ID should be positive", generatedId[0] > 0);
    }
    
    @Test(expected = IllegalArgumentException.class)
    public void testRegisterDriverWithExistingEmail() {
        
        driverService.registerDriver(validDriver, generatedId);
        
       
        Driver duplicateDriver = new Driver(
            0, "John Doe Clone",
            "john.doe@example.com",
            "DL-654321",
            "456 Oak St",
            "AnotherPass!456",
            "10:00-18:00",
            "Male", null
        );
        driverService.registerDriver(duplicateDriver, generatedId);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testRegisterDriverWithInvalidPassword() {
        Driver invalidPasswordDriver = new Driver(
            0, "Jane Doe",
            "jane.doe@example.com",
            "DL-987654",
            "789 Pine St",
            "weak",
            "08:00-16:00",
            "Female", null
        );
        driverService.registerDriver(invalidPasswordDriver, generatedId);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testRegisterDriverWithMissingName() {
        Driver noNameDriver = new Driver(
            0, "", 
            "noname@example.com",
            "DL-111222",
            "321 Elm St",
            "ValidPass!123",
            "09:00-17:00",
            "Male", null
        );
        driverService.registerDriver(noNameDriver, generatedId);
    }
    
    
    @Test
    public void testDriverPersistedInDatabase() {
       
        boolean result = driverService.registerDriver(validDriver, generatedId);
        assertTrue(result);
        
      
        Driver dbDriver = DriverDAO.getDriverByEmail(validDriver.getEmail());
        
        assertNotNull("Driver should exist in database", dbDriver);
        assertEquals("Name should match", validDriver.getName(), dbDriver.getName());
        assertEquals("Email should match", validDriver.getEmail(), dbDriver.getEmail());
        assertEquals("License should match", validDriver.getLicense_number(), dbDriver.getLicense_number());
    }
    
    
    @Test(expected = IllegalArgumentException.class)
    public void testRegisterDriverWithNullValues() {
        Driver nullDriver = new Driver(
            0, null,  
            null,  
            null,  
            null, 
            null,  
            null,  
            null, 
            null
        );
        driverService.registerDriver(nullDriver, generatedId);
    }

    @Test
    public void testRegistrationWithMinimumValidPassword() {
        Driver minPasswordDriver = new Driver(
            0, "Test User",
            "min.pass@test.com",
            "DL-MINPASS",
            "Test Address",
            "A!123456",  
            "09:00-17:00",
            "Male", null
        );
        
        assertTrue(driverService.registerDriver(minPasswordDriver, generatedId));
    }
    

    



}
