Return-Path: <linux-rtc+bounces-5163-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC7C0AB1B
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 15:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A70B18A0F19
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 14:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E2B2E92DD;
	Sun, 26 Oct 2025 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efw+Tat/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10960248F58;
	Sun, 26 Oct 2025 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490242; cv=none; b=cGmSi3u3rWr+nGgwy+S7ywov/rsauxSHcFzVRVdy0/ODuXOnG2IlLl75RM6bhGHZ/oT8frgB9SH7FJJs7sRZIEdbvnzXDK3uPCYeXpGaHfgmg+tiyo9uI1pc50Ae6DvIW9dzY6BefwUr0ApxFD6uhm6RUaGZZ74HgtbAC0/hjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490242; c=relaxed/simple;
	bh=B6TTp9htOTtjCgFPG/S4E5+x6iGd3SFmBjkH5WLx/J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osQiorqMFCqaITQp2vxCzpwZaTEqCZU5vN2GYxHXYJ1epI/tkqh926Z3QKPyaga0PC1+4VxVNmN0JLhLwQhwpziEat9raOVT1OVQNj0SoNmsxlFzHWNpSVCjis5ySOXm3BXAX/tS0CZiPvB7n2KXEJHdasFu0Bi8Aq2s1mKipr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efw+Tat/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CD4C4CEF1;
	Sun, 26 Oct 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490241;
	bh=B6TTp9htOTtjCgFPG/S4E5+x6iGd3SFmBjkH5WLx/J8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efw+Tat/3zc+LG5JMYPEvsnm7uuIQUY9iNNKm4T6vXGn0VYVBjWV/4X7rhNip/6FO
	 rph9ms1/I4/uAxWT55AihACodR04rEm6ecTzK/fq7ZW8YHyWz7URkHAsPLkG+pDYQq
	 5CFi7oYZkIonZwL2jIliwkGx4Mr8pQMnatadP8+dKMMAJFgDfGsSTglYFI+ipOB7X6
	 IOlzy6LVlEtXaATmoMoLAz7KwGWjvtzDtbTu8Wb7dty7B+M+sjp04UqXSGbnEiEM9M
	 QCpzXgD9xZyo3bUrBrMD1EJnXjn87xXXyTfw2StZhAAduBP30ytNIIngrSR28Dc7HI
	 XNtZyLLp720rA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bruno Thomsen <bruno.thomsen@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.6] rtc: pcf2127: fix watchdog interrupt mask on pcf2131
Date: Sun, 26 Oct 2025 10:48:56 -0400
Message-ID: <20251026144958.26750-18-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruno Thomsen <bruno.thomsen@gmail.com>

[ Upstream commit 87064da2db7be537a7da20a25c18ba912c4db9e1 ]

When using interrupt pin (INT A) as watchdog output all other
interrupt sources need to be disabled to avoid additional
resets. Resulting INT_A_MASK1 value is 55 (0x37).

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Link: https://lore.kernel.org/r/20250902182235.6825-1-bruno.thomsen@gmail.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES — this change should go to stable.

- `drivers/rtc/rtc-pcf2127.c:611-623` now masks every INT A source
  except the watchdog bit on PCF2131 when `reset-source` is in use, so
  the INT A pin stays dedicated to driving the external reset pulse
  instead of reasserting on alarm/periodic/tamper events.
- Before this fix, `drivers/rtc/rtc-pcf2127.c:1174-1182` left all INT A
  mask bits cleared, and the probe path unconditionally enables several
  interrupt sources (see `pcf2127_enable_ts()` at `drivers/rtc/rtc-
  pcf2127.c:1128-1163`). With INT A wired as the watchdog output, any of
  those interrupts could immediately toggle the line and spuriously
  reset the system—effectively breaking boards that request
  watchdog/reset operation.
- The new masking runs only when CONFIG_WATCHDOG is enabled and the DT
  property requests watchdog output (`drivers/rtc/rtc-
  pcf2127.c:575-617`), so normal RTC users keep their interrupt
  functionality. If the write were to fail, behaviour simply falls back
  to the pre-fix state, so the delta carries minimal regression risk.
- The patch is tiny, self-contained to this driver, and fixes a user-
  visible bug (unwanted resets) without altering interfaces, making it
  an appropriate and low-risk stable backport candidate.

Suggested follow-up for maintainers: consider backporting anywhere
PCF2131 watchdog/reset support exists alongside unmasked INT A sources.

 drivers/rtc/rtc-pcf2127.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 3ba1de30e89c2..bb4fe81d3d62c 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -608,6 +608,21 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 			set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
 	}
 
+	/*
+	 * When using interrupt pin (INT A) as watchdog output, only allow
+	 * watchdog interrupt (PCF2131_BIT_INT_WD_CD) and disable (mask) all
+	 * other interrupts.
+	 */
+	if (pcf2127->cfg->type == PCF2131) {
+		ret = regmap_write(pcf2127->regmap,
+				   PCF2131_REG_INT_A_MASK1,
+				   PCF2131_BIT_INT_BLIE |
+				   PCF2131_BIT_INT_BIE |
+				   PCF2131_BIT_INT_AIE |
+				   PCF2131_BIT_INT_SI |
+				   PCF2131_BIT_INT_MI);
+	}
+
 	return devm_watchdog_register_device(dev, &pcf2127->wdd);
 }
 
-- 
2.51.0


