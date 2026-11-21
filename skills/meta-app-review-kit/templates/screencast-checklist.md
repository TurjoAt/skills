# App Review screencast checklist

## Before recording

- [ ] Fill in app/build [ ], login flow [ ], API version [ ], dashboard request [ ].
- [ ] List each requested permission and the screen that demonstrates its use.
- [ ] From a clean session, rehearse the steps with the designated test roles and assets.
- [ ] Reset the integration so the recording can show consent and asset selection where applicable.
- [ ] Prepare disposable copy and licensed test media. Give each test post a recognizable title.
- [ ] Open the destination asset in a separate tab and verify its name matches the app picker.
- [ ] Close unrelated tabs, hide notifications, and keep credentials, tokens, and personal data off screen.

## Recording settings

- [ ] Check the current dashboard upload format and size requirements.
- [ ] Use readable zoom and a clear cursor. Start with 1080p if available and verify the exported file at normal zoom.
- [ ] Use captions or narration to explain each click, especially when moving between the app and Meta.
- [ ] Keep permission, consent, selection, and outcome visible long enough to read.
- [ ] Record one continuous route where possible. If combining takes, mark transitions and include timestamps for each permission.

## Per-permission shot list

| Permission | Record these shots when requested |
| --- | --- |
| `pages_show_list` | Open the connect flow, show consent and eligible test Pages, then select the Page in the app. |
| `pages_read_engagement` | Refresh and show the actual Page data used, or demonstrate the result of the publishing operation for which it is a documented dependency. |
| `pages_manage_posts` | Select the test Page, enter disposable copy, publish, then refresh the Page and show the matching post. Show edit/delete only if part of the submitted use case. |
| `instagram_basic` | Select the linked Page, load the connected professional account, and show the profile/media fields actually used. |
| `instagram_content_publish` | Select the account, preview the media and caption, publish, then show the matching media on the destination account. |
| `business_management` | Show the implemented business asset workflow or dependent flow, the authorized asset, and the resulting UI or action. |
| `instagram_manage_insights` | Choose a supported metric and period, then show the displayed account or media result for the seeded asset. |
| `pages_manage_metadata` | Show the supported metadata action or webhook setup, trigger the test event if applicable, and show how the app uses it. |

For each route record the timestamp [ ], clip [ ], permission [ ], starting state [ ], action [ ], and expected result [ ].

## Narration or caption script

1. “[Timestamp] I signed into [app] as a reviewer in [test workspace]. I open [menu].”
2. “[Timestamp] I choose [connect button] and authorize [capability] for [test asset].”
3. “[Timestamp] I use [feature] to [action]. The app needs [permission] here to [read/write/dependency].”
4. “[Timestamp] The result is [observable outcome] on [screen or destination]. Look for [matching identifier or caption].”
5. “[Timestamp] To repeat the check, start from [state] and follow [reviewer instruction step].”

## Final QA

- [ ] Watch the exported file from start to finish. Captions and UI labels are readable.
- [ ] Check each requested permission has an observable outcome and a matching justification.
- [ ] Check the reviewer can reproduce every click using the supplied setup.
- [ ] Recheck privacy, upload success, and playback in the dashboard if available.

[Meta App Review screen recording guidance](https://developers.facebook.com/docs/app-review/submission-guide/screen-recordings)
