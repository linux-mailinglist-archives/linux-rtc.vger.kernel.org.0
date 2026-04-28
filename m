Return-Path: <linux-rtc+bounces-6448-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLdTGoKU8GldVQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6448-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 13:05:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C654834AD
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 13:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E8C5319C743
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 10:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D92421F15;
	Tue, 28 Apr 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZhs0ZeK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5007421F0C;
	Tue, 28 Apr 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372979; cv=none; b=W431Ct9rll6rGRwnPoBexCdjW5s14rWLZNegLHM/quviwC0hqQU7fxlfgERJhoHK32jIJ+tKH+8cVmnyUKQZgn0o56abwHuWF59y076MkPiv1m/PUIiULKHWz5BO2iYut3P/vMHBqj9ubdA0jQdkGB3zMqYs5UqT6HU5d/L2xDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372979; c=relaxed/simple;
	bh=twFInRAniYHhMu41meq/jRRwvnUEF3yFyDyOMfIEtz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unzIriRJooWRNula1OqfIKJOd2HENYQmIP3FhZ7woO5gPQrC0q9ahURLmM86Bt8xKyYKJ/+incc/qJ7V7w9JRImsbgqdHsH3bzNAVqjDg8D/1V4mKuYRleyx8Ew5eDhafbCU8cxklibW6dvlvSUEnigf3FvLlzsBFNZL6dI4aMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZhs0ZeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E955C2BCAF;
	Tue, 28 Apr 2026 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372979;
	bh=twFInRAniYHhMu41meq/jRRwvnUEF3yFyDyOMfIEtz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZhs0ZeKcZys2QY1kKXApa5PUd62RrRRkDHu1Ggu0vxZnkZeBfwlakumYcumfxgge
	 XomTWbZUuDER/r8yBXGuKH1l6v0NW9JNI44TvpSPmhtinMc2dXcWSZnQZC61n2jLmx
	 VHYq+tYA+TDYk4CgYBJuRNpJ00OqT+3OOfR3pr9qi4bYprjilJCGUqDf5yO82wzMIb
	 8hs+wz90Ew2HpJfXQPocKPobQlzekul0JTP59mR1n7IOgvznvsNq5nD4B5Tfeq9GSL
	 7zsy0npBHl0I/rIhXtpSZksZMOFivZseeFUuU8TmFuwTIHj4tMRXaIJEapa189n4vA
	 8JR5hHJHpdurQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akashdeep Kaur <a-kaur@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	a.zummo@towertech.it,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] rtc: ti-k3: Add support to resume from IO DDR low power mode
Date: Tue, 28 Apr 2026 06:41:10 -0400
Message-ID: <20260428104133.2858589-59-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 90C654834AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6448-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ti.com:email]

From: Akashdeep Kaur <a-kaur@ti.com>

[ Upstream commit 0e9b12ee74c57617bb362deb3c82e35fe49694b5 ]

Restore the RTC HW context which may be lost when system enters
certain low power mode (IO+DDR mode).
Check if the RTC registers are locked which would indicate loss of
context (reset) and restore the context as needed.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
Link: https://patch.msgid.link/20260313111740.1492519-1-a-kaur@ti.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Phase 1: Commit Message Forensics
Step 1.1 Record: Subsystem `rtc: ti-k3`; action verb `Add support`;
claimed intent is to restore TI K3 RTC hardware context after IO+DDR low
power resume.

Step 1.2 Record: Tags found in `git show 0e9b12ee74c5`: `Signed-off-by:
Akashdeep Kaur <a-kaur@ti.com>`, `Reviewed-by: Vignesh Raghavendra
<vigneshr@ti.com>`, `Link:
https://patch.msgid.link/20260313111740.1492519-1-a-kaur@ti.com`,
`Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>`. No
`Fixes:`, no `Reported-by:`, no `Cc: stable`.

Step 1.3 Record: The bug described is loss of RTC register context when
the system enters IO+DDR low power mode. The visible failure mode is not
described as a crash; it is a hardware state loss after resume. Version
info is not stated. Root cause stated by author: RTC registers being
locked indicates context reset/loss.

