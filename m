Return-Path: <linux-rtc+bounces-3273-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC10A45F20
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 13:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32D7A188A31B
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 12:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282DE221DB4;
	Wed, 26 Feb 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pP+ghec2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817922171F;
	Wed, 26 Feb 2025 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572826; cv=none; b=SQYG+WJ9e8KQpzw+UitRXDQ0PZ28RVeQnm1psWpNcwd49qHEE3qYN/kaWI5ImMmg7Oy+LkMNt7yKwq43MUdGEjc5i4agjuwx4y60O7wO16Tn4TKnxvNPwMPONQTHDRTUGzPIZ6OU0tordoTytm6djjqz5OzADDTIk/uSrEdWUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572826; c=relaxed/simple;
	bh=GDO01X9iZgtSJSQ0iimZPyiEFmwLQ1wOj3CkCsppGPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6D6nlEaUT9U9C3pMIMciGyneTmVYx3XwsMMmYhbRYI90irTqeks7nKN5AcJyETplJrFLkVpds4yhQMvnxkKN+Nt/XbCDJAzKbBjRr6RXHyyR4xw42r5mSBWmQLEBznNJckUttT2dgCMVmLw+BLUdolsPKTDiR3dMam/8X061PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pP+ghec2; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tVXgTU+zI0WQiJmQs53/ml1WEJZ/ukrs1Nu0L1HaNl4=; b=pP+ghec21MjktWPRtpR+ci3jLf
	Qj4gstMKgBAq11uGYTGDQZIZ19XolOvCb+8b1bhTHpXD8yDbd2y9UIKCSwXl4UOz1cLCbO3QaIwg4
	d4mCM5HjoJAfVjAchpjmEwGkW5VBY08MHdObioAUQw+yKXw111D/45INseknD5Pe2td5DBvapMsNR
	oFCDM3I6zUG8agQwdqtf3AsQ6KfkgbiHVaFAARmIU+fWRGFCvviENgywJJhRVqMMtEGYhdNPhbjZv
	Bu7eCckKm8pPS06TSW4dCEsnCeiTmN7TBVbAjda/NdSFfOfBasqAFT+Z1A2Abg1bY5+Gtq8YDdh4H
	clBTWKtA==;
