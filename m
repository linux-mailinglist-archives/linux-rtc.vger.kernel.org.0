Return-Path: <linux-rtc+bounces-6447-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBzxFQuS8GlvVAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6447-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 12:55:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1F4830DB
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 12:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF42E3079E0F
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90989421EE0;
	Tue, 28 Apr 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwQoiqKg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64495421A19;
	Tue, 28 Apr 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372978; cv=none; b=HiB7jEC4LDh4SyTth+jlWwOPvN1qyVSGj+hCPd1CtEftBLQ9okkJWHNZPx8Uhk8HNNkNB+qTt/40odvQS6Yh8Za8NjSNoTVCwhtiZYq8f3kvMvpdVDZzR5msTHIsDqB7anNn7pvLdATy6eI7vy/Hl2KrzE1YuFs+YIDAay66BRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372978; c=relaxed/simple;
	bh=qn+QqjMaNzYuTxIr6rPNkJM3OU04jgCXZ91aVQGisaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uG7+x2O2CKIUoFfUXl0CCJOMIQXQiMunvbTUd01CzPFBGTrUWTUYu1U7EFPqxJMQGZAp261dJDmJi/y4gH1jhHO3iruwKFRMBAPIL65VShY9uNm2fEnLpmwSg9Ej4KVSYtVBt+kadaFl2CBul9ShGa9cQB/0ejchkDay0kGyFWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwQoiqKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6122C2BCB6;
	Tue, 28 Apr 2026 10:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372977;
	bh=qn+QqjMaNzYuTxIr6rPNkJM3OU04jgCXZ91aVQGisaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CwQoiqKg4yNXd4MgsMzhRQzwE5HfBZZvP+Po/EjIHbDbnY5dK2BLE/2FwhUDXbqg5
	 xaNo9KBDroGdWYXe9V2Igv1uPtLIWN6VFdWUq6SXkLKZU1m07TnXdaI7PFkKZr2X7q
	 sFjJZxxr7bmH5qXJVpEf+WYPbmnbnKCvz9RqRS0/BFI8ruJhWfKqXoCkOKAX0llEjO
	 2c7RPR2epv17eKsW9mgHNN3dW5a5ZOdv3Z/Fuc/zWorWoUB8X1Pw7Dp7VsWt5+Ckcw
	 JhwQkizTRpD19CpHg+wvOyRp784BczZgt2yxffBlhKvoQQPaxEC6Aey8j1BjosMOrz
	 LqcND0HuqbIJQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	a.zummo@towertech.it,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] rtc: max77686: convert to i2c_new_ancillary_device
Date: Tue, 28 Apr 2026 06:41:09 -0400
Message-ID: <20260428104133.2858589-58-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7B1F4830DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,kernel.org,samsung.com,linaro.org,towertech.it,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6447-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Svyatoslav Ryhel <clamor95@gmail.com>

[ Upstream commit 0d65a9d93d870ef3d13642f88d0e6d562790c96d ]

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Link: https://patch.msgid.link/20260312085258.11431-6-clamor95@gmail.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Phase Walkthrough

### Phase 1: Commit Message Forensics
Record 1.1: subsystem `rtc: max77686`; action verb `convert`; intent is
to replace hardcoded RTC I2C client creation with
`i2c_new_ancillary_device()` so DT can specify the RTC address.

Record 1.2: tags found: `Signed-off-by: Svyatoslav Ryhel
<clamor95@gmail.com>`, `Link:
https://patch.msgid.link/20260312085258.11431-6-clamor95@gmail.com`,
`Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>`. No
`Fixes:`, `Reported-by:`, `Tested-by:`, `Reviewed-by:`, `Acked-by:`, or
`Cc: stable`.

Record 1.3: the bug is that MAX77663 RTC can be factory-set at either
`0x48` or `0x68`, but the driver always uses the MAX77620 default
`0x68`. The cover letter states this was tested on LG Optimus Vu P895
with a non-default RTC position and the RTC registered correctly.

Record 1.4: this is a hidden hardware correctness fix, not cleanup. It
lets existing supported MAX77663 hardware describe an otherwise
undetectable factory-set RTC address.

### Phase 2: Diff Analysis
Record 2.1: one file changed: `drivers/rtc/rtc-max77686.c`, `12
insertions`, `2 deletions`. Added `max77686_rtc_release_dev()`, modified
`max77686_init_rtc_regmap()`. Scope is single-file and surgical.

