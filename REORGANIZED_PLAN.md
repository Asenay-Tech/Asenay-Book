# i-Bookkeeper: REORGANIZED STEP-BY-STEP PLAN

## IMPORTANT: Follow Steps in This Exact Order

This plan has been reorganized so the token system is built EARLY (Steps 51-80), ensuring all features integrate tokens from the start. No retrofitting needed.

**PLATFORM SUPPORT:**
- ✅ Web App (Next.js) - Responsive, works on all devices
- ✅ Android App (React Native)
- ✅ iPhone App (React Native)
- ✅ Shared API Backend (works for web and mobile)

---

## PHASE 1: FOUNDATION (Steps 1-50)
**Same as original - no changes needed**

---

## PHASE 2: TOKEN SYSTEM FOUNDATION (Steps 51-80) ⭐ MOVED EARLY
**Build token system BEFORE building features**

### Database Schema for Tokens (Steps 51-60)
- Step 51: Create Token Usage Table Migration
- Step 52: Create Token Transactions Table Migration  
- Step 53: Create Subscription Plans Table (with tokens_per_month)
- Step 54: Create Subscriptions Table
- Step 55: Seed Subscription Plans (Free Trial, Basic, Starter, Pro, Plus)
- Step 56: Add RLS Policies to Token Tables
- Step 57: Add Indexes to Token Tables
- Step 58: Test Token Database Schema
- Step 59: Create Token Functions (Database)
- Step 60: Test Database Functions

### Token System Core Logic (Steps 61-70)
- Step 61: Create Token Allocation Function
- Step 62: Create Token Check Function
- Step 63: Create Token Deduction Function
- Step 64: Create Token Transaction Logger
- Step 65: Create Token Usage Calculator
- Step 66: Create Token Middleware
- Step 67: Create Token Status API
- Step 68: Create Token Status Component
- Step 69: Test Token System Core
- Step 70: Add Token Status to Dashboard

### Free Trial System (Steps 71-80)
- Step 71: Auto-Assign Free Trial on Signup
- Step 72: Create Trial Expiration Check
- Step 73: Create Trial Status API
- Step 74: Create Trial Status Component
- Step 75: Create Plan Selection Popup Component
- Step 76: Show Popup When Tokens Exhausted
- Step 77: Show Popup When Trial Expires
- Step 78: Add Upgrade Flow from Popup
- Step 79: Block Actions After Trial Expires
- Step 80: Add Trial Warning Notifications

---

## PHASE 3: CORE FEATURES WITH TOKEN INTEGRATION (Steps 81-150)
**All features built with token checks from the start**

### Business Setup (Steps 81-90)
- Step 81: Create Business Setup Page Route
- Step 82: Create Business Form Component
- Step 83: Add Business Form State
- Step 84: Create Create Business API Route (WITH Free Trial assignment)
- Step 85: Connect Business Form to API
- Step 86: Handle Business Creation Success
- Step 87: Add Business Validation
- Step 88: Style Business Setup Page
- Step 89: Create Get Business API Route
- Step 90: Add Business Context Provider

### Chart of Accounts (Steps 91-100)
- Step 91: Create Accounts List Page Route
- Step 92: Create Get Accounts API Route
- Step 93: Create Accounts List Component
- Step 94: Connect Accounts List to API
- Step 95: Create Add Account Form Component
- Step 96: Create Create Account API Route (NO tokens - free)
- Step 97: Connect Add Account Form to API
- Step 98: Refresh Accounts List After Creation
- Step 99: Add Account Type Validation
- Step 100: Style Accounts Page

### Categories (Steps 101-110)
- Step 101: Create Categories List Page Route
- Step 102: Create Get Categories API Route
- Step 103: Create Categories List Component
- Step 104: Connect Categories List to API
- Step 105: Create Add Category Form
- Step 106: Create Create Category API Route (NO tokens - free)
- Step 107: Connect Add Category Form to API
- Step 108: Refresh Categories List After Creation
- Step 109: Add Default Categories Seeder
- Step 110: Style Categories Page

