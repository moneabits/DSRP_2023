## install this 
install.packages(c("usethis", "credentials"))

usethis::use_git()


# set name and email
usethis::use_git_config(user.name = "Mone Abbott",
                        user.email = "moneabbott@gmail.com")

## create a personal token 
usethis::create_github_token()




