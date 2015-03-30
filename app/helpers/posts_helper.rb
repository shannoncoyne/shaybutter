module PostsHelper
  def markdown(text)
    options = {
      filer_html:          true,
      hard_wrap:           true,
      space_after_headers: true,
      fenced_code_blocks:  true
    }

    extensions = {
      autolink:           true,
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
  
  def hanja(weekday)
    case weekday
    when 0
      '日'
    when 1
      '月'
    when 2
      '火'
    when 3
      '水'
    when 4
      '木'
    when 5
      '金'
    else
      '土'
    end
  end
end
