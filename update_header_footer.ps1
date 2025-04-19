$headerContent = @"
  <header style="width: 100vw; background-color: #3e2723; color: white; padding: 1em 2em; box-sizing: border-box; position: relative;">
    <div style="display: flex; align-items: center; justify-content: space-between; max-width: 1200px; margin: 0 auto;">
        
        <!-- Logo and Brand Name -->
        <a href="main_index.html" style="text-decoration: none; color: white; display: flex; align-items: center;">
            <img src="images/logo.png" alt="Brew & Go Logo" style="height: 80px; margin-right: 15px;">
            <span style="font-size: 2.5em; font-weight: bold;">Brew & Go. Coffee</span>
        </a>
    
        <!-- Navigation Links -->
        <nav style="display: flex; gap: 1.5em;">
            <a href="products.html" style="color: white; text-decoration: none; font-weight: bold;">Products</a>
            <a href="registration.html" style="color: white; text-decoration: none; font-weight: bold;">Register</a>
            <a href="login.html" style="color: white; text-decoration: none; font-weight: bold;">Login</a>
            <a href="join_us.html" style="color: white; text-decoration: none; font-weight: bold;">Join Us</a>
            <a href="activities.html" style="color: white; text-decoration: none; font-weight: bold;">Activities</a>
            <a href="profile.html" style="color: white; text-decoration: none; font-weight: bold;">Profile</a>
        </nav>
    
    </div>
"@

$footerContent = @"
<footer style="background-color: #3e2723; color: white; padding: 2em 0; margin-top: 2em; width: 100%;">
  <div style="max-width: 1200px; margin: 0 auto; display: grid; grid-template-columns: repeat(4, 1fr); gap: 2em; padding: 0 2em;">
    <!-- About Section -->
    <div>
      <h3 style="margin-bottom: 1em; font-size: 1.2em;">About Brew & Go</h3>
      <p style="line-height: 1.6;">We are passionate about bringing quality coffee to coffee enthusiasts. Join our community to experience the best brews.</p>
      <p style="margin-top: 1em;"><a href="mailto:hello@brewngo.coffee" style="color: #d7ccc8; text-decoration: none;">hello@brewngo.coffee</a></p>
    </div>
    
    <!-- Quick Links -->
    <div>
      <h3 style="margin-bottom: 1em; font-size: 1.2em;">Quick Links</h3>
      <ul style="list-style: none; padding: 0; line-height: 2;">
        <li><a href="main_index.html" style="color: #d7ccc8; text-decoration: none;">Home</a></li>
        <li><a href="products.html" style="color: #d7ccc8; text-decoration: none;">Products</a></li>
        <li><a href="hotbeverages.html" style="color: #d7ccc8; text-decoration: none;">Hot Beverages</a></li>
        <li><a href="non_coffee.html" style="color: #d7ccc8; text-decoration: none;">Non-Coffee Drinks</a></li>
        <li><a href="artisan_brew.html" style="color: #d7ccc8; text-decoration: none;">Artisan Brews</a></li>
        <li><a href="basic_brew.html" style="color: #d7ccc8; text-decoration: none;">Basic Brews</a></li>
      </ul>
    </div>
    
    <!-- Member Area -->
    <div>
      <h3 style="margin-bottom: 1em; font-size: 1.2em;">Member Area</h3>
      <ul style="list-style: none; padding: 0; line-height: 2;">
        <li><a href="registration.html" style="color: #d7ccc8; text-decoration: none;">Register</a></li>
        <li><a href="login.html" style="color: #d7ccc8; text-decoration: none;">Login</a></li>
        <li><a href="join_us.html" style="color: #d7ccc8; text-decoration: none;">Join Us</a></li>
        <li><a href="profile.html" style="color: #d7ccc8; text-decoration: none;">Profile</a></li>
        <li><a href="enquiry.html" style="color: #d7ccc8; text-decoration: none;">Make an Enquiry</a></li>
        <li><a href="activities.html" style="color: #d7ccc8; text-decoration: none;">Activities</a></li>
      </ul>
    </div>
    
    <!-- Connect With Us -->
    <div>
      <h3 style="margin-bottom: 1em; font-size: 1.2em;">Connect With Us</h3>
      <div style="display: flex; gap: 1em; margin-bottom: 1.5em;">
        <!-- Social Media Icons -->
        <a href="#" style="color: white; font-size: 1.5em; text-decoration: none;" title="Facebook">
          <i class="fab fa-facebook-square"></i>
        </a>
        <a href="#" style="color: white; font-size: 1.5em; text-decoration: none;" title="Instagram">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="#" style="color: white; font-size: 1.5em; text-decoration: none;" title="Twitter">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#" style="color: white; font-size: 1.5em; text-decoration: none;" title="YouTube">
          <i class="fab fa-youtube"></i>
        </a>
      </div>
      <p>Subscribe to our newsletter:</p>
      <div style="display: flex; margin-top: 0.5em;">
        <input type="email" placeholder="Your email" style="padding: 0.5em; border: none; flex: 1;">
        <button style="background-color: #d7ccc8; color: #3e2723; border: none; padding: 0.5em 1em; cursor: pointer; font-weight: bold;">Subscribe</button>
      </div>
    </div>
  </div>
  
  <!-- Copyright Section -->
  <div style="border-top: 1px solid #d7ccc8; margin-top: 2em; padding-top: 2em; text-align: center; max-width: 1200px; margin-left: auto; margin-right: auto;">
    <p>&copy; 2025 Brew & Go. Coffee | All Rights Reserved</p>
  </div>