### Transactions - Basic CRUD WITH TOKEN CHECKS (Steps 111-140)
- Step 111: Create Transactions List Page Route
- Step 112: Create Get Transactions API Route (NO tokens - reading is free)
- Step 113: Create Transactions List Component
- Step 114: Connect Transactions List to API
- Step 115: Create Transaction Form Component
- Step 116: Add Transaction Form State
- Step 117: Create Double-Entry Validation Function
- Step 118: Create Create Transaction API Route WITH TOKEN CHECK (1 token)
- Step 119: Connect Transaction Form to API
- Step 120: Refresh Transactions List After Creation
- Step 121: Add Transaction Validation
- Step 122: Create Transaction Detail Page Route
- Step 123: Create Get Transaction API Route
- Step 124: Create Transaction Detail Component
- Step 125: Connect Transaction Detail to API
- Step 126: Add Edit Transaction Functionality
- Step 127: Create Update Transaction API Route (NO tokens - editing is free)
- Step 128: Add Delete Transaction Functionality
- Step 129: Create Delete Transaction API Route (NO tokens - deleting is free)
- Step 130: Style Transactions Pages
- Step 131: Update Transaction Form for Double-Entry
- Step 132: Add Transaction Line Management
- Step 133: Update Validation for Double-Entry
- Step 134: Update Create Transaction API for Double-Entry (still 1 token)
- Step 135: Create Account Balance Calculation Function
- Step 136: Update Account Balance on Transaction Create
- Step 137: Display Account Balances
- Step 138: Add Balance History Query
- Step 139: Update Transaction Detail to Show Lines
- Step 140: Test Double-Entry System with Tokens

### Basic Categorization WITH TOKEN CHECKS (Steps 141-150)
- Step 141: Create Categorization Rules Table
- Step 142: Create Rule-Based Categorization Function
- Step 143: Create Categorize Transaction API Route WITH TOKEN CHECK (2 tokens)
- Step 144: Auto-Categorize on Transaction Create WITH TOKEN CHECK
- Step 145: Create Categorization Rules Management API (NO tokens - free)
- Step 146: Create Rules Management UI
- Step 147: Create Add Rule Form
- Step 148: Create Rules List Component
- Step 149: Add Test Rule Functionality
- Step 150: Test Categorization System with Tokens

---

## PHASE 4: MULTI-INPUT METHODS WITH TOKEN INTEGRATION (Steps 151-230)

### Document Upload & OCR WITH TOKEN CHECKS (Steps 151-180)
- Step 151: Configure Supabase Storage
- Step 152: Create Document Upload API Route WITH TOKEN CHECK (5 tokens per file)
- Step 153: Create File Upload Component
- Step 154: Connect File Upload to API
- Step 155: Create Document Record After Upload
- Step 156: Install OCR Library
- Step 157: Create OCR Processing Function
- Step 158: Create OCR Worker/Queue Setup
- Step 159: Process OCR After Upload WITH TOKEN CHECK (10 tokens per page)
- Step 160: Store OCR Results in Database
- Step 161: Create Documents List Page
- Step 162: Create Get Documents API Route (NO tokens - reading is free)
- Step 163: Create Documents List Component
- Step 164: Create Document Detail Page
- Step 165: Display Document Image
- Step 166: Display OCR Results
- Step 167: Create Field Extraction Function
- Step 168: Display Extracted Fields
- Step 169: Allow Editing Extracted Fields
- Step 170: Create Transaction from Document (1 token for transaction)
- Step 171: Enhance File Upload for Multiple Types (still 5 tokens each)
- Step 172: Add Bulk Upload Support (5 tokens per file)
- Step 173: Create ZIP Extraction Function (5 tokens per extracted file)
- Step 174: Add Multi-Page PDF Support (10 tokens per page)
- Step 175: Create Document Type Detector
- Step 176: Add Excel Parser (3 tokens for parsing)
- Step 177: Add CSV Parser for Documents (3 tokens for parsing)
- Step 178: Add Word Document Parser (3 tokens for parsing)
- Step 179: Create Bulk Processing Queue
- Step 180: Test Document Upload System with Tokens

### QR Code Scanning WITH TOKEN CHECKS (Steps 181-200)
- Step 181: Install QR Code Library
- Step 182: Create QR Code Detection Function
- Step 183: Create QR Code Parser
- Step 184: Add Country-Specific QR Standards
- Step 185: Create QR Scan API Route WITH TOKEN CHECK (3 tokens)
- Step 186: Create QR Scanner Component
- Step 187: Integrate QR Scan into Document Upload (3 tokens if QR found)
- Step 188: Create QR Data Extraction UI
- Step 189: Auto-Fill Transaction from QR (1 token transaction + 3 QR = 4 total)
- Step 190: Add QR Scan to Camera Capture (3 tokens per scan)
- Step 191: Test QR Scanning System with Tokens
- Step 192: Install Barcode Library
- Step 193: Create Barcode Detection Function
- Step 194: Create Barcode Parser
- Step 195: Support Multiple Barcode Formats
- Step 196: Create Barcode Scan API Route WITH TOKEN CHECK (2 tokens)
- Step 197: Create Barcode Scanner Component
- Step 198: Integrate Barcode Scan into Document Upload (2 tokens if barcode found)
- Step 199: Create Barcode Data Display
- Step 200: Test Barcode Scanning System with Tokens

