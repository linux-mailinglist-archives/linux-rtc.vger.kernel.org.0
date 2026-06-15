Return-Path: <linux-rtc+bounces-6667-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f1CpFHEgMGrgOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6667-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:55:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08088687F57
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VoZQxaLG;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6667-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6667-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2121D30C6D5D
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC35409125;
	Mon, 15 Jun 2026 15:48:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D3407CE6
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538511; cv=none; b=kNsi57P247eTS4cA4K85SbB5bMOaqrzO280OnIFs4HQsMcJ1ATsmURY+WGgj8rYd+zhdHXQ+lQ17LrPoX4WcUoVH8qbeXTc5X1g4b6nDX5lcBDdiTPXIlz5mIYmCsk4UwyqUMOgERmmpMpcxxGNKSgUZrDlU1qnOlGS8y3T6O7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538511; c=relaxed/simple;
	bh=5J42CA5gXVabx1beJjVi+gafy14nkJZubknFPkXZYEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhamGdHeR9yPUJrGCKqoXkKbLD23ISuYfvrJDzC60eem8S7hix9FKtTmIZokZ4VczdQJsh3JXhqbW2YeCF4xp32jFkEy/qEcQh66ZDYDXCAE1N2hVOFGTg8P6RrF61OqTW70O+IvuZ9irybcYE3FxWqBZt68hzVp3W7XD4xBc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoZQxaLG; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46066e640easo2037156f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538504; x=1782143304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NleHEVmdE3vLoV5ZusttlWQutI1nXw+m2L2dd1O6HVo=;
        b=VoZQxaLGvE2AUssrpAwtUHv8mG0EfUzPlAEuOHMJI1PjhApO3NuYC0+uhAa0h2fZPY
         aVqbmP6M+ubG11vKN1EsuZGsj7gZjUBGoSpAkrbT5VZTNO4OMj11gj63Xa4yX7mJzNwE
         9Zsp/qhYS/OiiQOuctpZcpViC0lyJ/2xriOLIlHpYi75cM/RdNyUwkOqvj3YYKm7aMli
         SEt12yljpjKVOzqLeFEYWzZJgqYiE/hkjB+bhspo/ca8cRQ7ZFudWv+POepu016b7l1o
         zxi52awRcAtKDBmhlz8nz5YArponJEFugMK0o/Ur0VkRIMLB0frW6Okz1498/SY510cS
         za8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538504; x=1782143304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NleHEVmdE3vLoV5ZusttlWQutI1nXw+m2L2dd1O6HVo=;
        b=DzdkBh0ag1+a3AWQWDLMD10fRV0Ew1WLTxbTylt8zMuum+0bS5RaOwgromXjNKJozz
         CWlkcy4gdjDG2fFAcYyxR9RGqNIU5OvYRqI14B/jd2WCmXYi4dmZhaqm6DctJzMaC8em
         Az+E3GPT/0SyOIYwER+Yte/vp47Iwpec6xE2mrndYJn/B26z5lo/HQSPRhtMDVvyWGqn
         YrzKOhA4kgBYLuzVo/L7ddDF+BKhStbArEYQVlPS/kBBbUoWMuA2c/ncLcg99pbm98cw
         j19QlFQwh5cP3N36LrypJCJC6JzxKfzBIINUcagGqkVticoopvEuh/WeVwDvgdlj9EAJ
         i0Sw==
X-Gm-Message-State: AOJu0YwSQejKqPHni+iliw1Q01r6ja5T0YxO2OSQkc/4pM9tMN6m1EnW
	UZF23hx90FOkVHNvXx4wBome7xsGVKCDzMOs8dHjkChxnr8cAMBmO2tk
X-Gm-Gg: Acq92OGMRD/esNLo/+gchIiEDUsatA8tLYWEWMYVfEFFR7GWUrn0zx3Q/NlIhOHFq7P
	RcBuLBFlS0yMredo23gzit7xUv0WuQXagPjnegJrtvZdVHmKbMQcJo/4FBOOPi66YqsIRjkeLuR
	8zDnROwI3UCVgNoewy/50T31rh09HTrTTRQp7Et9nVT7aogMAgWDVXogG06W+jNgTx+AbERN6X3
	CPIqkpA/imvrSSlKv4mRnMiUg8Z/xu4lJucpG7MTQRastng1WXUIlH9wsyWSldvA35Qtq6ccbTB
	dm1QX2OUIQGv5weglwlOCAzv9eAjDQ5ugnbbp9MSvSZkLtAYTBUNR4nlEulFxUPD1erM5OrJsCt
	S9QrHx64ggtaRjSMDHTJz2SuvAeaAW5jpwMYZVJ75HFrdevkcfM9lYT3tTlFvzX0LBpjYH1i4nD
	XoJjoJcxk/Wx4jB0Z9kE369gP57G8fF1sxmDRAM/VqZEmvlvkdcSzoZhDhZQ0toyYARr7+4gNtr
	hNnCRWlcZOHWturevHbV0e+3Wj+N1LGZUEY