Step 1.4 Record: This is a hidden bug fix despite “Add support”: it
restores hardware context after a low-power resume reset. It matches the
hardware workaround/resume quirk category, not a general new API.

## Phase 2: Diff Analysis
Step 2.1 Record: One file changed, `drivers/rtc/rtc-ti-k3.c`, with `9`
insertions and `1` deletion. Modified function: `ti_k3_rtc_resume()`.
Scope: single-file surgical driver PM fix.

Step 2.2 Record: Before, resume only disabled IRQ wake if wakeup was
enabled, then returned `0`. After, resume first checks
`k3rtc_check_unlocked(priv)`; if the RTC appears locked/reset, it calls
`k3rtc_configure(dev)` and returns any error; then it disables IRQ wake
as before. Affected path: system resume path for this platform RTC
driver.

Step 2.3 Record: Bug category is hardware context loss / PM resume
quirk. Mechanism: locked RTC registers after IO+DDR resume indicate RTC
hardware context was reset; reusing `k3rtc_configure()` restores unlock,
sync, mode, and IRQ register configuration.

Step 2.4 Record: Fix quality is mostly good: small, local, reuses the
probe-time configuration routine. Regression risk is low but not zero:
if `k3rtc_configure()` fails on a wakeup-capable device, the function
returns before `disable_irq_wake(priv->irq)`, which could leave wake IRQ
state unbalanced on that error path. I found no review objection to this
in the lore thread.

## Phase 3: Git History Investigation
Step 3.1 Record: `git blame` shows `k3rtc_check_unlocked()`,
`k3rtc_configure()`, and the original resume hook came from
`b09d633575e54` (`rtc: Introduce ti-k3-rtc`), first contained by
`v6.0-rc1`. The wake IRQ error-return context came from `d31d7300ebc0c`
in mainline and `bb0433ae6fa2a` in `p-6.1`.

Step 3.2 Record: No `Fixes:` tag is present, so there was no fixes
target to inspect.

Step 3.3 Record: Recent local file history is limited: `rtc: Explicitly
include correct DT includes`, `rtc: k3: handle errors while enabling
wake irq`, `rtc: k3: Use devm_clk_get_enabled() helper`, erratum
handling changes, and original driver introduction. No prerequisite
series for this patch was found in `drivers/rtc/rtc-ti-k3.c`.

Step 3.4 Record: Local history shows Akashdeep Kaur has TI ARM64 DTS
commits, but no prior local RTC commits in the checked paths. Vignesh
Raghavendra has multiple TI platform commits and reviewed this patch.
Alexandre Belloni is the RTC maintainer/committer for the applied
commit.

Step 3.5 Record: Dependencies are existing symbols already present in
representative stable refs: `k3rtc_check_unlocked()`,
`k3rtc_configure()`, `ti_k3_rtc_resume()`, and `SIMPLE_DEV_PM_OPS`. The
patch appears standalone for `p-6.1`, `p-6.6`, `p-6.12`, and `p-6.19`.

## Phase 4: Mailing List And External Research
Step 4.1 Record: `b4 dig -c 0e9b12ee74c5` found the lore thread by
patch-id. `b4 am -c` confirmed v2 is the latest revision and applies
cleanly to the current tree. Lore web fetch directly was blocked by
Anubis, but `b4` retrieved the mbox.

Step 4.2 Record: `b4 dig -w` showed recipients included TI platform
people, `alexandre.belloni@bootlin.com`, `linux-rtc@vger.kernel.org`,
and `linux-kernel@vger.kernel.org`. `b4 am -c` found `Reviewed-by:
Vignesh Raghavendra`.

Step 4.3 Record: No `Reported-by` or bugzilla/syzbot link exists. Patch
notes say: “Tested deep sleep with rtcwake after IO DDR resume on
AM62P-SK.”