### Camera Capture WITH TOKEN CHECKS (Steps 201-220)
- Step 201: Create Camera Capture Component
- Step 202: Add Image Auto-Enhancement (2 tokens)
- Step 203: Add Image Deskew Function (included in enhancement)
- Step 204: Add Auto-Crop Function (included in enhancement)
- Step 205: Create Real-Time OCR Preview (NO tokens - preview only)
- Step 206: Add Camera Controls
- Step 207: Create Camera Capture Page
- Step 208: Add Mobile-Optimized Camera UI
- Step 209: Integrate Camera with OCR Pipeline WITH TOKEN CHECK (5 capture + 2 enhance + 10 OCR = 17 tokens)
- Step 210: Add Camera Capture to Quick Actions
- Step 211: Test Camera Capture System with Tokens

### Manual Entry Enhancement (Steps 212-230)
- Step 212: Enhance Transaction Form with Auto-Complete (NO tokens - suggestions free)
- Step 213: Create Vendor Database
- Step 214: Add Vendor Auto-Complete
- Step 215: Add Category Auto-Complete
- Step 216: Create Smart Suggestions Engine (NO tokens - suggestions free)
- Step 217: Add Payment Method Field
- Step 218: Add Recurring Transaction Detection (NO tokens - detection free)
- Step 219: Create Quick Entry Mode (1 token per transaction)
- Step 220: Add Transaction Templates (NO tokens - templates free)
- Step 221: Add Bulk Manual Entry (1 token per transaction)
- Step 222: Test Manual Entry System

---

## PHASE 5: FINANCIAL REPORTS (Steps 223-250)
**Reports are FREE to view (no tokens)**

- Step 223: Create P&L Calculation Function
- Step 224: Create P&L API Route (NO tokens - reports free)
- Step 225: Create P&L Report Page
- Step 226: Create P&L Report Component
- Step 227: Add Date Range Selector
- Step 228: Fetch P&L Data on Date Change
- Step 229: Add Comparison Period
- Step 230: Style P&L Report
- Step 231: Add P&L Export to PDF (NO tokens - exports free)
- Step 232: Add Export Button to P&L
- Step 233: Create Balance Sheet Calculation Function
- Step 234: Create Balance Sheet API Route (NO tokens)
- Step 235: Create Balance Sheet Page
- Step 236: Create Balance Sheet Component
- Step 237: Create Cash Flow Calculation Function
- Step 238: Create Cash Flow API Route (NO tokens)
- Step 239: Create Cash Flow Page
- Step 240: Create Cash Flow Component
- Step 241: Add Charts to Reports
- Step 242: Add Excel Export (NO tokens)
- Step 243: Test All Reports

---

## PHASE 6: BANK RECONCILIATION WITH TOKEN CHECKS (Steps 244-270)

### Bank Account Setup (Steps 244-253)
- Step 244: Create Bank Accounts Page
- Step 245: Create Get Bank Accounts API (NO tokens - reading free)
- Step 246: Create Bank Accounts List Component
- Step 247: Create Add Bank Account Form
- Step 248: Create Create Bank Account API (NO tokens - setup free)
- Step 249: Connect Form to API
- Step 250: Add Bank Connection Status
- Step 251: Create CSV Import UI
- Step 252: Create CSV Parser Function
- Step 253: Create Import Bank Transactions API WITH TOKEN CHECK (3 tokens for parsing)

### Reconciliation Matching WITH TOKEN CHECKS (Steps 254-270)
- Step 254: Create Bank Transactions List API (NO tokens - reading free)
- Step 255: Create Basic Matching Function
- Step 256: Create Match Suggestions API WITH TOKEN CHECK (5 tokens per match)
- Step 257: Create Reconciliation Page
- Step 258: Create Bank Transactions List Component
- Step 259: Show Match Suggestions (5 tokens per suggestion check)
- Step 260: Create Manual Match Interface (5 tokens per manual match)
- Step 261: Create Apply Match API WITH TOKEN CHECK (5 tokens)
- Step 262: Update Match Status
- Step 263: Mark as Reconciled (NO tokens - marking free)
- Step 264: Show Reconciliation Status
- Step 265: Add Fuzzy String Matching (still 5 tokens)
- Step 266: Add Amount Tolerance
- Step 267: Add Date Window Matching
- Step 268: Test Reconciliation System with Tokens
- Step 269: Create Token Usage Dashboard
- Step 270: Create Token Usage API

---

## PHASE 7: ADVANCED FEATURES & POLISH (Steps 271-330)

