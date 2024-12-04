Return-Path: <linux-rtc+bounces-2668-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD9B9E4A03
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 00:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCA028C82D
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 23:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D632225782;
	Wed,  4 Dec 2024 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1OmDpHD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FD215F73;
	Wed,  4 Dec 2024 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355366; cv=none; b=edpKC5G9v5o16PyKdu9Khw1Y4Tofz4+LunvxljBdFwkQK8lGJ9o5ThcDDkqBcSIxauYuyvTUecUnAdWheIYXQ6dJfwRZq24w+diWTESHNf8w08HUX8NGN1mauBRG5daJe0iu0R8mwOeGR8hEWZSht2c+3LwAIj+HpZsWta0MUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355366; c=relaxed/simple;
	bh=4CDcnZ1VSNENRhki7AXY4PqO+Rl1qVnKdD6EHA5I00s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPsIxwl4qPg9DFeNkte2J1VxzpFF0gbYAWzL74TH6AIzTqXtD0rmRI20U5yk5ENxYSi20uhU6geZIVdOBdUbtfR7VntGquWO0xzV4Bd0mGaQSh3FckeksZqgcvXIEvhASnGZ8k5o1qYvIBV9nwlHb7JmVcfeIQG0E1RxN9EUKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1OmDpHD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D365C4CED2;
	Wed,  4 Dec 2024 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355365;
	bh=4CDcnZ1VSNENRhki7AXY4PqO+Rl1qVnKdD6EHA5I00s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z1OmDpHDqSLAnrVswR33eNIs1I/nk7zg9w1vmgLJ/Fr579RJMyLXISolcHtyF9aao
	 yn1xhJVfCxAmABBwK+8lsSYBhxvE5V+VCq4nnDumMQFdzgxaAPLcSltyZWdHnALITj
	 Le7Ko/f9j2IdxyfftCMs0aQwWLEo1/EWHgDJ8B+Y+LtmbCl55ElLyLczLua2wU1xsj
	 TGFS9cpcJ70gnReya21ks/x10rkBcf4oTuhJryV2/TFQRaSBRaXXglp3L0hXT751CY
	 7tNTe2CZXooqJcgqX9l+2iXQB9+h2TxsrVhpkue0fAFTVCgf5OMkYUvTERXuqZFiZ7
	 QLIADbswJarDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 2/4] rtc: cmos: avoid taking rtc_lock for extended period of time
Date: Wed,  4 Dec 2024 17:24:34 -0500
Message-ID: <20241204222444.2250332-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222444.2250332-1-sashal@kernel.org>
References: <20241204222444.2250332-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index 542568cd72b32..5f43773900d18 100644
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


