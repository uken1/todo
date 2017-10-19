module ApplicationHelper
    def humanize_date(date)
        date.strftime("%Y年%m月%d日")
    end
    
    def humanize_status(status)
        status ? "完了" : "未完了"
    end
end