### Advanced AI Features WITH TOKEN CHECKS (Steps 271-290)
- Step 271: Create ML Categorization Model (2 tokens per categorization)
- Step 272: Integrate ML Categorization
- Step 273: Create Predictive Analytics Function (20 tokens per forecast)
- Step 274: Create Predictive Analytics API WITH TOKEN CHECK (20 tokens)
- Step 275: Create NLP Chat Function (5 tokens per query)
- Step 276: Create NLP Chat API WITH TOKEN CHECK (5 tokens)
- Step 277: Create NLP Chat UI
- Step 278: Create Fraud Detection Function (10 tokens per analysis)
- Step 279: Create Fraud Detection API WITH TOKEN CHECK (10 tokens)
- Step 280: Test All AI Features with Tokens

### Token System Enhancements (Steps 281-300)
- Step 281: Add Token Usage Alerts
- Step 282: Add Trial Warning Notifications
- Step 283: Reset Tokens on Subscription Renewal
- Step 284: Add Token Purchase Option (Plus Plan)
- Step 285: Handle Token Rollover (Plus Plan)
- Step 286: Create Token Usage Reports
- Step 287: Add Upgrade/Downgrade API
- Step 288: Create Billing Settings Page
- Step 289: Add Plan Comparison UI
- Step 290: Test Complete Token System

### Final Polish & Testing (Steps 291-330)
- Step 291: Add Error Handling for Token Exhaustion
- Step 292: Add Loading States for Token Checks
- Step 293: Optimize Token Check Performance
- Step 294: Add Token Usage Analytics
- Step 295: Create Subscription Management UI
- Step 296: Add Payment Integration
- Step 297: Add Email Notifications
- Step 298: Add In-App Notifications
- Step 299: Comprehensive Testing
- Step 300: Documentation

---

## PHASE 8: MOBILE APP DEVELOPMENT (Steps 301-400)
**React Native apps for iOS and Android - Share APIs with web app**

### Mobile App Foundation (Steps 301-320)

**Step 301: Initialize React Native Project**
- Command: `npx react-native init iBookkeeperMobile --template react-native-template-typescript`
- Folder: `/mobile/` (separate from web app)
- Acceptance: React Native project created
- Test: Can run on iOS and Android simulators

**Step 302: Set Up React Native Project Structure**
- File: `/mobile/` folder structure
- Content: Organize folders (screens, components, services, navigation)
- Acceptance: Structure created
- Test: Project compiles

**Step 303: Install React Native Dependencies**
- Command: Install navigation, async storage, camera, image picker, etc.
- Acceptance: Dependencies installed
- Test: No errors

**Step 304: Create Shared API Client**
- File: `/mobile/services/api.ts`
- Content: API client that works with same backend as web app
- Acceptance: API client works
- Test: Can make API calls

**Step 305: Set Up React Navigation**
- File: `/mobile/navigation/AppNavigator.tsx`
- Content: Navigation structure for mobile app
- Acceptance: Navigation works
- Test: Can navigate between screens

**Step 306: Create Mobile Authentication Service**
- File: `/mobile/services/auth.ts`
- Content: Auth service using Supabase (same as web)
- Acceptance: Auth service works
- Test: Can authenticate

**Step 307: Create Mobile Token Service**
- File: `/mobile/services/tokens.ts`
- Content: Token checking and management (same logic as web)
- Acceptance: Token service works
- Test: Can check tokens

**Step 308: Set Up AsyncStorage for Offline**
- File: `/mobile/services/storage.ts`
- Content: Local storage for offline mode
- Acceptance: Storage works
- Test: Can store/retrieve data

**Step 309: Create Mobile App Config**
- File: `/mobile/config.ts`
- Content: API endpoints, app config
- Acceptance: Config works
- Test: Can access config

**Step 310: Test Mobile App Foundation**
- Action: Test basic app structure
- Acceptance: Foundation works
- Test: App runs on both platforms

### Mobile Authentication Screens (Steps 311-330)

**Step 311: Create Mobile Login Screen**
- File: `/mobile/screens/auth/LoginScreen.tsx`
- Content: Login screen for mobile
- Acceptance: Screen displays
- Test: Can see login screen

**Step 312: Create Mobile Sign Up Screen**
- File: `/mobile/screens/auth/SignUpScreen.tsx`
- Content: Sign up screen for mobile
- Acceptance: Screen displays
- Test: Can see sign up screen

**Step 313: Connect Mobile Login to API**
- File: `/mobile/screens/auth/LoginScreen.tsx`
- Content: Connect login form to auth service
- Acceptance: Login works
- Test: Can login

**Step 314: Connect Mobile Sign Up to API**
- File: `/mobile/screens/auth/SignUpScreen.tsx`
- Content: Connect sign up form to auth service
- Acceptance: Sign up works
- Test: Can sign up

