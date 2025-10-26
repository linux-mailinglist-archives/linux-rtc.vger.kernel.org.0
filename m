Return-Path: <linux-rtc+bounces-5162-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D5C0AB03
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 15:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 034444E905B
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF342E9EA6;
	Sun, 26 Oct 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv+p60qR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940AB2E973A;
	Sun, 26 Oct 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490211; cv=none; b=DnimG3aL/+fc/JJg1N5uD59Q713sgvEK37Rb2y/gfaxY3x0uTBxmRHU+ltHBauCHfSxZaSqCvnfREksDGZKFGZTSMsafmhkoitE2nMZl+wv+wVGuL3zuiDKAP7+CTVZOtJMDsjYqMwX74IKaZukdSFtJzBFpf6N3DlLaP+Mu1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490211; c=relaxed/simple;
	bh=jY0mVRH9vGGA3XQwuOzAK8Am1h8Cl0lc9WteBzrBfnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eusm5awnf2YdoY5R07ilT7qahvEQTJGZZGJkirdsixad9ATLXxO4uz5gtuP+m5zw45jaSd4DlTBfE3cTgscANCO7MhAGfjWKBTMo83dxSGs1lhAsGD6892yBXsiHrqBJZNvcZ7JnCzogkEGWsyzZiT3JHW71J43Z7fX6RWtNins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv+p60qR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AACC4CEE7;
	Sun, 26 Oct 2025 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490211;
	bh=jY0mVRH9vGGA3XQwuOzAK8Am1h8Cl0lc9WteBzrBfnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wv+p60qRjiw8Lp72ChwpOKNfvl1Xi0necj7mPX0VqhIK23KDgiAHgXBaI6FuGoeaQ
	 i6N9gFnAvFEXfc340YvdqkaIbI2/UrJ6F2dKrntmKkoYPuDMt65r50dMi4mBNzbkeQ
	 mTrVS9b2ToNaYW6d6mKxkg4C9Llp20u+tNUkH+/gsv3DOWYZzlQ7oheOEcHvGZ/zOo
	 rX09pE9MJQsTzzjc2lX/c2Ebp8R3B905Skikb/jyCYi5PdBQJkREfwDe802KeQRYZz
	 Wfve25x6lz/CRz7eBuXpa8SISRiYijIZB6SokfM6EXdT3v6q2sdKrLMZbtuWxyDZVx
	 ScRdyRgONX3pQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Harini T <harini.t@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] rtc: zynqmp: Restore alarm functionality after kexec transition
Date: Sun, 26 Oct 2025 10:48:45 -0400
Message-ID: <20251026144958.26750-7-sashal@kernel.org>
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

From: Harini T <harini.t@amd.com>

[ Upstream commit e22f4d1321e0055065f274e20bf6d1dbf4b500f5 ]

During kexec reboots, RTC alarms that are fired during the kernel
transition experience delayed execution. The new kernel would eventually
honor these alarms, but the interrupt handlers would only execute after
the driver probe is completed rather than at the intended alarm time.

This is because pending alarm interrupt status from the previous kernel
is not properly cleared during driver initialization, causing timing
discrepancies in alarm delivery.

To ensure precise alarm timing across kexec transitions, enhance the
probe function to:
1. Clear any pending alarm interrupt status from previous boot.
2. Detect existing valid alarms and preserve their state.
3. Re-enable alarm interrupts for future alarms.

Signed-off-by: Harini T <harini.t@amd.com>
Link: https://lore.kernel.org/r/20250730142110.2354507-1-harini.t@amd.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `drivers/rtc/rtc-zynqmp.c:303-307` clears a latched `RTC_INT_ALRM` bit
  left behind by the kexec’d kernel so the new instance doesn’t mis-
  handle a stale interrupt; this matches the existing acknowledge flow
  in `xlnx_rtc_alarm_irq_enable()` (`drivers/rtc/rtc-zynqmp.c:125-152`),
  but now happens eagerly during probe to avoid delayed/duplicate
  delivery.
- `drivers/rtc/rtc-zynqmp.c:309-312` inspects the hardware alarm
  register and only preserves state when the stored alarm time is still
  in the future, preventing stray enables after a cold boot while
  keeping real alarms armed across the handover.
- Because the prior kernel disables the alarm IRQ in the ISR
  (`drivers/rtc/rtc-zynqmp.c:268-272`), the new code re-arms it when a
  valid alarm is detected (`drivers/rtc/rtc-zynqmp.c:355-357`); without
  this, alarms that were scheduled before the kexec never fire under the
  new kernel, which is a user-visible regression.
- The change is tightly scoped to probe-time initialization, uses
  existing register helpers, and introduces no ABI or architectural
  churn; risk is low compared with the clear functional gain of
  delivering RTC alarms correctly after kexec on ZynqMP hardware.

Next step you may want: 1) run the RTC selftests or a quick kexec/alarm
smoke test on target hardware to validate the restored behavior.

 drivers/rtc/rtc-zynqmp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac2..3baa2b481d9f2 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -277,6 +277,10 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
 static int xlnx_rtc_probe(struct platform_device *pdev)
 {
 	struct xlnx_rtc_dev *xrtcdev;
+	bool is_alarm_set = false;
+	u32 pending_alrm_irq;
+	u32 current_time;
+	u32 alarm_time;
 	int ret;
 
 	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
@@ -296,6 +300,17 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(xrtcdev->reg_base))
 		return PTR_ERR(xrtcdev->reg_base);
 
+	/* Clear any pending alarm interrupts from previous kernel/boot */
+	pending_alrm_irq = readl(xrtcdev->reg_base + RTC_INT_STS) & RTC_INT_ALRM;
+	if (pending_alrm_irq)
+		writel(pending_alrm_irq, xrtcdev->reg_base + RTC_INT_STS);
+
+	/* Check if a valid alarm is already set from previous kernel/boot */
+	alarm_time = readl(xrtcdev->reg_base + RTC_ALRM);
+	current_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
+	if (alarm_time > current_time && alarm_time != 0)
+		is_alarm_set = true;
+
 	xrtcdev->alarm_irq = platform_get_irq_byname(pdev, "alarm");
 	if (xrtcdev->alarm_irq < 0)
 		return xrtcdev->alarm_irq;
@@ -337,6 +352,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	xlnx_init_rtc(xrtcdev);
 
+	/* Re-enable alarm interrupt if a valid alarm was found */
+	if (is_alarm_set)
+		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
+
 	device_init_wakeup(&pdev->dev, true);
 
 	return devm_rtc_register_device(xrtcdev->rtc);
-- 
2.51.0


