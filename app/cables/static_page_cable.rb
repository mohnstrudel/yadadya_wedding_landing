class StaticPageCable < BaseCable
  def archive
    archive = Archive.find_proper
    p "---"
    p "Preparing streaming"
    p "---"
    stream partial: "static_page/archive", locals: { archive: archive }
  end
end