**Step 315: Add Mobile Auth Navigation**
- File: `/mobile/navigation/AuthNavigator.tsx`
- Content: Navigation for auth screens
- Acceptance: Navigation works
- Test: Can navigate auth screens

**Step 316: Add Mobile Auth Persistence**
- File: `/mobile/services/auth.ts`
- Content: Persist auth state, auto-login
- Acceptance: Auth persists
- Test: Stays logged in

**Step 317: Create Mobile Loading Screen**
- File: `/mobile/screens/LoadingScreen.tsx`
- Content: Loading screen while checking auth
- Acceptance: Loading screen shows
- Test: Shows during auth check

**Step 318: Add Mobile Error Handling**
- File: `/mobile/components/ErrorHandler.tsx`
- Content: Error handling for auth
- Acceptance: Errors handled
- Test: Errors display correctly

**Step 319: Style Mobile Auth Screens**
- File: Mobile auth screens
- Content: Mobile-friendly styling
- Acceptance: Screens look good
- Test: Visual inspection

**Step 320: Test Mobile Authentication Flow**
- Action: Test complete auth flow
- Acceptance: Flow works
- Test: End-to-end test

### Mobile Dashboard & Navigation (Steps 321-340)

**Step 321: Create Mobile Dashboard Screen**
- File: `/mobile/screens/dashboard/DashboardScreen.tsx`
- Content: Main dashboard for mobile
- Acceptance: Dashboard displays
- Test: Can see dashboard

**Step 322: Create Mobile Bottom Tab Navigation**
- File: `/mobile/navigation/TabNavigator.tsx`
- Content: Bottom tabs (Dashboard, Transactions, Documents, Reports, Settings)
- Acceptance: Tabs work
- Test: Can switch tabs

**Step 323: Create Mobile Drawer Navigation**
- File: `/mobile/navigation/DrawerNavigator.tsx`
- Content: Side drawer for navigation
- Acceptance: Drawer works
- Test: Can open drawer

**Step 324: Add Mobile Token Status Display**
- File: `/mobile/components/TokenStatus.tsx`
- Content: Show token balance on dashboard
- Acceptance: Token status shows
- Test: Can see tokens

**Step 325: Create Mobile Trial Status Component**
- File: `/mobile/components/TrialStatus.tsx`
- Content: Show trial status on mobile
- Acceptance: Trial status shows
- Test: Can see trial info

**Step 326: Add Mobile Quick Actions**
- File: `/mobile/components/QuickActions.tsx`
- Content: Quick action buttons (Add Transaction, Capture Receipt, etc.)
- Acceptance: Quick actions work
- Test: Can use quick actions

**Step 327: Create Mobile Settings Screen**
- File: `/mobile/screens/settings/SettingsScreen.tsx`
- Content: Settings screen
- Acceptance: Settings screen displays
- Test: Can see settings

**Step 328: Add Mobile Logout Functionality**
- File: `/mobile/screens/settings/SettingsScreen.tsx`
- Content: Logout button and handler
- Acceptance: Logout works
- Test: Can logout

**Step 329: Style Mobile Dashboard**
- File: Mobile dashboard components
- Content: Mobile-friendly styling
- Acceptance: Dashboard looks good
- Test: Visual inspection

**Step 330: Test Mobile Dashboard**
- Action: Test dashboard functionality
- Acceptance: Dashboard works
- Test: End-to-end test

### Mobile Transaction Management (Steps 331-350)

**Step 331: Create Mobile Transactions List Screen**
- File: `/mobile/screens/transactions/TransactionsScreen.tsx`
- Content: List of transactions
- Acceptance: List displays
- Test: Can see transactions

**Step 332: Create Mobile Transaction Item Component**
- File: `/mobile/components/TransactionItem.tsx`
- Content: Transaction list item
- Acceptance: Item displays
- Test: Can see transaction details

**Step 333: Connect Mobile Transactions to API**
- File: `/mobile/screens/transactions/TransactionsScreen.tsx`
- Content: Fetch transactions from API
- Acceptance: Transactions load
- Test: Can see transactions

**Step 334: Add Mobile Transaction Filters**
- File: `/mobile/screens/transactions/TransactionsScreen.tsx`
- Content: Filter by date, category, etc.
- Acceptance: Filters work
- Test: Can filter transactions

**Step 335: Create Mobile Transaction Detail Screen**
- File: `/mobile/screens/transactions/TransactionDetailScreen.tsx`
- Content: View single transaction
- Acceptance: Detail screen displays
- Test: Can see transaction details

**Step 336: Create Mobile Transaction Form Screen**
- File: `/mobile/screens/transactions/TransactionFormScreen.tsx`
- Content: Form to create/edit transaction
- Acceptance: Form displays
- Test: Can see form

