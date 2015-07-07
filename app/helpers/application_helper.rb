module ApplicationHelper

  def my_name
    return "Fong Fan"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def up_vote_link_classes(post)
    (current_user.voted(post) && current_user.voted(post).up_vote?) ? 'voted' : '' 
  end

  def down_vote_link_classes(post)
    (current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : '' 
  end

end