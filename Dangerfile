# Code review automation
# https://github.com/danger/danger
#
# Policy:
# 1. Use `warn` for all things that are important, but not related to code.
#   So it will be possible to fix these issues without creating new commits
# 2. Use `failure` for all things that are important and are related to code.
#   So people will have to create new commits to address these issues.
# 3. Use `sticky: true` for things that
#   show attempts for potentially risky behaviour:
#   like secrets or config modification, too big submissions, etc.
# 4. Place `failure`s after all `warn` rules
#   to collect maximum amount of issues in a code review comment

# Can only warn:
danger.import_dangerfile(path: "./danger-stages/optional/")

# Platform specific files (can both `warn` and `fail` pipeline):
ENV.fetch("DANGER_PLATFORMS", "").split(",").each { |platform|
  danger.import_dangerfile(
    path: "./danger-platforms/#{platform.strip()}/"
  )
}

# Critical checks, fail only:
danger.import_dangerfile(path: "./danger-stages/critical/")