**Step 337: Add Mobile Transaction Form Fields**
- File: `/mobile/screens/transactions/TransactionFormScreen.tsx`
- Content: All form fields (date, amount, description, category)
- Acceptance: Fields work
- Test: Can fill form

**Step 338: Connect Mobile Transaction Form to API WITH TOKEN CHECK**
- File: `/mobile/screens/transactions/TransactionFormScreen.tsx`
- Content: Submit transaction with token check (1 token)
- Acceptance: Transaction creates
- Test: Can create transaction

**Step 339: Add Mobile Transaction Edit Functionality**
- File: `/mobile/screens/transactions/TransactionFormScreen.tsx`
- Content: Edit existing transaction
- Acceptance: Edit works
- Test: Can edit transaction

**Step 340: Test Mobile Transaction Management**
- Action: Test all transaction features
- Acceptance: All features work
- Test: End-to-end test

### Mobile Camera & Document Capture (Steps 341-370)

**Step 341: Install Mobile Camera Libraries**
- Command: Install react-native-camera or expo-camera
- Acceptance: Libraries installed
- Test: Can import camera

**Step 342: Create Mobile Camera Screen**
- File: `/mobile/screens/camera/CameraScreen.tsx`
- Content: Camera screen for capturing receipts
- Acceptance: Camera screen displays
- Test: Can see camera

**Step 343: Add Mobile Camera Controls**
- File: `/mobile/screens/camera/CameraScreen.tsx`
- Content: Capture button, flash, switch camera
- Acceptance: Controls work
- Test: Can control camera

**Step 344: Implement Mobile Photo Capture**
- File: `/mobile/screens/camera/CameraScreen.tsx`
- Content: Capture photo functionality
- Acceptance: Can capture photo
- Test: Photo captured

**Step 345: Add Mobile Image Preview**
- File: `/mobile/screens/camera/ImagePreviewScreen.tsx`
- Content: Preview captured image before upload
- Acceptance: Preview displays
- Test: Can see preview

**Step 346: Connect Mobile Camera to Upload API WITH TOKEN CHECK**
- File: `/mobile/screens/camera/ImagePreviewScreen.tsx`
- Content: Upload image with token check (5 tokens capture + 10 OCR)
- Acceptance: Image uploads
- Test: Can upload image

**Step 347: Add Mobile QR Code Scanner**
- File: `/mobile/screens/camera/QRScannerScreen.tsx`
- Content: QR code scanner for receipts
- Acceptance: QR scanner works
- Test: Can scan QR codes

**Step 348: Connect Mobile QR Scanner to API WITH TOKEN CHECK**
- File: `/mobile/screens/camera/QRScannerScreen.tsx`
- Content: Process QR code with token check (3 tokens)
- Acceptance: QR processing works
- Test: Can process QR

**Step 349: Add Mobile Barcode Scanner**
- File: `/mobile/screens/camera/BarcodeScannerScreen.tsx`
- Content: Barcode scanner
- Acceptance: Barcode scanner works
- Test: Can scan barcodes

**Step 350: Connect Mobile Barcode Scanner to API WITH TOKEN CHECK**
- File: `/mobile/screens/camera/BarcodeScannerScreen.tsx`
- Content: Process barcode with token check (2 tokens)
- Acceptance: Barcode processing works
- Test: Can process barcode

**Step 351: Create Mobile Documents List Screen**
- File: `/mobile/screens/documents/DocumentsScreen.tsx`
- Content: List of captured documents
- Acceptance: List displays
- Test: Can see documents

**Step 352: Connect Mobile Documents to API**
- File: `/mobile/screens/documents/DocumentsScreen.tsx`
- Content: Fetch documents from API
- Acceptance: Documents load
- Test: Can see documents

**Step 353: Create Mobile Document Detail Screen**
- File: `/mobile/screens/documents/DocumentDetailScreen.tsx`
- Content: View document details
- Acceptance: Detail screen displays
- Test: Can see document details

**Step 354: Add Mobile Document Image Viewer**
- File: `/mobile/components/DocumentImageViewer.tsx`
- Content: View document images
- Acceptance: Images display
- Test: Can view images

**Step 355: Add Mobile OCR Results Display**
- File: `/mobile/screens/documents/DocumentDetailScreen.tsx`
- Content: Show OCR extracted data
- Acceptance: OCR data displays
- Test: Can see OCR results

**Step 356: Add Mobile Document to Transaction Flow**
- File: `/mobile/screens/documents/DocumentDetailScreen.tsx`
- Content: Create transaction from document
- Acceptance: Flow works
- Test: Can create transaction

