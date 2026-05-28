import os

root_dir = r"e:\Code\AI\Start\Web\Mindapp\healthsystem"

frontend_pages_dir = os.path.join(root_dir, "frontend", "pages")
frontend_components_dir = os.path.join(root_dir, "frontend", "components")
backend_templates_dir = os.path.join(root_dir, "healthsystem-backend6", "healthsystem-backend", "src", "main", "resources", "templates", "page")

def count_files(dir_path, ext):
    if not os.path.exists(dir_path):
        return 0
    count = 0
    for root, dirs, files in os.walk(dir_path):
        for f in files:
            if f.endswith(ext):
                count += 1
    return count

vue_pages = count_files(frontend_pages_dir, ".vue")
vue_components = count_files(frontend_components_dir, ".vue")
html_templates = count_files(backend_templates_dir, ".html")

print(f"Vue Pages: {vue_pages}")
print(f"Vue Components: {vue_components}")
print(f"HTML Templates: {html_templates}")