X-Received: by 2002:a5d:5d86:0:b0:43d:7bc9:9b2c with SMTP id ffacd0b85a97d-4606db8dca2mr20831910f8f.17.1781538503932;
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and wakeup capability
Date: Mon, 15 Jun 2026 16:47:58 +0100
Message-ID: <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6667-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08088687F57

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add system-wide power management support along with wakeup capability to
the rtc-rzn1 driver.

The hardware alarm module inside this RTC variant lacks a dedicated seconds
match register, meaning native hardware alarms can only be programmed with
minute-level granularity. For awake states, the driver bridges sub-minute
gaps by switching from a standard alarm interrupt (ALME) to a 1-second
periodic broadcast loop (1SE).

To support device wakeup from low-power states, initialize the device as a
system wakeup source during probe and configure both the hardware alarm IRQ
and the 1-second periodic IRQ as wakeup sources via enable_irq_wake() in the
suspend path. Because of hardware tracking design constraints across the
internal timer blocks, precise point-in-time wakeup alignment cannot be
guaranteed. Emit an explicit warning message during system suspend to notify
the user of this architectural layout limitation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 866ff595188d..12a319e9112c 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -70,6 +70,9 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	int alarm_irq;
+	int sec_irq;
+	bool alarm_enabled;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -219,6 +222,8 @@ static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
 	}
 
+	rtc->alarm_enabled = enable;
+
 	return 0;
 }
 
@@ -398,6 +403,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
+	rtc->alarm_irq = irq;
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev))
@@ -476,8 +482,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
 		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		rtc->sec_irq = -ENXIO;
+	} else {
+		rtc->sec_irq = irq;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		goto dis_runtime_pm;
@@ -500,6 +511,74 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 }
 
+static int rzn1_rtc_suspend(struct device *dev)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/*
+	 * Note on HW Wakeup Granularity Limitations:
+	 * True second-level accuracy cannot be guaranteed for device wakeups due
+	 * to hardware design tracking limitations across the three available blocks:
+	 * - Alarm Interrupt (RTC_ALM): Only matches on day-of-week, hour, and minute.
+	 * It completely lacks a seconds comparator field.
+	 * - 1-Second Interrupt (RTC_1S): A free-running broadcast that fires every
+	 * second. Activating it as a wakeup source triggers an immediate resume
+	 * on the very next 1-second boundary, bypassing target accuracy.
+	 * - Fixed Interval Interrupt (RTC_PRD): Periodic broadcast options (0.25s,
+	 * 0.5s, 1s, 1min, 1hr, 1day, or 1month) lack point-in-time matching,
+	 * offering no targeted relief.
+	 *
+	 * Consequently, due to the absence of a seconds comparator, if a wakeup is
+	 * requested within the current minute, the system will resume on the very next
+	 * 1-second tick regardless of the actual target alarm time. When the alarm
+	 * target is scheduled for a future minute, the system will resume early at the
+	 * start of that target minute boundary (00 seconds), failing to guarantee
+	 * second-level accuracy for the initial hardware wakeup event.
+	 */
+	if (rtc->alarm_enabled)
+		dev_crit(dev, "second/minute-level wakeup accuracy cannot be guaranteed by HW\n");
+	ret = enable_irq_wake(rtc->alarm_irq);
+	if (ret)
+		return ret;
+	if (rtc->sec_irq >= 0) {
+		ret = enable_irq_wake(rtc->sec_irq);
+		if (ret) {
+			disable_irq_wake(rtc->alarm_irq);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rzn1_rtc_resume(struct device *dev)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	ret = disable_irq_wake(rtc->alarm_irq);
+	if (ret)
+		return ret;
+	if (rtc->sec_irq >= 0) {
+		ret = disable_irq_wake(rtc->sec_irq);
+		if (ret) {
+			enable_irq_wake(rtc->alarm_irq);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_rtc_resume);
+
 static const struct of_device_id rzn1_rtc_of_match[] = {
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
@@ -512,6 +591,7 @@ static struct platform_driver rzn1_rtc_driver = {
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
+		.pm = pm_ptr(&rzn1_rtc_pm_ops),
 	},
 };
 module_platform_driver(rzn1_rtc_driver);
-- 
2.54.0


