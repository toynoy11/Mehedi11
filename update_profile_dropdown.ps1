$headerWithProfileDropdown = @"
  <header style="width: 100vw; background-color: #3e2723; color: white; padding: 1em 2em; box-sizing: border-box; position: relative;">
    <div style="display: flex; align-items: center; justify-content: space-between; max-width: 1200px; margin: 0 auto;">
        
        <!-- Logo and Brand Name -->
        <a href="main_index.html" style="text-decoration: none; color: white; display: flex; align-items: center;">
            <img src="images/logo.png" alt="Brew & Go Logo" style="height: 80px; margin-right: 15px;">
            <span style="font-size: 2.5em; font-weight: bold;">Brew & Go. Coffee</span>
        </a>
    
        <!-- Navigation Links -->
        <nav style="display: flex; gap: 1.5em;">
            <div class="nav-dropdown">
                <a href="products.html" style="color: white; text-decoration: none; font-weight: bold;">Products</a>
                <div class="dropdown-content">
                    <a href="hotbeverages.html">Hot Beverages</a>
                    <a href="non_coffee.html">Non-Coffee Drinks</a>
                    <a href="artisan_brew.html">Artisan Brews</a>
                    <a href="basic_brew.html">Basic Brews</a>
                </div>
            </div>
            <a href="registration.html" style="color: white; text-decoration: none; font-weight: bold;">Register</a>
            <a href="login.html" style="color: white; text-decoration: none; font-weight: bold;">Login</a>
            <a href="join_us.html" style="color: white; text-decoration: none; font-weight: bold;">Join Us</a>
            <a href="activities.html" style="color: white; text-decoration: none; font-weight: bold;">Activities</a>
            <div class="nav-dropdown">
                <a href="profile.html" style="color: white; text-decoration: none; font-weight: bold;">Profile</a>
                <div class="dropdown-content">
                    <a href="profile_aaron.html">Aaron's Profile</a>
                    <a href="profile_greg.html">Greg's Profile</a>
                    <a href="profile_mehedi.html">Mehedi's Profile</a>
                    <a href="profile_muzamil.html">Muzamil's Profile</a>
                </div>
            </div>
        </nav>
    
    </div>
"@

# Get all HTML files in the directory
$htmlFiles = Get-ChildItem -Path "c:\xampp\htdocs\brewngohtml" -Filter "*.html"

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace the old header with the new one containing profile dropdown
    $oldHeaderPattern = '(?s)<header style="width: 100vw; background-color: #3e2723;.*?<\/div>\s*(?=<!-- Page Title -->)'
    $content = [regex]::Replace($content, $oldHeaderPattern, $headerWithProfileDropdown)
    
    # Save the modified content
    $content | Set-Content -Path $file.FullName -Encoding UTF8
    
    Write-Host "Updated $($file.Name) successfully."
}

Write-Host "All HTML files have been updated with the profile dropdown menu."
