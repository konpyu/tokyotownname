module ApplicationHelper

  #  def link_to_toggle_lived(title, starred)
  #    cls = 'star-btn btn btn-sm btn-default'
  #
  #    toggle_text =
  #      if starred
  #        ' Unstar'
  #      else
  #        ' Star'
  #      end
  #
  #    toggle_html = content_tag('span', class: 'toggle') do
  #      icon('star') + toggle_text
  #    end
  #
  #    count_html = content_tag('span', class: 'count') do
  #      @project.star_count.to_s
  #    end
  #
  #    link_opts = {
  #      title: title,
  #      class: cls,
  #      method: :post,
  #      remote: true,
  #      data: { type: 'json' }
  #    }
  #
  #    path = toggle_star_namespace_project_path(@project.namespace, @project)
  #
  #    content_tag 'span', class: starred ? 'turn-on' : 'turn-off' do
  #      link_to(path, link_opts) do
  #        toggle_html + ' ' + count_html
  #      end
  #    end
  #  end

end
