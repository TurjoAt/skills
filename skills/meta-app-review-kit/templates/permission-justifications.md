# Permission justifications

Fill in one block for each requested permission. Match the reviewer steps and video timestamps. Verify endpoints, token types, asset tasks, and dependencies for the configured login flow and API version. Remove scopes that support no shipped feature or documented dependency.

[Meta permissions reference](https://developers.facebook.com/docs/permissions/)

## `pages_show_list`

- **User benefit and trigger** — [eligible user] uses [screen and control] to show eligible managed Pages in [picker].
- **Operation and authority** — [GET /me/accounts or actual operation and version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [Page IDs and names shown, selection fields saved]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [connect, consent, open Page picker, select test Page]. Use [test marker or input].
- **Evidence** — Expect [eligible Pages displayed and selection confirmed]. See [clip/timestamp] and [private review instructions step].

## `pages_read_engagement`

- **User benefit and trigger** — [eligible user] uses [screen and control] to display [specific Page data] or satisfy [documented endpoint dependency].
- **Operation and authority** — [exact read or publishing operation, version, and dependency reference], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [fields retrieved, or dependency-only use and any stored fields]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [select test Page and refresh data or run dependent action]. Use [test marker or input].
- **Evidence** — Expect [named Page field or confirmed result of dependent action]. See [clip/timestamp] and [private review instructions step].

## `pages_manage_posts`

- **User benefit and trigger** — [eligible user] uses [screen and control] to [create, edit, or delete] a post after [authorized user action].
- **Operation and authority** — [exact Page post operation and API version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [post content, returned post identifier, publication status]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [select test Page, enter test copy, publish or perform the submitted action]. Use [test marker or input].
- **Evidence** — Expect [matching post or change visible on test Page]. See [clip/timestamp] and [private review instructions step].

## `instagram_basic`

- **User benefit and trigger** — [eligible user] uses [screen and control] to identify the linked professional account or display [profile/media fields].
- **Operation and authority** — [exact account discovery or read operation and version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [account ID, username, and any other fields actually needed]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [connect with Facebook Login, select linked Page, open account view]. Use [test marker or input].
- **Evidence** — Expect [matching professional account or fields in the app]. See [clip/timestamp] and [private review instructions step].

## `instagram_content_publish`

- **User benefit and trigger** — [eligible user] uses [screen and control] to publish [supported media format] to the selected professional account.
- **Operation and authority** — [media creation, status check if needed, and publish operations and version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [media, caption, media ID, and publication status]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [choose test account, preview test media, publish, open destination]. Use [test marker or input].
- **Evidence** — Expect [matching image or video and caption on test account]. See [clip/timestamp] and [private review instructions step].

## `business_management`

- **User benefit and trigger** — [eligible user] uses [screen and control] to complete [specific business asset operation or documented dependency].
- **Operation and authority** — [Business Management API operation or dependency reference and version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [business and asset fields used, or dependency-only use]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [start from authorized business role and run exact feature]. Use [test marker or input].
- **Evidence** — Expect [expected business asset selection or downstream result]. See [clip/timestamp] and [private review instructions step].

## `instagram_manage_insights`

- **User benefit and trigger** — [eligible user] uses [screen and control] to display [supported account or media metric] for [period].
- **Operation and authority** — [exact account/media insights operation, metric, period, and version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [metrics, dates, and asset identifiers returned or retained]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [open insights, choose seeded asset and date range]. Use [test marker or input].
- **Evidence** — Expect [named metric with a usable result]. See [clip/timestamp] and [private review instructions step].

## `pages_manage_metadata`

- **User benefit and trigger** — [eligible user] uses [screen and control] to perform [supported metadata operation] or subscribe to [Page webhook event].
- **Operation and authority** — [exact operation, event fields if applicable, and API version], using [token type], [asset], and [required role or tasks].
- **Data and lifecycle** — [metadata or event fields processed and stored]. Retain [fields] for [period/purpose]. Delete on [trigger].
- **Minimum access** — Without this permission [observable feature failure]. Other requested permissions [list with reasons or none].
- **Reviewer steps** — Starting from [test workspace, role, and asset], [configure test Page, trigger event if applicable, open result]. Use [test marker or input].
- **Evidence** — Expect [metadata state or app behavior caused by the test event]. See [clip/timestamp] and [private review instructions step].

## Worked fictional example for `pages_manage_posts`

- **User benefit and trigger** — A test workspace editor uses ExampleSocial at https://example.com/review. In **Compose**, the editor chooses **Publish now** to send an approved draft to the selected Facebook Page.
- **Operation and authority** — The app uses `POST /{page-id}/feed` against its configured Graph API version with the Page access token for the fictional ExampleSocial Demo Page. The connected user must be authorized to create content on that Page.
- **Data and lifecycle** — The app sends the selected Page ID and draft text. It stores the returned post ID and publication status for up to 30 days to show the editor the result and removes the local publication record on workspace deletion.
- **Minimum access** — Without `pages_manage_posts`, the editor cannot publish the draft from the composer. The Page picker uses `pages_show_list`; the app also requests `pages_read_engagement` as a dependency for this publishing flow. Confirm the dependency against the exact Graph API version before copying this example.
- **Reviewer steps** — Sign in through the private review form, open **Connections**, connect and select **ExampleSocial Demo Page**. Open **Compose**, enter “ExampleSocial review demo”, select the demo Page, and click **Publish now**.
- **Evidence** — The app shows **Published**. Open the destination Page via **View post** and confirm the same text appears. The fictional clip would show selection at 00:28, publication at 00:47, and the Page result at 01:02.
