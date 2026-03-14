Return-Path: <linux-rtc+bounces-6201-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CX0Fc5QtWm8zAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6201-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900E28D0E9
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5967E300B8CF
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6C22EB87E;
	Sat, 14 Mar 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEUKhBWd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7A517BA2;
	Sat, 14 Mar 2026 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490377; cv=none; b=YZDO/dl64+TOMV9ktQz4ek/yXc+ZlcaMG086C2gW8DYIT9xivxTBQ7YTmViU7jAUdNsks5i6bCP6Ijc46swKG69B4haAxxSygq18Gc3TS+4J1tVD03R8I73bBXIf3AnfFPygWpcoOBAon6yLbwVUa0glTbb9n6/iY+aCTdq9LcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490377; c=relaxed/simple;
	bh=MgnzSi2O40TkVkf3IA+ouB7bdnyDgrYLAeBVXp+Ohh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHTTelueckYG8gRZWmSp1V6bIj3IwvxyTy4wCgydgfrltN3joHjAi36eYyiK9JWUsuvfYlX2CGTDD2pfkSClQHi3F/xMO8c1cqtqiEj56HgOg38aZRwHji/ypWd3DogdVXVdU76vbrlbNL1qK/drCuwWJM6IcpZoC8OL3gYDICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEUKhBWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7B9C116C6;
	Sat, 14 Mar 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773490376;
	bh=MgnzSi2O40TkVkf3IA+ouB7bdnyDgrYLAeBVXp+Ohh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEUKhBWdSyu1Equ25k1GBsl6QKUrFOLahjeM9orTtoSxyACEjiOATXGE8s0Y+2uTA
	 obaZ/Z+5wfC2jxH+bSaF/8LOeHE0vK1qFsHjtnrI7SmrR+MXH+NlsvxumwmQJESTMT
	 6SBYc27HXYDrlCoDtUKwlRNf4Ly2UQZzh/HeCoYXCTU+WtUOLf8xC+GQ/FYmUTxQc7
	 /C5JztQO7ezyEbGFsOjq2MXvXxeJqpo4H5FcyQLF5sRPuCVbE5ozj84E+d6ANlkRWV
	 tZOBAmrAtri91fOy+6KXPzaMjJasqjbEF38gCZJj3xlsOW46KxBXKFXsrAXrddFiB8
	 jM1gmvba8OphQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 2/2] rtc: cmos: Do not require IRQ if ACPI alarm is used
Date: Sat, 14 Mar 2026 13:12:44 +0100
Message-ID: <6168746.MhkbZ0Pkbq@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <3964452.kQq0lBPeGt@rafael.j.wysocki>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6201-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,rafael.j.wysocki:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5900E28D0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

If the ACPI RTC fixed event is used, a dedicated IRQ is not required
for the CMOS RTC alarm to work, so allow the driver to use the alarm
without a valid IRQ in that case.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/rtc/rtc-cmos.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -216,6 +216,11 @@ static inline void cmos_write_bank2(unsi
 
 /*----------------------------------------------------------------*/
 
+static bool cmos_no_alarm(struct cmos_rtc *cmos)
+{
+	return !is_valid_irq(cmos->irq) && !cmos_use_acpi_alarm();
+}
+
 static int cmos_read_time(struct device *dev, struct rtc_time *t)
 {
 	int ret;
@@ -287,7 +292,7 @@ static int cmos_read_alarm(struct device
 	};
 
 	/* This not only a rtc_op, but also called directly */
-	if (!is_valid_irq(cmos->irq))
+	if (cmos_no_alarm(cmos))
 		return -ETIMEDOUT;
 
 	/* Basic alarms only support hour, minute, and seconds fields.
@@ -520,7 +525,7 @@ static int cmos_set_alarm(struct device
 	int ret;
 
 	/* This not only a rtc_op, but also called directly */
-	if (!is_valid_irq(cmos->irq))
+	if (cmos_no_alarm(cmos))
 		return -EIO;
 
 	ret = cmos_validate_alarm(dev, t);
@@ -1096,7 +1101,7 @@ cmos_do_probe(struct device *dev, struct
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
 			goto cleanup1;
 		}
-	} else {
+	} else if (!cmos_use_acpi_alarm()) {
 		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
 	}
 
@@ -1121,7 +1126,7 @@ cmos_do_probe(struct device *dev, struct
 		acpi_rtc_event_setup(dev);
 
 	dev_info(dev, "%s%s, %d bytes nvram%s\n",
-		 !is_valid_irq(rtc_irq) ? "no alarms" :
+		 cmos_no_alarm(&cmos_rtc) ? "no alarms" :
 		 cmos_rtc.mon_alrm ? "alarms up to one year" :
 		 cmos_rtc.day_alrm ? "alarms up to one month" :
 		 "alarms up to one day",
@@ -1147,7 +1152,7 @@ cleanup0:
 static void cmos_do_shutdown(int rtc_irq)
 {
 	spin_lock_irq(&rtc_lock);
-	if (is_valid_irq(rtc_irq))
+	if (!cmos_no_alarm(&cmos_rtc))
 		cmos_irq_disable(&cmos_rtc, RTC_IRQMASK);
 	spin_unlock_irq(&rtc_lock);
 }




