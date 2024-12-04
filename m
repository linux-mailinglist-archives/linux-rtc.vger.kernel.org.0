Return-Path: <linux-rtc+bounces-2665-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 940859E49E0
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 00:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4871418818FE
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 23:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD9D20A5EA;
	Wed,  4 Dec 2024 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVheEnCc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6320766E;
	Wed,  4 Dec 2024 23:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355297; cv=none; b=Aghe1mUflD70uQwNPSWKE3zLHel0eiiuNeCWCtRro6HY5IscG38B4G7VQOXiwlesepM4Jd+/VnMawLHnePxLmKRw6knfL7aBia9Ix8YuVKgD/Zpx52Q0RJKBmQ0shFGjZevbsJ95s4+nbCGABxBL6HeTUmuIHmOZjs2LA/lLz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355297; c=relaxed/simple;
	bh=bD/RNP/wZcE8mx//XWXRtjbINcRDinSfXo0ShkmlNoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pT2eKSpYPBAk15QbHEIEmRtCYVcv1qequrLe/oxYjl9Yd35mMfM41x/cuAHN/TlAURC/NmzVK9MKPigxklZUzk6Oo1mQz34rf6eTYmsBP+MFRo1zun1jG94cuhN4r6tqGUmQtPb6m+7hQ3EOtLeZRy1CFw0zw6IC8gw99RGnQiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVheEnCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E82DC4CED2;
	Wed,  4 Dec 2024 23:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355296;
	bh=bD/RNP/wZcE8mx//XWXRtjbINcRDinSfXo0ShkmlNoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVheEnCcqJGFqXnQcY9PvDbgcF+my3KSNBQF8Jl8W4Kt0ZoTFcSu6Q6qB5PnFbl/i
	 qi1Pi6bKXEizCxKir2X9RV8hGJe43U4WKGpBom6S21e0dinMYozhcAo0a06RrImrt5
	 K+3XonMqwqw2D9uIKIlPDu/Ef3rTxwuDRSZ5P4+Y/GKmWzzSVkW1k3ExLN4DHQ/TMr
	 37eD5rZYhwYXi+84r3XN24m1Sy3xwxvxjmNsxnXJ+vSood6ENK6JRslu2Hhr1gL/5h
	 q8eGNMRS1xqFydKM8JJCA+S9ft9aHYxvu5XUrH+m0eV+x7R9+1lNd5MKqoT0FrZDWa
	 bz3Iu4DroZghQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 2/8] rtc: cmos: avoid taking rtc_lock for extended period of time
Date: Wed,  4 Dec 2024 17:23:18 -0500
Message-ID: <20241204222334.2249307-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222334.2249307-1-sashal@kernel.org>
References: <20241204222334.2249307-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 0a6efab33eab4e973db26d9f90c3e97a7a82e399 ]

On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
takes about 9 msec during which time interrupts are off on the CPU that
does the read and the thread that performs the read can not be migrated
or preempted by another higher priority thread (RT or not).

Allow readers and writers be preempted by taking and releasing rtc_lock
spinlock for each individual byte read or written rather than once per
read/write request.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Link: https://lore.kernel.org/r/Zxv8QWR21AV4ztC5@google.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-cmos.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 35dca2accbb8d..5849d2970bba4 100644
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
+	return 0;
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
+	return 0;
 }
 
 /*----------------------------------------------------------------*/
-- 
2.43.0