Record 2.2: before, the driver always called
`devm_i2c_new_dummy_device(..., info->drv_data->rtc_i2c_addr)`. After,
it calls `i2c_new_ancillary_device(parent_i2c, "rtc", default_addr)`,
then registers a devm cleanup action with `i2c_unregister_device()`.

Record 2.3: bug category is hardware workaround / logic correctness. The
broken mechanism is hardcoded secondary RTC I2C address selection for a
chip whose RTC address cannot be detected.

Record 2.4: fix quality is good. It preserves default behavior when DT
has no `reg-names = "rtc"` entry, uses an existing I2C helper, and has
low regression risk. The main risk is backport context conflicts in
older trees, not runtime behavior.

### Phase 3: Git History
Record 3.1: blame/history shows the RTC regmap setup dates back to
`f3937549a975` and the currently hardcoded devm dummy path to later
cleanups; MAX77663 support entered via `4c58f7012f15`, first contained
in `v5.2`, creating a `max77620-rtc` child that uses the `0x68` default.

Record 3.2: no `Fixes:` tag, so no Fixes target to follow.

Record 3.3: recent file history includes cleanup commits `6c9405fd2581`
and `e6403ae59ce1`; these explain why the exact patch applies cleanly to
`v7.0` but conflicts on older trees. They are not semantic
prerequisites.

Record 3.4: author has several Tegra/platform commits in history; the
RTC maintainer Alexandre Belloni committed/applied the patch.

Record 3.5: code dependency `i2c_new_ancillary_device()` exists in
checked stable tags `v5.4` through `v7.0`. Related binding commit
`3cef6765b75e` documents the DT form but is not required for the driver
to build or run.

### Phase 4: Mailing List / External Research
Record 4.1: `b4 dig -c 0d65a9d93d870` found the original patch at
`https://patch.msgid.link/20260312085258.11431-6-clamor95@gmail.com`.
`b4 dig -a` showed v1 through v4; committed version is v4 patch `5/5`.

Record 4.2: recipients included RTC, MFD, DT, GPIO, regulator, thermal
maintainers/lists, including Alexandre Belloni, Lee Jones, Rob Herring,
Mark Brown, and relevant lists.

Record 4.3: cover letter says the patch was tested on LG Optimus Vu P895
with non-default MAX77663 RTC address. No separate bugzilla/syzbot
report was found.

Record 4.4: patch was part of a 5-patch series mostly
converting/documenting bindings. Patch 4 documents the optional RTC
address and was reviewed by Rob Herring; patch 5 was applied by
Alexandre Belloni.

Record 4.5: WebFetch lore searches were blocked by Anubis. Local `git
log stable/linux-7.0.y` did not find this target commit already present
in the stable branch checked here.

### Phase 5: Code Semantic Analysis
Record 5.1: modified functions: added `max77686_rtc_release_dev()`,
modified `max77686_init_rtc_regmap()`.

Record 5.2: `max77686_init_rtc_regmap()` is called only by
`max77686_rtc_probe()`. The probe is registered through the
`max77686_rtc_driver` platform driver.

Record 5.3: key callees are `i2c_new_ancillary_device()`,
`devm_add_action_or_reset()`, `devm_regmap_init_i2c()`, and
`regmap_add_irq_chip()`.

Record 5.4: call chain is MFD `max77620_probe()` ->
`devm_mfd_add_devices()` creates `max77620-rtc` -> platform probe
`max77686_rtc_probe()` -> secondary RTC I2C client creation. This is
boot/device-probe reachable, not syscall-triggered.

Record 5.5: similar uses of `i2c_new_ancillary_device()` exist in other
drivers for secondary I2C addresses, and the helper documentation
confirms DT `reg`/`reg-names` lookup with default fallback.

### Phase 6: Stable Tree Analysis
Record 6.1: checked tags `v5.4`, `v5.10`, `v5.15`, `v6.1`, `v6.6`,
`v6.12`, and `v7.0`: all contain `i2c_new_ancillary_device()`,
`max77620-rtc`, and the hardcoded `MAX77620_I2C_ADDR_RTC 0x68` path. In-
tree MAX77663 DTS users appear from `v6.6` for Nexus 7 and from
`v6.9`/`v6.12` era for LG P880/P895.

