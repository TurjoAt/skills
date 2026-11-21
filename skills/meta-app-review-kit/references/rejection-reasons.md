# App Review rejection guide

Reviewer wording below is illustrative. Use the actual dashboard feedback to identify the affected scope and reproduce the failure from a clean browser before changing the submission.

| Typical reviewer wording | Likely root cause | Concrete fix | Evidence to include in resubmission notes |
| --- | --- | --- | --- |
| “We couldn't sign in.” | Expired SaaS credentials or wrong entry URL | Restore the dedicated login and test the submitted URL from a clean browser. | Updated private credential field and clean-session test date. |
| “We received a verification prompt.” | 2FA or device challenge interrupts review | Use the supported reviewer access route and document any approved prompts. | Exact access steps and clean-session result. |
| “The app page is unavailable.” | Deployment outage, region rule, or network restriction | Restore the reviewed build and verify approved external access. | Entry URL, build, test date, and observed result. |
| “The instructions don't match the app.” | UI labels or navigation changed | Rewrite the route with exact labels and starting state. | Revised step numbers and timestamp showing the matching UI. |
| “No Page was available to select.” | Missing app role or Page task | Assign the correct test role and Page access, then reconnect. | Test asset label and Page-picker timestamp. |
| “We couldn't find the Instagram account.” | Missing linked professional account or asset access | Verify the Page link and professional account access in the Facebook Login flow. | Page and account labels and timestamp showing both. |
| “The recording does not show authorization.” | Existing session skipped consent | Reset the test connection and record the applicable consent and selection flow. | Consent timestamp and corresponding instruction step. |
| “We couldn't verify the permission in use.” | Video shows settings only | Record the trigger, operation outcome, and visible UI result for the scope. | Permission, exact action, and outcome timestamp. |
| “The requested permission is unnecessary.” | Scope is unused or dependency unexplained | Remove it or document the exact implemented operation and its dependency. | Updated scope list or endpoint reference and feature timestamp. |
| “We couldn't confirm where the post went.” | Recording ends at app success message | Open the destination Page and show the matching post after refresh. | Destination asset label, test marker, and timestamp. |
| “The media did not publish.” | Unsupported media or incomplete processing | Use a supported disposable asset and wait for a publishable status before publishing. | Media type, test caption, and timestamp of the visible result. |
| “The analytics screen is empty.” | Asset, metric, or date range has no eligible data | Seed eligible content and choose a supported metric and period. | Asset label, metric, date range, and result timestamp. |
| “We couldn't verify the webhook feature.” | Test event wasn't triggered or surfaced | Subscribe to the needed event and trigger it through the intended workflow. | Trigger steps and timestamp of observable app behavior. |
| “The privacy policy isn't accessible.” | Policy requires login or URL redirects incorrectly | Publish the policy on a reachable HTTPS page and correct the dashboard entry. | Policy URL and signed-out test result. |
| “We couldn't find the deletion process.” | Policy omits route or configured deletion mechanism fails | Link specific instructions and test the configured URL or callback end to end. | Public instructions URL and sanitized deletion test result. |
| “Additional verification is required.” | Dashboard prerequisites are incomplete | Complete applicable verification and confirm the correct business owns the app. | Dashboard status and date, with sensitive records kept private. |
| “The feature works only for the developer.” | Demo uses elevated roles, tokens, or cached state | Rehearse using the eligible reviewer flow and intended asset permissions. | Starting role, fresh-session steps, and result timestamp. |
| “The video is difficult to follow.” | Small text, cuts, missing context, or ambiguous results | Re-record with readable zoom, clear captions, and labeled timestamps. | Replacement clip name and permission-to-timestamp map. |

## Resubmission notes block

- Review comment [ ] and affected permission [ ].
- Reproduced on [build and date] from [starting state].
- Changed [UI, permission, dashboard setting, or test asset].
- Retest steps [ ] and expected result [ ].
- Evidence [clip, timestamp, dashboard status, or public URL].
- Updated private form fields [references only].

[Meta App Review](https://developers.facebook.com/docs/app-review/)
