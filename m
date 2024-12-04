Return-Path: <linux-rtc+bounces-2666-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C539E49EA
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 00:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D14164377
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 23:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10E121171E;
	Wed,  4 Dec 2024 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwWLVfg6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301B211719;
	Wed,  4 Dec 2024 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355324; cv=none; b=jjRfxeN2MdbAiVS1N0OIzLuUbqSi3Jmf6xv5oe1FFvPFbjPMqXGsNP3nNT6Uf6U7/Kxl7v/ouG6aTy5ijzMA2KEb28KWvkgg3h7DcP0RRUN52H1nx3CGJkefsqY+k3CacjANP0rNc58YCTqiIwfd2o1Bc/DoLiKuxFU7e/M6vu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355324; c=relaxed/simple;
	bh=bD/RNP/wZcE8mx//XWXRtjbINcRDinSfXo0ShkmlNoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv6OtR9VfKKdsk/MOdcAC9H6cw4gfna+bcILyaV029l4qt/eZlG6l6TPIgLzj4MXxqrF5nuFDakbqXjt19kF+EvFpG7mBPM7q53/KU28M6dQLvfIlcj76J52AIfs61ZAvV34hNMMkAzHIEUhPqfi2jcj6/BnJraSu2IDNxIkVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwWLVfg6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481CEC4CED2;
	Wed,  4 Dec 2024 23:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355324;
	bh=bD/RNP/wZcE8mx//XWXRtjbINcRDinSfXo0ShkmlNoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwWLVfg6C3oAsjvKxaXiesQomr99L95uqIEEcGe9lxoMR1tezPhdpLt45Fgrv4t1N
	 LpRwvm1hH1WhnWMQx0jy2tpsgwkSv5BsbNFjZRWdV5OAG1mTaVi2dUmS34cNujWUFR
	 KXrgeK0jtqPHXuDfL/JRj/5RpyZiBdvI2Eo6Fl0iU3FXYrRv68ya4uKgVYW50izU7L
	 TQz2/fa+CLadoBMxHSg2y3iiTD5VEy+CGqAcfKkyp4t1RE+LGxRluKWJlE6breGO3j
	 0tkMbsPhO8wF8yAS45DuFCoKLHl0oTNJ1/f6S92z9DjgBK4JPmMaq+Dg04lTuV2F4N
	 zI3xKCzOnWazQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 2/7] rtc: cmos: avoid taking rtc_lock for extended period of time
Date: Wed,  4 Dec 2024 17:23:44 -0500
Message-ID: <20241204222402.2249702-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222402.2249702-1-sashal@kernel.org>
References: <20241204222402.2249702-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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


