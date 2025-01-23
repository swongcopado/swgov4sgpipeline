@IsTest
private class MapletreeCalculatorTest {
    
    @IsTest
    static void testCalculateCommission() {
        // Test case 1: Regular positive number
        Decimal amount1 = 1000;
        Decimal expectedCommission1 = 100.00;
        Decimal actualCommission1 = MapletreeCalculator.calculateCommission(amount1);
        System.assertEquals(expectedCommission1, actualCommission1, 
            'Commission for 1000 should be 100.00');
        
        // Test case 2: Zero amount
        Decimal amount2 = 0;
        Decimal expectedCommission2 = 0.00;
        Decimal actualCommission2 = MapletreeCalculator.calculateCommission(amount2);
        System.assertEquals(expectedCommission2, actualCommission2, 
            'Commission for 0 should be 0.00');
        
        // Test case 3: Decimal amount
        Decimal amount3 = 1234.56;
        Decimal expectedCommission3 = 123.46;
        Decimal actualCommission3 = MapletreeCalculator.calculateCommission(amount3);
        System.assertEquals(expectedCommission3, actualCommission3, 
            'Commission for 1234.56 should be 123.46');
        
        // Test case 4: Negative amount
        Decimal amount4 = -500;
        Decimal expectedCommission4 = -50.00;
        Decimal actualCommission4 = MapletreeCalculator.calculateCommission(amount4);
        System.assertEquals(expectedCommission4, actualCommission4, 
            'Commission for -500 should be -50.00');
        
        // Test case 5: Null amount
        Decimal amount5 = null;
        Decimal expectedCommission5 = 0.00;
        Decimal actualCommission5 = MapletreeCalculator.calculateCommission(amount5);
        System.assertEquals(expectedCommission5, actualCommission5, 
            'Commission for null should be 0.00');
    }
    
    @IsTest
    static void testCalculateCommissionBulk() {
        // Test bulk calculations
        List<Decimal> amounts = new List<Decimal>();
        List<Decimal> expectedCommissions = new List<Decimal>();
        
        // Create test data
        for(Integer i = 1; i <= 200; i++) {
            amounts.add(i * 100);
            expectedCommissions.add((i * 100 * 0.10).setScale(2));
        }
        
        // Test bulk processing
        Test.startTest();
        List<Decimal> actualCommissions = new List<Decimal>();
        for(Decimal amt : amounts) {
            actualCommissions.add(MapletreeCalculator.calculateCommission(amt));
        }
        Test.stopTest();
        
        // Verify results
        System.assertEquals(expectedCommissions.size(), actualCommissions.size(), 
            'Number of commissions calculated should match');
        
        for(Integer i = 0; i < expectedCommissions.size(); i++) {
            System.assertEquals(expectedCommissions[i], actualCommissions[i], 
                'Commission calculation mismatch at index ' + i);
        }
    }
}