**Step 357: Add Mobile Image Gallery Picker**
- File: `/mobile/screens/documents/ImagePickerScreen.tsx`
- Content: Pick images from gallery
- Acceptance: Gallery picker works
- Test: Can pick images

**Step 358: Add Mobile Bulk Image Upload**
- File: `/mobile/screens/documents/DocumentsScreen.tsx`
- Content: Upload multiple images at once
- Acceptance: Bulk upload works
- Test: Can upload multiple

**Step 359: Add Mobile Image Enhancement**
- File: `/mobile/services/imageProcessor.ts`
- Content: Enhance images before upload (2 tokens)
- Acceptance: Enhancement works
- Test: Images enhanced

**Step 360: Test Mobile Camera & Document System**
- Action: Test all camera and document features
- Acceptance: All features work
- Test: End-to-end test

### Mobile Reports & Analytics (Steps 361-380)

**Step 361: Create Mobile Reports Screen**
- File: `/mobile/screens/reports/ReportsScreen.tsx`
- Content: Reports list screen
- Acceptance: Screen displays
- Test: Can see reports

**Step 362: Create Mobile P&L Report Screen**
- File: `/mobile/screens/reports/PLReportScreen.tsx`
- Content: P&L report display
- Acceptance: Report displays
- Test: Can see P&L

**Step 363: Connect Mobile P&L to API**
- File: `/mobile/screens/reports/PLReportScreen.tsx`
- Content: Fetch P&L data (NO tokens - reports free)
- Acceptance: Data loads
- Test: Can see P&L data

**Step 364: Create Mobile Balance Sheet Screen**
- File: `/mobile/screens/reports/BalanceSheetScreen.tsx`
- Content: Balance sheet display
- Acceptance: Screen displays
- Test: Can see balance sheet

**Step 365: Create Mobile Cash Flow Screen**
- File: `/mobile/screens/reports/CashFlowScreen.tsx`
- Content: Cash flow display
- Acceptance: Screen displays
- Test: Can see cash flow

**Step 366: Add Mobile Report Charts**
- File: `/mobile/components/ReportChart.tsx`
- Content: Charts for reports (using react-native-chart-kit)
- Acceptance: Charts display
- Test: Can see charts

**Step 367: Add Mobile Report Date Filters**
- File: `/mobile/screens/reports/ReportsScreen.tsx`
- Content: Date range picker
- Acceptance: Filters work
- Test: Can filter reports

**Step 368: Add Mobile Report Export**
- File: `/mobile/screens/reports/ReportsScreen.tsx`
- Content: Export reports (share functionality)
- Acceptance: Export works
- Test: Can export reports

**Step 369: Style Mobile Reports**
- File: Mobile report screens
- Content: Mobile-friendly styling
- Acceptance: Reports look good
- Test: Visual inspection

**Step 370: Test Mobile Reports**
- Action: Test all report features
- Acceptance: All features work
- Test: End-to-end test

### Mobile Offline Mode & Sync (Steps 371-390)

**Step 371: Set Up Mobile Offline Storage**
- File: `/mobile/services/offlineStorage.ts`
- Content: Local database for offline data
- Acceptance: Storage works
- Test: Can store offline

**Step 372: Implement Mobile Offline Transaction Creation**
- File: `/mobile/services/offlineStorage.ts`
- Content: Create transactions offline, queue for sync
- Acceptance: Offline creation works
- Test: Can create offline

**Step 373: Implement Mobile Sync Service**
- File: `/mobile/services/sync.ts`
- Content: Sync offline data when online
- Acceptance: Sync works
- Test: Data syncs

**Step 374: Add Mobile Sync Status Indicator**
- File: `/mobile/components/SyncStatus.tsx`
- Content: Show sync status
- Acceptance: Status displays
- Test: Can see sync status

**Step 375: Implement Mobile Conflict Resolution**
- File: `/mobile/services/sync.ts`
- Content: Handle sync conflicts
- Acceptance: Conflicts resolved
- Test: Conflicts handled

**Step 376: Add Mobile Offline Mode Toggle**
- File: `/mobile/screens/settings/SettingsScreen.tsx`
- Content: Enable/disable offline mode
- Acceptance: Toggle works
- Test: Can toggle offline

**Step 377: Test Mobile Offline Mode**
- Action: Test offline functionality
- Acceptance: Offline works
- Test: End-to-end test

**Step 378: Add Mobile Push Notifications Setup**
- File: `/mobile/services/notifications.ts`
- Content: Set up push notifications
- Acceptance: Notifications work
- Test: Can receive notifications

**Step 379: Add Mobile Notification Handlers**
- File: `/mobile/services/notifications.ts`
- Content: Handle different notification types
- Acceptance: Handlers work
- Test: Notifications handled