</footer>
"@

# Skip current.html since it already has the updated header and footer
$filesToSkip = @("current.html")

# Get all HTML files in the directory
$htmlFiles = Get-ChildItem -Path "c:\xampp\htdocs\brewngohtml" -Filter "*.html" | Where-Object { $filesToSkip -notcontains $_.Name }

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Extract the title from the original file
    $titleMatch = [regex]::Match($content, '<title>(.*?)</title>')
    $title = if ($titleMatch.Success) { $titleMatch.Groups[1].Value } else { "Brew & Go Coffee" }
    
    # Extract the page-specific h1 title if it exists
    $h1Match = [regex]::Match($content, '<h1[^>]*>(.*?)<\/h1>')
    $h1Title = if ($h1Match.Success) { $h1Match.Groups[1].Value.Trim() } else { $file.BaseName -replace "_", " " | % { (Get-Culture).TextInfo.ToTitleCase($_) } }
    
    # Extract the content between </header> and <footer or </body> or </html>
    $bodyContentMatch = [regex]::Match($content, '(?s)</header>(.*?)(?:<footer|</body>|</html>)')
    $bodyContent = if ($bodyContentMatch.Success) { $bodyContentMatch.Groups[1].Value } else { "" }
    
    # Check if the file has Font Awesome and Google Fonts links
    $hasFontAwesome = $content -match 'font-awesome'
    $hasGoogleFonts = $content -match 'fonts.googleapis.com'
    
    # Create new content with updated header and footer
    $newContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
"@

    # Add stylesheet links from the original file
    $stylesheetMatches = [regex]::Matches($content, '<link[^>]*rel="stylesheet"[^>]*>')
    $stylesheetLinks = @()
    foreach ($match in $stylesheetMatches) {
        # Skip Font Awesome and Google Fonts as we'll add them separately
        if (($match.Value -notmatch 'font-awesome') -and ($match.Value -notmatch 'fonts.googleapis.com')) {
            $stylesheetLinks += $match.Value
        }
    }
    
    $newContent += "`n    " + ($stylesheetLinks -join "`n    ")
    
    # Add Font Awesome and Google Fonts if they weren't in the original file
    if (-not $hasFontAwesome) {
        $newContent += "`n    <link rel=`"stylesheet`" href=`"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css`">"
    }
    if (-not $hasGoogleFonts) {
        $newContent += "`n    <link href=`"https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap`" rel=`"stylesheet`">"
    }
    
    # Complete the head and add the header
    $newContent += @"

</head>
<body>
$headerContent
    
    <!-- Page Title -->
    <h1 style="text-align: center; color: white; margin-top: 1em; position: relative;">$h1Title<style>h1::after { display: none; }</style></h1>
</header>

$bodyContent

$footerContent
</body>
</html>
"@

    # Save the new content to the file
    $newContent | Set-Content -Path $file.FullName -Encoding UTF8
    
    Write-Host "Updated $($file.Name) successfully."
}

Write-Host "All HTML files have been updated with the new header and footer."
