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
#
# Runtime:
# Note, that this script is executed inside a docker container,
# and we tend to use the full path. The same as in Dockerfile.
# In case you just want to copy this file, then deal with paths.

# Can only warn:
danger.import_dangerfile(path: "/danger/danger-stages/optional/")

# Platform specific files (can both `warn` and `fail` pipeline):
ENV.fetch("DANGER_PLATFORMS", "").split(",").each { |platform|
  danger.import_dangerfile(
    path: "/danger/danger-platforms/#{platform.strip()}/"
  )
}

# Critical checks, fail only:
danger.import_dangerfile(path: "/danger/danger-stages/critical/")