Record 6.2: exact patch applies cleanly to `v7.0`. It conflicts on
`v5.4`, `v6.6`, and `v6.12` because older trees still store the dummy
client in `info->rtc` and lack later `dev_err_probe()`/local-client
cleanups. Expected backport difficulty is minor mechanical rework.

Record 6.3: no related stable commit with the same subject was found in
`stable/linux-7.0.y`.

### Phase 7: Subsystem Context
Record 7.1: subsystem is `drivers/rtc` for a Maxim PMIC RTC, with MFD/DT
interaction. Criticality is peripheral/driver-specific, not core kernel.

Record 7.2: subsystem has moderate activity; recent file history is
mostly cleanups plus MAX77714 support and prior MAX77620 fixes.

### Phase 8: Impact and Risk
Record 8.1: affected users are systems with MAX77663/MAX77620-family
PMICs, especially DT-based Tegra devices or downstream boards whose
MAX77663 RTC is at non-default `0x48`.

Record 8.2: trigger is device probe/boot when the RTC secondary I2C
address differs from the hardcoded default and DT supplies the correct
address. Unprivileged users do not trigger it.

Record 8.3: failure mode is RTC device not registering or not
functioning correctly on affected hardware. Severity is MEDIUM: hardware
functionality loss, not crash/security/data corruption.

Record 8.4: benefit is medium for affected hardware and downstream
stable users; risk is low because fallback preserves existing behavior
and the change is tightly scoped.

### Phase 9: Final Synthesis
Record 9.1: evidence for backporting: real hardware issue, existing
stable code contains the hardcoded path, existing I2C helper supports
exactly this use case, patch is tiny, tested on affected hardware, and
applied by RTC maintainer. Evidence against: not a crash/security/data-
corruption fix, no in-tree DTS currently uses the new two-address form,
older stable trees need a small manual backport.

Record 9.2: stable checklist: obviously correct: yes; fixes real bug:
yes, wrong undetectable hardware address; important issue: moderate
hardware functionality loss; small/contained: yes, 14-line one-file
change; no new kernel API: yes; stable application: clean for `v7.0`,
minor rework for older trees.

Record 9.3: exception category: hardware workaround for existing
supported PMIC variant, close to a DT/hardware quirk.

Record 9.4: decision: backport is justified, especially for `v7.0.y` and
with minor adjusted backports for older stable branches that carry
MAX77663 support.

## Verification
- Phase 1: `git show 0d65a9d93d870` verified subject, body, tags,
  author, committer, and diffstat.
- Phase 2: diff verified `12 insertions`, `2 deletions`, added release
  helper, and replacement of `devm_i2c_new_dummy_device()` with
  `i2c_new_ancillary_device()`.
- Phase 3: `git blame`, `git show 4c58f7012f15`, `git tag --contains`,
  and file history verified MAX77663 support and hardcoded RTC address
  path.
- Phase 4: `b4 dig -c`, `-a`, `-w`, and mbox read verified lore URL,
  v1-v4 series, recipients, cover-letter test statement, Rob Herring
  review on binding patch, and Alexandre Belloni application of RTC
  patch.
- Phase 5: `rg` and file reads verified caller chain through
  `max77686_rtc_probe()` and `max77620` MFD child creation.
- Phase 6: `git grep` across `v5.4` through `v7.0` verified API/code
  presence; temporary worktree `git apply --check` verified clean apply
  on `v7.0` and conflicts on older tested tags.
- Phase 7: `git log` verified recent RTC/MFD activity.
- Phase 8: impact and severity derive from verified commit text, cover-
  letter test statement, and probed call path.
- UNVERIFIED: I could not fetch lore search pages via WebFetch because
  lore returned Anubis challenge pages; stable-specific web discussion
  beyond local git history was not verified.

**YES**

 drivers/rtc/rtc-max77686.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 69ea3ce75b5a5..3cdfd78a07ccc 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -686,6 +686,11 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
+static void max77686_rtc_release_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -713,12 +718,17 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					   info->drv_data->rtc_i2c_addr);
+	client = i2c_new_ancillary_device(parent_i2c, "rtc",
+					  info->drv_data->rtc_i2c_addr);
 	if (IS_ERR(client))
 		return dev_err_probe(info->dev, PTR_ERR(client),
 				     "Failed to allocate I2C device for RTC\n");
 
+	ret = devm_add_action_or_reset(info->dev, max77686_rtc_release_dev,
+				       client);
+	if (ret)
+		return ret;
+
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap))
-- 
2.53.0


