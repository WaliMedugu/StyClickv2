
const String baseUrl = "https://styclick-backend.onrender.com/api/v1/";

// ── Auth ──────────────────────────────────────────────────────────────────
const String register        = "auth/signup";
const String signIn          = "auth/login";
const String verifyUser      = "auth/verify";
const String resendOtp       = "auth/resend-otp";
const String resetRequest    = "auth/password-reset-request";
const String changePassword  = "auth/reset-password";
const String adminSignIn     = "auth/admin/login";

// ── Profile ───────────────────────────────────────────────────────────────
const String getProfile      = "user/profile";
const String updateProfile   = "user/update-profile";

// ── Wallet ────────────────────────────────────────────────────────────────
const String walletBalance   = "wallet/dashboard";
const String walletTransactions = "wallet/transactions";
const String walletFund      = "wallet/add-fund";
const String walletWithdraw  = "wallet/withdraw";

// ── Vendor / Seller / Rider ───────────────────────────────────────────────
const String becomeVendor    = "user/designer/register";
const String becomeSeller    = "user/fabric-seller/register";
const String becomeRider     = "user/riders/register";