Step 4.4 Record: v1 review by Vignesh asked for commit message
simplification, not code changes. v2 updated the message and was applied
by Alexandre Belloni. No NAKs or technical concerns found in retrieved
thread.

Step 4.5 Record: Web search for stable-list discussion found no usable
stable-specific result; lore stable pages were blocked by Anubis. No
local stable refs contain this patch by subject.

## Phase 5: Code Semantic Analysis
Step 5.1 Record: Modified function: `ti_k3_rtc_resume()`.

Step 5.2 Record: Caller path is via `SIMPLE_DEV_PM_OPS(ti_k3_rtc_pm_ops,
ti_k3_rtc_suspend, ti_k3_rtc_resume)`, assigned to the platform driver’s
`.pm`; `include/linux/pm.h` confirms this sets system sleep PM callbacks
in `struct dev_pm_ops`.

Step 5.3 Record: New callees are `k3rtc_check_unlocked()` and
`k3rtc_configure()`. `k3rtc_check_unlocked()` reads the `K3RTC_UNLOCK`
regmap field. `k3rtc_configure()` handles unlock/erratum checks, enables
32 kHz sync, sets counter freeze mode, clears spurious IRQs, disables
IRQs, and fences writes.

Step 5.4 Record: Reachable during system resume when the TI K3 RTC
platform device is bound and `CONFIG_PM_SLEEP` is enabled. TI
documentation and patch notes both verify `rtcwake`/deep sleep as a real
test path. Unprivileged trigger was not verified; TI docs show root
shell usage.

Step 5.5 Record: Similar local pattern is probe-time
`k3rtc_configure(dev)`. This patch reuses that existing initialization
path on resume when hardware context is lost.

## Phase 6: Stable Tree Analysis
Step 6.1 Record: `v5.15` lacks `drivers/rtc/rtc-ti-k3.c`; `v6.0`,
`v6.1`, `v6.6`, `v6.12`, and `v6.19` have it. Representative `p-6.1`,
`p-6.6`, `p-6.12`, and `p-6.19` refs contain the buggy pre-change resume
path and the helper functions.

Step 6.2 Record: Expected backport difficulty is clean or very minor.
The exact resume context exists in `p-6.1`, `p-6.6`, `p-6.12`, and
`p-6.19`. Raw `v6.0`/`v6.1` release tags differ in the suspend wake-IRQ
line, so older non-updated baselines may need context adjustment or the
earlier wake-IRQ fix.

Step 6.3 Record: No related stable fix for “IO DDR” / “resume from IO
DDR” was found in local `p-*` refs.

## Phase 7: Subsystem And Maintainer Context
Step 7.1 Record: Subsystem is RTC driver under `drivers/rtc`, for TI K3
SoCs. Criticality: peripheral/driver-specific, but important for
affected embedded platforms and low-power resume reliability.

Step 7.2 Record: File activity is low: only a handful of changes since
the driver was introduced. This is not a high-churn refactor area.

## Phase 8: Impact And Risk
Step 8.1 Record: Affected users are TI K3/AM62-family systems using
`RTC_DRV_TI_K3`, compatible `ti,am62-rtc`, and IO+DDR/deep sleep paths.
`p-6.1` has AM62A DTS files; `p-6.6+` also has AM62P DTS files.

Step 8.2 Record: Trigger is resume from IO+DDR low power mode where RTC
context is reset. Patch testing specifically used deep sleep with
`rtcwake` after IO DDR resume on AM62P-SK. Trigger is platform/power-
mode-specific, not universal.

Step 8.3 Record: Failure severity is medium to high for affected
hardware: not a kernel crash or data corruption based on available
evidence, but a real resume functionality failure due to lost RTC
hardware configuration.

Step 8.4 Record: Benefit is high for affected TI K3 systems using low
power mode because it restores RTC operation after context loss. Risk is
low because the patch is 10 lines, local to one resume callback, and
reuses existing configuration code; main concern is the early-return-
before-`disable_irq_wake()` error path.

