<?php
include('db_conn.php');  // Include the database connection file

// Get search term and filter
$search = isset($_GET['search']) ? $_GET['search'] : '';
$category = isset($_GET['category']) ? $_GET['category'] : '';

// Pagination setup
$limit = 6; // Number of courses per page
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($page - 1) * $limit;

// Build the query
$query = "SELECT * FROM courses WHERE course_name LIKE ? AND category LIKE ? LIMIT $limit OFFSET $offset";
$stmt = $conn->prepare($query);
$searchTerm = "%" . $search . "%";
$categoryTerm = "%" . $category . "%";
$stmt->bind_param("ss", $searchTerm, $categoryTerm);
$stmt->execute();
$result = $stmt->get_result();

// Get total number of records for pagination
$countQuery = "SELECT COUNT(*) FROM courses WHERE course_name LIKE ? AND category LIKE ?";
$countStmt = $conn->prepare($countQuery);
$countStmt->bind_param("ss", $searchTerm, $categoryTerm);
$countStmt->execute();
$countResult = $countStmt->get_result()->fetch_row();
$totalCourses = $countResult[0];
$totalPages = ceil($totalCourses / $limit);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT Courses</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
   <div id="loader">
    <div class="loader-ring"></div>
</div>

    <header>
        <h1>Explore IT Courses</h1>
        <button id="darkModeToggle" class="dark-mode-btn">Toggle Dark Mode</button>

        <form action="index.php" method="get">
            <input type="text" name="search" value="<?php echo htmlspecialchars($search); ?>" placeholder="Search courses...">
            <select name="category">
                <option value="">All Categories</option>
                <option value="Web Development" <?php if ($category == 'Web Development') echo 'selected'; ?>>Web Development</option>
                <option value="Data Science" <?php if ($category == 'Data Science') echo 'selected'; ?>>Data Science</option>
                <option value="AI & ML" <?php if ($category == 'AI & ML') echo 'selected'; ?>>AI & ML</option>
                <option value="Cloud Computing" <?php if ($category == 'Cloud Computing') echo 'selected'; ?>>Cloud Computing</option>
            </select>
            <button type="submit">Search</button>
        </form>
    </header>

    <section class="courses">
        <?php while ($row = $result->fetch_assoc()): ?>
            <div class="course-card">
                <img src="<?php echo $row['image_url']; ?>" alt="<?php echo $row['course_name']; ?>">
                <h3><?php echo $row['course_name']; ?></h3>
                <p><?php echo substr($row['description'], 0, 100); ?>...</p>
            </div>
        <?php endwhile; ?>
    </section>

    <div class="pagination">
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <a href="index.php?page=<?php echo $i; ?>&search=<?php echo htmlspecialchars($search); ?>&category=<?php echo $category; ?>" class="page-link"><?php echo $i; ?></a>
        <?php endfor; ?>
    </div>
<script>
    window.addEventListener('load', function () {
        const loader = document.getElementById('loader');
        loader.style.opacity = '0';
        setTimeout(() => {
            loader.style.display = 'none';
        }, 300); // Wait for fade out
    });
</script>

<script>
    const toggleBtn = document.getElementById('darkModeToggle');
    toggleBtn.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
        localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
    });

    // Keep dark mode state on reload
    if (localStorage.getItem('darkMode') === 'true') {
        document.body.classList.add('dark-mode');
    }
</script>

</body>

</html>

<?php
$conn->close();
?>

