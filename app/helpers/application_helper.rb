module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def bootstrap_class_for(name)
    {
        success: 'alert-success',
        error: 'alert-danger',
        danger: 'alert-danger',
        alert: 'alert-warning',
        notice: 'alert-info',
    }[name.to_sym] || name
  end
end