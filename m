Return-Path: <linux-rtc+bounces-1283-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2A904E41
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 10:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D261C229AD
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70EC16D31E;
	Wed, 12 Jun 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sskzFJ1s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF83169ACD
	for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181405; cv=none; b=RFqmkK+R1Gh2a5WDTjiAIEFiXuWvvfNukwpeHcTDuZn5dkYvwFf4CFmTgePQCFRsT9m9nKL6L9Hy9lMRcg/x/x/dythSqCBsqapmUZucnjqnVFBeaah3HNT++QOKc9q/PPJypNuxzwdhS55nQgn0LmW41BtnnjlB3lXu+6J4u8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181405; c=relaxed/simple;
	bh=t8vj4Z8K291bSOoqidlQpdF9N7ccu19T5Ou01u6zNgs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qlTFepBrCeZAXljrnKKcYAFSQSvB5R1DyHbqNCAyLbVmVkqtN3ChKDFLiEb1bF5LKOCsSVIWa21DOfWdDg9f5Rm+SOZHYnImO+kHIlS/jHzcprHWQj+TnUsD/oRPZa+Y6zKy9DD/UB9QsGiQcNw+9s7txLd0/lgQj6gylimngUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sskzFJ1s; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfe5863ca2cso892493276.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718181403; x=1718786203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y2uwFL7y38zzuOIY6yZzuRuyB/ucVnnJQUO1JVoJCq4=;
        b=sskzFJ1sZWSEe6Iw3TMAwHTqO4GfBf60xA73ZznmIyEaBHRWfCjMaR6DaASqSaETam
         E4bs3aEYBAPKEOmJ3r+chYmhTsJ3qjBalv4TQBn+4mfNTI9hNpsUB6wo87lkQ4Syot39
         +ldQmp8S7QsK6Ua1/liW/KPNEHXV9K9AASGRCC9PC29DRgJaXAreQxIv4znjZS51b1zO
         pdWlkg69NG80Qb4CI9gFCQSMKu4AFv6CJFwxlig0BJtGdKIrZeGKw5LAF2aicKMRjXqz
         e29cnV+3UFnUOnXHKnRY39U5y7truGnMQuTbkTxUfBcnIQxbAEE24r5xPmU1q3UK7SfY
         zTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181403; x=1718786203;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2uwFL7y38zzuOIY6yZzuRuyB/ucVnnJQUO1JVoJCq4=;
        b=Luo/RVv9+QSgm0GYQZTng23C7KDGRRanyrzAhibaZ7kPPHWrnQgeeUa33fN8Vd+W7j
         eaVjGkTz44jytLWX7AZIIdmSYgsh7YTsUb0xIji+Le4iGoNCLtZtqNbfy+VT8mcRbtZL
         lZhjV4DYjbXPN5P/cgd+nKgj/IOy3IVPhhO/SSlLBtaLTCw/NwiKlvt1Cu4bcGQeIfaQ
         gdcFfJYryhgAr+jJQxzw1JdoGCNVgcYnDpVGbWCxUXIlLS0ThNBmgafxG+vWPGDft7Wx
         Tt3yzMXy/ijI05XxxSCbqg0M2if0OV8NOL/ZtSHLZdlY2TVQlyO/i0+IlCaKSMU8pGVA
         a85A==
X-Gm-Message-State: AOJu0YwHXihJIvQVoEL0ouIuv0scMUQSH0FFvLuPOft3On+vXa8C/Gh8
	jJl2VY6CvsqQtqMFgGRAHl91gWbCCS4KJLgGJOtItFOqLDjWh3TOAalgxihfcbthQIJ5JxHUwEK
	HtLfVvgBIqw==
X-Google-Smtp-Source: AGHT+IFIUVbh5Q1k3pO2RFjm8lrFGgxO8nKpG5vXdnLpOD1v7TpsJ/omxJ/hn/IlNpFIU9wvgTbQ8u8NRFYnbQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:2d03:b0:dfe:6bd5:21f4 with SMTP
 id 3f1490d57ef6-dfe6bd52823mr340249276.0.1718181403279; Wed, 12 Jun 2024
 01:36:43 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:36:35 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240612083635.1253039-1-joychakr@google.com>
Subject: [PATCH] rtc: cmos: Fix return value of nvmem callbacks
From: Joy Chakraborty <joychakr@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Read/write callbacks registered with nvmem core expect 0 to be returned
on success and a negative value to be returned on failure.

cmos_nvram_read()/cmos_nvram_write() currently return the number of
bytes read or written, fix to return 0 on success and -EIO incase number
of bytes requested was not read or written.

Fixes: 8b5b7958fd1c ("rtc: cmos: use generic nvmem")
Cc: stable@vger.kernel.org
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/rtc/rtc-cmos.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 7d99cd2c37a0..35dca2accbb8 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -643,11 +643,10 @@ static int cmos_nvram_read(void *priv, unsigned int off, void *val,
 			   size_t count)
 {
 	unsigned char *buf = val;
-	int	retval;
 
 	off += NVRAM_OFFSET;
 	spin_lock_irq(&rtc_lock);
-	for (retval = 0; count; count--, off++, retval++) {
+	for (; count; count--, off++) {
 		if (off < 128)
 			*buf++ = CMOS_READ(off);
 		else if (can_bank2)
@@ -657,7 +656,7 @@ static int cmos_nvram_read(void *priv, unsigned int off, void *val,
 	}
 	spin_unlock_irq(&rtc_lock);
 
-	return retval;
+	return count ? -EIO : 0;
 }
 
 static int cmos_nvram_write(void *priv, unsigned int off, void *val,
@@ -665,7 +664,6 @@ static int cmos_nvram_write(void *priv, unsigned int off, void *val,
 {
 	struct cmos_rtc	*cmos = priv;
 	unsigned char	*buf = val;
-	int		retval;
 
 	/* NOTE:  on at least PCs and Ataris, the boot firmware uses a
 	 * checksum on part of the NVRAM data.  That's currently ignored
@@ -674,7 +672,7 @@ static int cmos_nvram_write(void *priv, unsigned int off, void *val,
 	 */
 	off += NVRAM_OFFSET;
 	spin_lock_irq(&rtc_lock);
-	for (retval = 0; count; count--, off++, retval++) {
+	for (; count; count--, off++) {
 		/* don't trash RTC registers */
 		if (off == cmos->day_alrm
 				|| off == cmos->mon_alrm
@@ -689,7 +687,7 @@ static int cmos_nvram_write(void *priv, unsigned int off, void *val,
 	}
 	spin_unlock_irq(&rtc_lock);
 
-	return retval;
+	return count ? -EIO : 0;
 }
 
 /*----------------------------------------------------------------*/
-- 
2.45.2.505.gda0bf45e8d-goog