## Phase 9: Final Synthesis
Step 9.1 Record: Evidence for backporting: real hardware context loss,
tested on AM62P-SK with `rtcwake`, reviewed by TI maintainer/reviewer,
applied by RTC maintainer, tiny single-driver patch, existing code in
stable refs, no new ABI/API. Evidence against: commit is framed as “Add
support”, no explicit stable nomination, device-specific impact, no
documented crash/corruption, and minor wake-IRQ cleanup concern on
configuration failure.

Step 9.2 Record: Stable rules checklist: obviously correct and tested:
yes, with `rtcwake` test and review. Fixes real bug: yes, RTC context
loss after IO+DDR resume. Important issue: yes for affected hardware
suspend/resume, though not crash-class. Small and contained: yes, one
function, `9+/1-`. No new features/APIs: yes, no ABI/API change; it is a
hardware PM workaround. Can apply to stable: yes for representative
`p-*` refs, with possible context adjustment for raw older tags.

Step 9.3 Record: Exception category applies: hardware-specific low-power
resume workaround/quirk for an existing driver.

Step 9.4 Record: Decision: backport. The benefit for affected embedded
stable users outweighs the low regression risk, and the change is small,
reviewed, tested, and contained.

## Verification
- Phase 1: `git show --format=fuller --stat --patch 0e9b12ee74c5`
  verified subject, author/committer, tags, and exact diff.
- Phase 2: `git diff --stat` and `git diff --numstat` verified
  `drivers/rtc/rtc-ti-k3.c` changed by `9` insertions and `1` deletion.
- Phase 3: `git blame` verified original helper/resume code from
  `b09d633575e54`; `git describe --contains` verified first containment
  around `v6.0-rc1`; recent file logs verified no hidden prerequisite in
  the RTC file.
- Phase 4: `b4 dig -c 0e9b12ee74c5`, `b4 dig -a`, `b4 dig -w`, `b4 am
  -c`, and `b4 mbox` verified lore thread, v1/v2 review history,
  reviewers, recipients, and test note.
- Phase 5: `rg` and `ReadFile` verified `SIMPLE_DEV_PM_OPS`, `.pm =
  &ti_k3_rtc_pm_ops`, helper bodies, and the probe-time
  `k3rtc_configure()` call.
- Phase 6: `git show <ref>:drivers/rtc/rtc-ti-k3.c` verified
  file/helper/resume presence in `p-6.1`, `p-6.6`, `p-6.12`, and
  `p-6.19`; `v5.15` lacks the driver.
- Phase 7: `drivers/rtc/Kconfig` verified `RTC_DRV_TI_K3` depends on
  `ARCH_K3 || COMPILE_TEST`.
- Phase 8: TI documentation and patch mbox verified `rtcwake`/deep sleep
  relevance; U-Boot IO+DDR public thread verified IO+DDR is a real
  AM62A/AM62P low-power mode.
- Unverified: exact pre-patch user-visible symptom beyond hardware
  context loss and the patch’s `rtcwake` test note; no stable-list
  rationale found due lore Anubis blocking direct stable searches.

**YES**

 drivers/rtc/rtc-ti-k3.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
index ec759d8f7023c..e801f5b9d7574 100644
--- a/drivers/rtc/rtc-ti-k3.c
+++ b/drivers/rtc/rtc-ti-k3.c
@@ -640,10 +640,18 @@ static int __maybe_unused ti_k3_rtc_suspend(struct device *dev)
 static int __maybe_unused ti_k3_rtc_resume(struct device *dev)
 {
 	struct ti_k3_rtc *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (k3rtc_check_unlocked(priv)) {
+		/* RTC locked implies low power mode exit where RTC loses context */
+		ret = k3rtc_configure(dev);
+		if (ret)
+			return ret;
+	}
 
 	if (device_may_wakeup(dev))
 		disable_irq_wake(priv->irq);
-	return 0;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(ti_k3_rtc_pm_ops, ti_k3_rtc_suspend, ti_k3_rtc_resume);
-- 
2.53.0


