Return-Path: <linux-rtc+bounces-2310-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B60629AF3BD
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 22:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B01281DB3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 20:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71C01B21AF;
	Thu, 24 Oct 2024 20:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq13Qqb1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB09198A30;
	Thu, 24 Oct 2024 20:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802234; cv=none; b=XzO+ObICBFhFDj+aZKb2NIViAVEM6bAiRBmM+dx+mMGyloZNu5HmPjYXJlAC/rdPl966CmNX7ZBORDeDORQC6s5ng45a7sSjf0oHN+9rnAeq5uuYjeEhfZ/90fe0MiXQlSq1ceOd75m4ClMWM8btNxMSoCre5AYAUyGBB3pGyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802234; c=relaxed/simple;
	bh=0WPYA3hPUFoNWZrUKuT9jq1loL+NRPd7BuN6YXBnJws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjIKgxeXswWwGIXAUJXS9j1KPLvG022RWINgmG1fk4kbfgxwBnbR4+ldr40WTwYmd8YVKthD1RDAL0mqrBhRcZOmMdVDvpG6Lzm4+3byxBZvCV42PULdvNkirLmF6EaPzGT4h/shLZEaVwVGabcpuxGgQTX8V3fwxl/RBgE4HqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq13Qqb1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e983487a1so987408b3a.2;
        Thu, 24 Oct 2024 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729802232; x=1730407032; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ws5hb3NYpojz7BHn3yE6WkBI/cHoGp7ZC/yjOfjPDs=;
        b=eq13Qqb1C6ogpltQeoG5zoEx6cr9ZOEFtYb2BQxSFwvFKsI2XBbTOuXN31VszIesG0
         L5ZPE3toM+WRsSyW6f6mohkB4xhuY4BemPMcHjB+Y1n3uMrxtbv5LwODAupkadk1fWdD
         vXTrZG2EXMVGgbfzG9+LqoYkD3Mg4gF3oAtzEm05JBZvk4QJnzgjmre+J+/zXQRkhf+M
         JybVpAE2mMmHEYeWEfTNTGqyVZzTpt26W7bk++GKYeTN8OUzEwpFxMwasdDKaBfAW4q4
         EUHlqmMtO2piVwX6HwW0r2hOPJiJ1hZZ5zitLSH8ebd0tCuFrn5Q8nYnewPnsK7A7JAG
         HTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802232; x=1730407032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ws5hb3NYpojz7BHn3yE6WkBI/cHoGp7ZC/yjOfjPDs=;
        b=Uvu5MD1vromfIuhQYR/XtOC32NBCghxUOKuxAbcM8HRG0zN8lCo7bElBIFWn/qchCk
         Uj1eTOtTzT0+rRLzEb8195q72ohCPrg3gQUWItWzSvxUohFVedtKifuODEP6cV/6Ez4G
         Bu7b7Lzf7QIf57nqdXzPuE+9/NyMOL7TomUk+/O0z+PqfRh8Mte9iOezv08LEvdQmhgN
         73A7NG98HMo7GUKfYmrcrw/LJkhPminCSVVqtC8FR/ntjRvmhVEuq6t7RNy3yeCUzApf
         nXlBjY/LXdQCuCqe5FbQxTTYjmaWQoggkb84DZSrYC0zafyPIEhbcbigtNbM5bjh7gt9
         1NdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1KFhFOagXW+NvEE3VqRPaGC8S9ChuS24pUW453PW4loYewZFL27lIn7f/p6RufKWEpfwT8vpoRg+e@vger.kernel.org, AJvYcCV6XU9tSD9ixvmKSH5+Oxa6iVCaPrNNcoMUxIzl/Ue7ydavCvXGtuewCPhryR492GM16B2dSs45HVhBzew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84C3fpp0ir71kJ66MCah77fPhv2MOF0Q4LDtfXZmJ9qjEh7HQ
	iabQq5fPiP/tJtMW80LDNdWcpU8noFgoWVQsMrRKiTUd4ZswG9P3
X-Google-Smtp-Source: AGHT+IFORtNJUaKfLuN3Fb0l3U3aDlU+GFnyOOUfni3Q2WMjSJ8uOwSM0n+uMUFrEQ5k4hDLWibSlQ==
X-Received: by 2002:a05:6a20:9f43:b0:1d9:22c1:1235 with SMTP id adf61e73a8af0-1d978b2c5a4mr9640759637.22.1729802231789;
        Thu, 24 Oct 2024 13:37:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a810:a864:e2e2:2651])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d3dsm8645020b3a.17.2024.10.24.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:37:11 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:37:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: cmos: avoid taking rtc_lock for extended period of time
Message-ID: <Zxqv9KYnBdtnuqox@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
takes about 9 msec during which time interrupts are off on the CPU that
does the read and the thread that performs the read can not be migrated
or preempted by another higher priority thread (RT or not).

Allow readers and writers be preempted by taking and releasing rtc_lock
spinlock for each individual byte read or written rather than once per
read/write request.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/rtc/rtc-cmos.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 35dca2accbb8..e8f2fe0d8560 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -645,18 +645,17 @@ static int cmos_nvram_read(void *priv, unsigned int off, void *val,
 	unsigned char *buf = val;
 
 	off += NVRAM_OFFSET;
-	spin_lock_irq(&rtc_lock);
-	for (; count; count--, off++) {
+	for (; count; count--, off++, buf++) {
+		guard(spinlock_irq)(&rtc_lock);
 		if (off < 128)
-			*buf++ = CMOS_READ(off);
+			*buf = CMOS_READ(off);
 		else if (can_bank2)
-			*buf++ = cmos_read_bank2(off);
+			*buf = cmos_read_bank2(off);
 		else
-			break;
+			return -EIO;
 	}
-	spin_unlock_irq(&rtc_lock);
 
-	return count ? -EIO : 0;
+	return count;
 }
 
 static int cmos_nvram_write(void *priv, unsigned int off, void *val,
@@ -671,23 +670,23 @@ static int cmos_nvram_write(void *priv, unsigned int off, void *val,
 	 * NVRAM to update, updating checksums is also part of its job.
 	 */
 	off += NVRAM_OFFSET;
-	spin_lock_irq(&rtc_lock);
-	for (; count; count--, off++) {
+	for (; count; count--, off++, buf++) {
 		/* don't trash RTC registers */
 		if (off == cmos->day_alrm
 				|| off == cmos->mon_alrm
 				|| off == cmos->century)
-			buf++;
-		else if (off < 128)
-			CMOS_WRITE(*buf++, off);
+			continue;
+
+		guard(spinlock_irq)(&rtc_lock);
+		if (off < 128)
+			CMOS_WRITE(*buf, off);
 		else if (can_bank2)
-			cmos_write_bank2(*buf++, off);
+			cmos_write_bank2(*buf, off);
 		else
-			break;
+			return -EIO;
 	}
-	spin_unlock_irq(&rtc_lock);
 
-	return count ? -EIO : 0;
+	return count;
 }
 
 /*----------------------------------------------------------------*/
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

