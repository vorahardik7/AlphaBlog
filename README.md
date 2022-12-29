<div class = "row justify-content-md-center">
                    <div class = "col"></div>
                    <div class = "col"><%= button_to 'Edit', edit_article_path(article), method: :get %></div>
                    <div class = "col"><%= button_to 'Delete', article_path(article), method: :delete, data: {turbo_confirm: 'Are you sure?'} %></div>
                </div>