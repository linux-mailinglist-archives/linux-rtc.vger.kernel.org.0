Return-Path: <linux-rtc+bounces-6032-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCh4C59+nGm6IQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6032-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:21:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2CA179A31
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5580F30ACF1F
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 16:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3704430F532;
	Mon, 23 Feb 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpUNSPJm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3930EF80;
	Mon, 23 Feb 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863433; cv=none; b=qMnzW5lmrOVwNh6ahO0Nps7Imm1JRF5D7IgXfi8bFtlx2+C8i2lNm0hRnnUk5uKkJA+xW5unaIGCmWYyMN8cLcDskjVvcbeQMhYyEkf1uIop/5KkS5czVYFStmb/6aUP7M4cA3dLyHRzxeBRkGKFVCkz6DP/RR4ryCOwn3Vx2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863433; c=relaxed/simple;
	bh=XK+PXadn+TlLWZTmix1ykoVvNzE32bv+ynARqf+1YAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oh/5vC/AyvvL9t4G+zjDo5e2hiwzurtv2qYLweG/21vcmBk+nY7FINs8aZJN1/9/aEKqlN+ZtRFC+i/N4TOPZIKWiLnDzxULV3XogeumrsqXhsTwx3XQul0R+k1lzMixQOwj4FvPNrtzngMl4IiFTuq1pNKATmvTmy8w/myAMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpUNSPJm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA44C19423;
	Mon, 23 Feb 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771863432;
	bh=XK+PXadn+TlLWZTmix1ykoVvNzE32bv+ynARqf+1YAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hpUNSPJmNO7oPx/1iv/Q7WtE3cARfWvR0y2ySUTfgf5bdL2nHfEk+dK/sDhplawEN
	 J0dCp5+lFXmvytXDBKY4QCSY7Tcd0ZIXIkj8o4JlU0DDJnc97Iejvoe0gn+w8BUeGV
	 R3C3oOmoj2/rDG3w8G8FypdJa13OWTpyoro/uoTyhNSPBqFrJhquzXNwOU7md11KYk
	 w4mk0U7uWEI8ph2hqKIMOsW72qsjjpgr0jaFbvMgmkBU7MRQyWGO+AblsbsA9e3jkH
	 a3BO7HYxCm9D/duUF5PYygBqtHCYnjP208JLJYxKpT1J7buMio5Ye267xQxGwj/WbG
	 MganSQkzHrk8g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomas Melin <tomas.melin@vaisala.com>,
	Harini T <harini.t@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] rtc: zynqmp: correct frequency value
Date: Mon, 23 Feb 2026 11:17:07 -0500
Message-ID: <20260223161707.2714732-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223161707.2714732-1-sashal@kernel.org>
References: <20260223161707.2714732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6032-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,msgid.link:url,amd.com:email]
X-Rspamd-Queue-Id: 9A2CA179A31
X-Rspamd-Action: no action

From: Tomas Melin <tomas.melin@vaisala.com>

[ Upstream commit 2724fb4d429cbb724dcb6fa17953040918ebe3a2 ]

Fix calibration value in case a clock reference is provided.
The actual calibration value written into register is
frequency - 1.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
Acked-by: Michal Simek <michal.simek@amd.com>
Link: https://patch.msgid.link/20260122-zynqmp-rtc-updates-v4-1-d4edb966b499@vaisala.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the commit fixes

This commit fixes an off-by-one error in the RTC calibration value when
the frequency is obtained from a clock reference (via `clk_get_rate()`).
The ZynqMP RTC hardware register expects a calibration value of
`frequency - 1`, but the code was writing the raw frequency value
directly.

**Evidence:**
- `RTC_CALIB_DEF` = `0x7FFF` = 32767 = 32768 - 1 (the default is already
  correctly decremented)
- The `"calibration"` DT property presumably provides the register-ready
  value (already freq-1)
- But `clk_get_rate()` returns the raw clock rate (e.g., 32768), so it
  needs the `-1` adjustment
- Without the fix, the RTC counts one extra tick per second, causing
  time drift

### Code change assessment

The fix adds an `else` branch with `xrtcdev->freq--` when the frequency
comes from `clk_get_rate()` (i.e., when `xrtcdev->freq` is non-zero from
the clock). This is a 2-line addition, surgically targeted.

### Dependency analysis

The clock name fix `2a388ff22d2cb` ("rtc: zynqmp: Fix optional clock
name property") was already tagged `Cc: stable@kernel.org` and is
targeted at v6.14-rc1. Before that fix, the driver was looking for clock
name "rtc_clk" instead of "rtc" (matching the DT binding), so the clock-
based frequency path was effectively dead code. With `2a388ff22d2cb`
being backported to stable, the clock can now actually be found, making
this off-by-one bug reachable.

The underlying calibration infrastructure was introduced in
`07dcc6f9c762` (v6.0-rc1), so stable trees v6.1.y and later have the
affected code.

### Stable criteria evaluation

- **Fixes a real bug:** Yes - incorrect RTC calibration causes time
  drift
- **Obviously correct:** Yes - the register needs freq-1, this subtracts
  1
- **Small and contained:** Yes - 2 lines in one file
- **No new features:** Correct - purely fixes calibration logic
- **Tested:** Yes - has Tested-by and Reviewed-by from AMD engineer,
  Acked-by from Michal Simek

### Risk assessment

**Very low risk.** The change only affects the path where a clock
reference provides the frequency. It cannot break the default path
(`RTC_CALIB_DEF`) or the DT `"calibration"` property path. The worst
case if something were wrong would be an RTC running at the wrong rate -
exactly the same as the current bug.

### Verification

- Read the full driver source: confirmed `RTC_CALIB_DEF` = 0x7FFF =
  32767 (line 40)
- Verified `clk_get_rate()` returns raw frequency, not register value,
  per kernel API
- `git show 85cab027d4e31`: confirmed previous calibration fix changed
  default from 0x198233 to 0x7FFF (32768-1)
- `git show 07dcc6f9c762`: confirmed this is the commit that introduced
  clock-based calibration (v6.0-rc1)
- `git describe --contains 2a388ff22d2cb`: confirmed clock name fix is
  in v6.14-rc1, already tagged for stable
- `git describe --contains 07dcc6f9c762`: confirmed calibration support
  is in v6.0-rc1, present in all current stable trees
- The fix directly corresponds to the relationship: `RTC_CALIB_DEF`
  (default) = 0x7FFF = 32768 - 1, confirming the register semantics

This is a small, well-tested fix for incorrect RTC timekeeping. It's a
companion to the already-stable-tagged clock name fix. Without this fix,
any board using the ZynqMP RTC with a clock reference will have
incorrect time calibration.

**YES**

 drivers/rtc/rtc-zynqmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3baa2b481d9f2..856bc1678e7d3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 					   &xrtcdev->freq);
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
+	} else {
+		xrtcdev->freq--;
 	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
-- 
2.51.0


