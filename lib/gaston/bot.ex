defmodule Gaston.Bot do
  use Slack

  # Constants
  @report_channel Application.get_env(:gaston, :report_channel)

  def handle_message(%{subtype: "message_deleted", channel: channel_or_group_id, previous_message: %{text: text, user: user_id}}, slack) do
    # Find the user and channel/group in the global `slack` map
    user = slack.users[user_id]
    channel_or_group = slack.channels[channel_or_group_id] || slack.groups[channel_or_group_id]

    # Persist the message in the repo
    handle_deleted_message(user, channel_or_group, text, slack)

    # Everything is cool
    :ok
  end

  def handle_message(_,_), do: :ok

  defp handle_deleted_message(%{name: username}, %{name: channel}, text, slack) do
    send_message(report_deleted_message(username, channel, text), @report_channel, slack)
  end

  defp report_deleted_message(username, channel, text) do
    "@#{username} just deleted message this in ##{channel}:\n```\n#{text}\n```"
  end
end
