# Privacy and data use for Meta App Review

Check the active dashboard requirements and app use case before submitting. Keep evidence for each item below. [Meta Platform Terms](https://developers.facebook.com/terms/) · [Data handling questions](https://developers.facebook.com/docs/resp-plat-initiatives/individual-processes/data-handling-questions/tutorial)

## 1. Privacy policy checklist

- [ ] Publish a reachable HTTPS policy at the URL configured in the app dashboard.
- [ ] Identify the service operator, covered product, and privacy contact route.
- [ ] Describe the data collected from Meta and users, including relevant account or asset identifiers, content, and metrics.
- [ ] Tie each data category to an actual purpose, such as asset selection or publishing.
- [ ] Describe applicable sharing and processors, user choices, retention, and how to request access, correction, or deletion as applicable.
- [ ] Link the account disconnect and data deletion paths. Explain what each does and what users can expect.
- [ ] Check the policy against actual data flows and applicable legal requirements. Verify it opens without sign-in.

## 2. Deletion instructions URL or callback

- **Instructions URL** — A public page such as `https://example.com/privacy/deletion` that tells users exactly how to request deletion, what verification is needed, and how to get a status update. Test the request from a clean browser.
- **Callback URL** — An HTTPS endpoint for Meta's signed deletion request where supported or required by the configured app. Check the current dashboard and callback contract before choosing the option.
- For the callback, validate the signature per Meta's instructions before trusting the app-scoped user ID. Track the request, handle retries without duplicating work, and make the status page reachable without exposing user data.
- Example callback response shape. The confirmation code shown is illustrative.

```json
{
  "url": "https://example.com/privacy/deletion/status/example-request",
  "confirmation_code": "example-request"
}
```

- Test a valid request, an invalid signature, a duplicate, and a previously disconnected test account. Verify deletion completion and status reporting.
- Keep consent revocation and deletion behavior clear. Test the actual cleanup of retained data and connected access, including queued work.

[Meta data deletion callback](https://developers.facebook.com/docs/development/create-an-app/app-dashboard/data-deletion-callback/)

## 3. Document retention and operations

| Data category | Purpose | Storage and access roles | Retention and trigger | Deletion proof |
| --- | --- | --- | --- | --- |
| [asset IDs, publication records, or metrics] | [reason] | [store and roles] | [period, disconnect, request, or expiry] | [test and result] |
| [credentials or tokens, if stored] | [reason] | [restricted store and roles] | [expiry or revocation] | [revocation or removal test] |

- Inventory caches, queues, backups, logs, and processors as well as the primary database. Record applicable exceptions, restricted access, and backup expiry.
- Collect only the data needed for the approved use. Restrict access and sharing according to the Platform Terms. Keep secrets and raw Platform Data out of review attachments.
- Assign [owner] to handle deletion requests and keep data use assertions consistent with the app and the policy.

## 4. Complete dashboard checks

- **Data Use Checkup** — If required, track the annual certification date in the dashboard. Review active permissions, data handling answers, and implemented use before certifying. Remove unused permissions.
- **Verification** — Check Business Verification, any access verification for providers, and any other dashboard requirements separately. Make sure app ownership is assigned to the correct business and its details match the requested verification evidence.
- **Submission proof** — Record policy URL [ ], deletion option [ ], last test [ ], verification status [ ], and Checkup owner/due date [ ]. Keep sensitive evidence in the authorized submission channel.

[Meta data handling and Data Use Checkup FAQ](https://developers.facebook.com/docs/resp-plat-initiatives/individual-processes/data-handling-questions/faqs/)
