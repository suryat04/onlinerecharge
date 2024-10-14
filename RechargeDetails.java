package recharge;

public class RechargeDetails {
    private String name;
    private String mobileNumber;
    private String networkType;
    private String networkName;
    private String rechargePlan;

    // Constructor
    public RechargeDetails(String name, String mobileNumber, String networkType, String networkName, String rechargePlan) {
        this.name = name;
        this.mobileNumber = mobileNumber;
        this.networkType = networkType;
        this.networkName = networkName;
        this.rechargePlan = rechargePlan;
    }

    // Default constructor
    public RechargeDetails() {}

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getNetworkType() {
        return networkType;
    }

    public void setNetworkType(String networkType) {
        this.networkType = networkType;
    }

    public String getNetworkName() {
        return networkName;
    }

    public void setNetworkName(String networkName) {
        this.networkName = networkName;
    }

    public String getRechargePlan() {
        return rechargePlan;
    }

    public void setRechargePlan(String rechargePlan) {
        this.rechargePlan = rechargePlan;
    }

    // Overriding toString() method
    @Override
    public String toString() {
        return "RechargeDetails{" +
                "name='" + name + '\'' +
                ", mobileNumber='" + mobileNumber + '\'' +
                ", networkType='" + networkType + '\'' +
                ", networkName='" + networkName + '\'' +
                ", rechargePlan='" + rechargePlan + '\'' +
                '}';
    }
}
