module ApplicationHelper
    def humanize_date(date)
        date.strftime("%Y年%m月%d日")
    end
    
    def humanize_status(status)
        status ? "完了" : "未完了"
    end
    #STEp11-11で追加
    def link_to_tags(tags)
        tags_link = tags.map do |tag|
          link_to(tag.name, user_tasks_path(@user, :tag => tag.name))
        end
        tags_link.join(", ").html_safe
    end
end
