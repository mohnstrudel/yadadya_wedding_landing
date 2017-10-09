class Admin::DashboardController < AdminController
  def home
    @all_requests = Request.current.count
    @pending_requests = Request.current.pending.count
    @approved_requests = Request.current.approved.count
    @today_requests = Request.current.today.count

    # Chart data
    from = Time.zone.now.days_ago(14).beginning_of_day
    to   = Time.zone.now
    @two_weeks_requests = Request.where(created_at: from .. to).group('date(created_at)').order('date(created_at)').count.to_json
    # debug
  end
end