**Step 380: Test Mobile Notifications**
- Action: Test push notifications
- Acceptance: Notifications work
- Test: Can receive notifications

### Mobile App Polish & Testing (Steps 381-400)

**Step 381: Add Mobile App Icons**
- File: `/mobile/assets/icons/`
- Content: App icons for iOS and Android
- Acceptance: Icons created
- Test: Icons display

**Step 382: Add Mobile Splash Screens**
- File: `/mobile/assets/splash/`
- Content: Splash screens for both platforms
- Acceptance: Splash screens created
- Test: Splash screens show

**Step 383: Optimize Mobile App Performance**
- File: Mobile app code
- Content: Performance optimizations
- Acceptance: App is fast
- Test: Performance test

**Step 384: Add Mobile Error Boundaries**
- File: `/mobile/components/ErrorBoundary.tsx`
- Content: Error handling
- Acceptance: Errors handled
- Test: Errors don't crash app

**Step 385: Add Mobile Loading States**
- File: Mobile components
- Content: Loading indicators
- Acceptance: Loading states work
- Test: Loading displays

**Step 386: Test Mobile App on iOS**
- Action: Test on iOS device/simulator
- Acceptance: App works on iOS
- Test: All features work

**Step 387: Test Mobile App on Android**
- Action: Test on Android device/emulator
- Acceptance: App works on Android
- Test: All features work

**Step 388: Fix Mobile Platform-Specific Issues**
- File: Mobile app code
- Content: Fix iOS/Android differences
- Acceptance: Issues fixed
- Test: Works on both

**Step 389: Mobile App Store Preparation**
- File: Mobile app config
- Content: Prepare for app store submission
- Acceptance: Ready for submission
- Test: All requirements met

**Step 400: Final Mobile App Testing**
- Action: Comprehensive testing
- Acceptance: App is production-ready
- Test: End-to-end test

---

## PHASE 9: RESPONSIVE WEB DESIGN (Steps 401-420)
**Ensure web app works perfectly on all devices**

**Step 401: Add Responsive Breakpoints**
- File: `/tailwind.config.js`
- Content: Mobile, tablet, desktop breakpoints
- Acceptance: Breakpoints defined
- Test: Responsive works

**Step 402: Make Dashboard Responsive**
- File: `/app/dashboard/page.tsx`
- Content: Responsive layout
- Acceptance: Dashboard responsive
- Test: Works on mobile

**Step 403: Make Transaction Forms Responsive**
- File: Transaction form components
- Content: Mobile-friendly forms
- Acceptance: Forms responsive
- Test: Works on mobile

**Step 404: Make Reports Responsive**
- File: Report components
- Content: Responsive report layouts
- Acceptance: Reports responsive
- Test: Works on mobile

**Step 405: Add Touch-Friendly Controls**
- File: Web components
- Content: Larger touch targets
- Acceptance: Touch-friendly
- Test: Easy to use on mobile

**Step 406: Optimize Web for Mobile Performance**
- File: Web app code
- Content: Performance optimizations
- Acceptance: Fast on mobile
- Test: Performance test

**Step 407: Test Web on Various Devices**
- Action: Test on different devices
- Acceptance: Works on all devices
- Test: Cross-device test

**Step 408: Add PWA Support**
- File: `/next.config.js`, `/public/manifest.json`
- Content: Progressive Web App features
- Acceptance: PWA works
- Test: Can install as PWA

**Step 409: Add Web App Icons**
- File: `/public/icons/`
- Content: App icons for PWA
- Acceptance: Icons created
- Test: Icons display

**Step 410: Test PWA Installation**
- Action: Test PWA installation
- Acceptance: Can install PWA
- Test: Installation works

---

## SUMMARY

**Total Steps: 420+**

**Platform Support:**
- ✅ Web App (Next.js) - Responsive, works on all devices
- ✅ Android App (React Native)
- ✅ iPhone App (React Native)
- ✅ Shared API Backend (works for web and mobile)
- ✅ PWA Support (installable web app)

**Key Changes:**
- Token system moved to Steps 51-80 (early integration)
- All features built with token awareness from start
- Mobile apps added (Steps 301-400)
- Responsive web design (Steps 401-420)
- Shared APIs work for both web and mobile
- Offline mode for mobile apps
- Push notifications for mobile

**Key Changes:**
- Token system moved to Steps 51-80 (early integration)
- All features built with token awareness from start
- No retrofitting needed
- Free Trial auto-assigned on signup
- All plans have full feature access
- Limits are token-based only

**Follow steps 1-330 in exact order. Test after each step. Commit frequently.**