Received: from [179.125.94.240] (helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tnGV4-000xB7-MC; Wed, 26 Feb 2025 13:27:00 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 26 Feb 2025 09:26:27 -0300
Subject: [PATCH 1/2] m68k: rtc: dp8570a: split read_time and set_time
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-m68k-rtc-v1-1-404641ec62e6@igalia.com>
References: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
In-Reply-To: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
X-Mailer: b4 0.14.2

Give each ioctl cmd its own function. There should be no other functional
changes.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 arch/m68k/bvme6000/rtc.c | 148 ++++++++++++++++++++++++++---------------------
 1 file changed, 83 insertions(+), 65 deletions(-)

diff --git a/arch/m68k/bvme6000/rtc.c b/arch/m68k/bvme6000/rtc.c
index b43eeef0982c117fdb39f63a6feab59e18e99502..a84996bd1491da3c1d9bd8dae7e1a92805c735e0 100644
--- a/arch/m68k/bvme6000/rtc.c
+++ b/arch/m68k/bvme6000/rtc.c
@@ -36,43 +36,103 @@ static unsigned char days_in_mo[] =
 
 static atomic_t rtc_status = ATOMIC_INIT(1);
 
-static long rtc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+static int dp8570a_rtc_read_time(struct rtc_time *wtime)
+{
+	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
+	unsigned char msr;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	/* Ensure clock and real-time-mode-register are accessible */
+	msr = rtc->msr & 0xc0;
+	rtc->msr = 0x40;
+	memset(wtime, 0, sizeof(struct rtc_time));
+	do {
+		wtime->tm_sec =  bcd2bin(rtc->bcd_sec);
+		wtime->tm_min =  bcd2bin(rtc->bcd_min);
+		wtime->tm_hour = bcd2bin(rtc->bcd_hr);
+		wtime->tm_mday =  bcd2bin(rtc->bcd_dom);
+		wtime->tm_mon =  bcd2bin(rtc->bcd_mth)-1;
+		wtime->tm_year = bcd2bin(rtc->bcd_year);
+		if (wtime->tm_year < 70)
+			wtime->tm_year += 100;
+		wtime->tm_wday = bcd2bin(rtc->bcd_dow)-1;
+	} while (wtime->tm_sec != bcd2bin(rtc->bcd_sec));
+	rtc->msr = msr;
+	local_irq_restore(flags);
+	return 0;
+}
+
+static int dp8570a_rtc_set_time(struct rtc_time *rtc_tm)
 {
 	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
 	unsigned char msr;
 	unsigned long flags;
-	struct rtc_time wtime;
+	unsigned char mon, day, hrs, min, sec, leap_yr;
+	unsigned int yrs;
+
+	yrs = rtc_tm->tm_year;
+	if (yrs < 1900)
+		yrs += 1900;
+	mon = rtc_tm->tm_mon + 1;   /* tm_mon starts at zero */
+	day = rtc_tm->tm_mday;
+	hrs = rtc_tm->tm_hour;
+	min = rtc_tm->tm_min;
+	sec = rtc_tm->tm_sec;
+
+	leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
+
+	if ((mon > 12) || (mon < 1) || (day == 0))
+		return -EINVAL;
+
+	if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
+		return -EINVAL;
+
+	if ((hrs >= 24) || (min >= 60) || (sec >= 60))
+		return -EINVAL;
+
+	if (yrs >= 2070)
+		return -EINVAL;
+
+	local_irq_save(flags);
+	/* Ensure clock and real-time-mode-register are accessible */
+	msr = rtc->msr & 0xc0;
+	rtc->msr = 0x40;
+
+	rtc->t0cr_rtmr = yrs%4;
+	rtc->bcd_tenms = 0;
+	rtc->bcd_sec   = bin2bcd(sec);
+	rtc->bcd_min   = bin2bcd(min);
+	rtc->bcd_hr    = bin2bcd(hrs);
+	rtc->bcd_dom   = bin2bcd(day);
+	rtc->bcd_mth   = bin2bcd(mon);
+	rtc->bcd_year  = bin2bcd(yrs%100);
+	if (rtc_tm->tm_wday >= 0)
+		rtc->bcd_dow = bin2bcd(rtc_tm->tm_wday+1);
+	rtc->t0cr_rtmr = yrs%4 | 0x08;
+
+	rtc->msr = msr;
+	local_irq_restore(flags);
+
+	return 0;
+}
+
+static long rtc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
 	void __user *argp = (void __user *)arg;
 
 	switch (cmd) {
 	case RTC_RD_TIME:	/* Read the time/date from RTC	*/
 	{
-		local_irq_save(flags);
-		/* Ensure clock and real-time-mode-register are accessible */
-		msr = rtc->msr & 0xc0;
-		rtc->msr = 0x40;
-		memset(&wtime, 0, sizeof(struct rtc_time));
-		do {
-			wtime.tm_sec =  bcd2bin(rtc->bcd_sec);
-			wtime.tm_min =  bcd2bin(rtc->bcd_min);
-			wtime.tm_hour = bcd2bin(rtc->bcd_hr);
-			wtime.tm_mday =  bcd2bin(rtc->bcd_dom);
-			wtime.tm_mon =  bcd2bin(rtc->bcd_mth)-1;
-			wtime.tm_year = bcd2bin(rtc->bcd_year);
-			if (wtime.tm_year < 70)
-				wtime.tm_year += 100;
-			wtime.tm_wday = bcd2bin(rtc->bcd_dow)-1;
-		} while (wtime.tm_sec != bcd2bin(rtc->bcd_sec));
-		rtc->msr = msr;
-		local_irq_restore(flags);
+		struct rtc_time wtime;
+
+		dp8570a_rtc_read_time(&wtime);
 		return copy_to_user(argp, &wtime, sizeof wtime) ?
 								-EFAULT : 0;
 	}
 	case RTC_SET_TIME:	/* Set the RTC */
 	{
 		struct rtc_time rtc_tm;
-		unsigned char mon, day, hrs, min, sec, leap_yr;
-		unsigned int yrs;
 
 		if (!capable(CAP_SYS_ADMIN))
 			return -EACCES;
@@ -80,49 +140,7 @@ static long rtc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&rtc_tm, argp, sizeof(struct rtc_time)))
 			return -EFAULT;
 
-		yrs = rtc_tm.tm_year;
-		if (yrs < 1900)
-			yrs += 1900;
-		mon = rtc_tm.tm_mon + 1;   /* tm_mon starts at zero */
-		day = rtc_tm.tm_mday;
-		hrs = rtc_tm.tm_hour;
-		min = rtc_tm.tm_min;
-		sec = rtc_tm.tm_sec;
-
-		leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
-
-		if ((mon > 12) || (mon < 1) || (day == 0))
-			return -EINVAL;
-
-		if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
-			return -EINVAL;
-
-		if ((hrs >= 24) || (min >= 60) || (sec >= 60))
-			return -EINVAL;
-
-		if (yrs >= 2070)
-			return -EINVAL;
-
-		local_irq_save(flags);
-		/* Ensure clock and real-time-mode-register are accessible */
-		msr = rtc->msr & 0xc0;
-		rtc->msr = 0x40;
-
-		rtc->t0cr_rtmr = yrs%4;
-		rtc->bcd_tenms = 0;
-		rtc->bcd_sec   = bin2bcd(sec);
-		rtc->bcd_min   = bin2bcd(min);
-		rtc->bcd_hr    = bin2bcd(hrs);
-		rtc->bcd_dom   = bin2bcd(day);
-		rtc->bcd_mth   = bin2bcd(mon);
-		rtc->bcd_year  = bin2bcd(yrs%100);
-		if (rtc_tm.tm_wday >= 0)
-			rtc->bcd_dow = bin2bcd(rtc_tm.tm_wday+1);
-		rtc->t0cr_rtmr = yrs%4 | 0x08;
-
-		rtc->msr = msr;
-		local_irq_restore(flags);
-		return 0;
+		return dp8570a_rtc_set_time(&rtc_tm);
 	}
 	default:
 		return -EINVAL;

-- 
2.47.2


