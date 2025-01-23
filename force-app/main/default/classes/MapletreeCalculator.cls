public class MapletreeCalculator {
    
    /**
     * Calculates commission as 10% of the input amount
     * @param amount The input amount to calculate commission from
     * @return Decimal The calculated commission (10% of input)
     */
    public static Decimal calculateCommission(Decimal amount) {
        // Validate input
        if (amount == null) {
            return 0;
        }
        
        // Calculate 10% commission
        return (amount * 0.10).setScale(2);
    }
}