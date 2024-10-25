Return-Path: <linux-rtc+bounces-2334-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B69B0F9C
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 22:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C89284317
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 20:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1720F3F5;
	Fri, 25 Oct 2024 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPNrybOt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3735D186E5F;
	Fri, 25 Oct 2024 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887303; cv=none; b=FYvq47lhtNwGWZJC4cKpX/LiLkiCW4kfAq3PDWKX9VHhRbhtPdUc2zUuq/TgZbekVHMHy/B1Unx1SquTAcfuJtV+dWKD0SexX9S3o8VM3YzP/EiNTktz08Pbhje1QDW8XTKKpamID5Xw5uvNl+KD8FpXADAI/I0NniLHHCeL8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887303; c=relaxed/simple;
	bh=Iqd0pTnZDjp2Lx+H7LpFIcoGWZvjk7LCLaF7NkGxAgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FjWnz6oubo1fQrA5nhcd6PlN3/CrMaG+8HWhTismaOUd4dcUnBQ0Ny+XaBRCgCt+8GaNd7fN991NE1FOdJHCju6gUofL2qqT8mFdNVSbonpT3Yreu/FX0Q9/t9KCinZi4Wel7FTfly/w45e2+5PzWj77En4AS7NFjDzIJBhZkfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPNrybOt; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso1683264a12.0;
        Fri, 25 Oct 2024 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887300; x=1730492100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwdlKyb4til9hkf/MO+F6FeLswLFTYFO10n8zqmWXh8=;
        b=BPNrybOt4He3Kpa+6xlzrjdqpNfiyZOHhAxNgLMZEmuzh8Cqe2X23Gk3c59kzmCVgM
         qQJt41Tl+m9v7q2W4WnAlkqyLhoSPircGfm2P6zi6EB5KClb6Y0G/P2TVLqO15k2Y5EN
         gqaH+g0JTi2Ni4jdgz6ujAmqR2AxbSVTNc7OqD5xquLIHg03P6MSP3Qpjo33KnYmkCCI
         DtWh1NGcPfabf5fOoKjwQH+0IQkNEyLH6bxhV3bgX2FeWOBJCBrg/Ke3pfNAX3V2FiQa
         rGwUneY/TForN6REpLB6ILNntTuCcHoQQw9EGUsH0Db6sTFG7Kwn4kZDDB31ZayD5CA3
         DIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887300; x=1730492100;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwdlKyb4til9hkf/MO+F6FeLswLFTYFO10n8zqmWXh8=;
        b=KaVkTcdyMFz0paDt08H3+iZa/pkQE/ifUXXbQiJQq/lQQkBfe19J9sYf6nHxjXjF8q
         N3AbI5aiTBWtFVPHCVq4VX8k7VqelFC6SoZVXX8zlqjCzt/oYVZ8lsR8TSGW7Kp2ezZ8
         kbALCoPsJC8WYUhEnJenUTIokWTF2dlEpEfUnNOkh2du7qMDTPvJs9Q19rgA9s7yvRfz
         lSiSvyny3Dw+OXvvDNQiHdT6+aNFkkph/6a56emhflZz9s1GeGvOTa5r5eCLdm3GBtCT
         Q84qJkklq6ii6jDTCzmNhPPsEos8/8xBoHzkFudIKErtS2dW5SB3yhcIQyD8UzNxTzrl
         MiOA==
X-Forwarded-Encrypted: i=1; AJvYcCVFywUjeRDDKDAfzNRak4oxrHDepUVo5CCdLmTNqXK56zPaYMNXHQWZp16Rj6VyZRZLvjI/E4lhEzTmYY0=@vger.kernel.org, AJvYcCXQhcAaG/ufY/Bdm0DJdwiI1+Mo6JO9Vqd6A3J9Q5UDAH65mMpwOERUcIcCYtKM2ZbIiMO14tKiQhN7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhIUeqQ6ZFEO9+vX4+vEBO50cpng+tOFNvO+AY3kfdfoO9OIl
	okJ/qRp5cSY5xwoTiFQLohc80rEV/bQeDxLrCpf2ZniO8Axg/Lp1SPU92Q==
X-Google-Smtp-Source: AGHT+IEjMTkdzkm4eT/yie/QmJ16pOo0WoP9PWEdfsJ1ZQLAL7ZA/X3fbIQbiZj2PMobQ7Hr7hpOMw==
X-Received: by 2002:a05:6300:4041:b0:1d9:167a:7890 with SMTP id adf61e73a8af0-1d9a7545651mr1084821637.11.1729887300307;
        Fri, 25 Oct 2024 13:15:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1691:2dbd:7c00:4e03])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720579356aasm1474958b3a.80.2024.10.25.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:14:59 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:14:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: cmos: avoid taking rtc_lock for extended period of time
Message-ID: <Zxv8QWR21AV4ztC5@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
takes about 9 msec during which time interrupts are off on the CPU that
does the read and the thread that performs the read can not be migrated
or preempted by another higher priority thread (RT or not).

Allow readers and writers be preempted by taking and releasing rtc_lock
spinlock for each individual byte read or written rather than once per
read/write request.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: use "return 0;" instead of "return count;" (which should be the same
    behavior-wise because count is 0 by that point) to show intent
    clearer (per feedback from Mateusz Jończyk)

v1: https://lore.kernel.org/r/Zxqv9KYnBdtnuqox@google.com

 drivers/rtc/rtc-cmos.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 35dca2accbb8..5849d2970bba 100644
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
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

