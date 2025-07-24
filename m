Return-Path: <linux-rtc+bounces-4563-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8347B0FEA3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 04:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC0554743E
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 02:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82941917F0;
	Thu, 24 Jul 2025 02:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcHhnH6r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A812E36EC;
	Thu, 24 Jul 2025 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753322797; cv=none; b=ic9QOqp2GS0zjmxWm6OwArywrUtM0O4hMmWfdpgb/Ack+9PZOSwLjP0ZDlRs5Gs9ETvkeNDyk3wyLZlFC4HLB/Z4XnnXnVWiBaTzisO0esLwGgmYhzGU7sbSQvsgM/jTACukJzVcW7Fz9+TiyvHcTKg2eKTryk6Y7/KOQURzTzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753322797; c=relaxed/simple;
	bh=B3JGAcWo200HyVX5Q5xJvSLm4MPu/dGfKpQerivErQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LN6z3grcv8D6faod+Mv9E9vGd7VhDY+gqwTgBrBuVv9OSWWPUIySZ7YkGTGgv1f9VRPXfzxpwTF6nMqVFIHojeYV0f49EQo5m/HsfdBGe7PMv12fhDsjHJErWrT1dNMdJkwmKqTvkHIcVXysJ38vsZtDLEO78q8GFMH3vRXwe4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcHhnH6r; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ae73b0a891so9823681cf.1;
        Wed, 23 Jul 2025 19:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753322795; x=1753927595; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RxE9+77SrYGASJR1BdtrXrh/vedPtcPXI5TXA9DzLfI=;
        b=LcHhnH6rLU/Rvn0F6U62NXH9Qf6pY7z4MpLLgr+UHPA8UXEeBz0EWo+NPWw6ajsW1I
         +JmrxtrrVYXMxAb2nFOOnPFd5mu+M9anS2pXFjo8PsabYRW1npnTd4Oz8TRIXrNiWOkj
         ydox4lJ9hmLFRKLZwEapXGbCVgPyzChuI60Ku2jfnOCWVpNN6tVxGLxrr6Z4sPGj3V/j
         tcgXCrOhkpMnONgDOjAJXMjtV8a7+Vjqw/riC3PJfv9TJTMfSjDz2NZ22c+te9WBssU9
         4I6HQ1o0pyCuCJDXh3glUvl5NrBbsVKcKPk06AGyanCAwiQ6TPtjcsfvjIIEf2WvvVXc
         enFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753322795; x=1753927595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxE9+77SrYGASJR1BdtrXrh/vedPtcPXI5TXA9DzLfI=;
        b=TitU5Ru4Z4wwwMZJxqDg79maP7oVPXlZULCIkPf6he2xmIsj8nn8+NzouSI2voTVSG
         dUgP7zLLLVnSksmMbm9ekN3WfzNrKLR4GnW4NU9NkuLUEb1hkTwDuSj2NNZkuc2J5kSX
         uP7BUGxr/3CZAMn1SY7t2T7fjcHIzAy+VQFdp4gVpUnTSi2JJV+4ITJUUG5GJK7Eqe9u
         gMfNS+W1qZMaQsixAqfdEwrDmMYUxTH1UJTUOa9mIhugmZ/XMaqtj+YHFU3CIPtDS44L
         8CcJvf4fGKMh0QSvB2HQ0qIdST8sIdjqIFPpRNr4jxUaY0ekEctGGj6HDCm4+8aqOMzt
         jCPA==
X-Forwarded-Encrypted: i=1; AJvYcCUgjV9l1TEj7Pm6JgOpEHbnXI7e7YHSqado1Ao3g3tbVZb+Hmk33iEILDV0l1Hw6rDqyMpQBNl7rJL9BYo=@vger.kernel.org, AJvYcCWRlnTE/auZJyLJrxSCNnGaPB4Y72v6kd8fUwyww2yeCNE3TWrqKMPujYJ2HfSYi59XsFEFUcxKE/NO@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiGAD9Ol41je3/xcCx5pcvNS3wsNiyhxwxVdjyCYOAxFzGFV9
	ZWSkOXh95NQTyEgqVz0qVpOKv0Kc4SgYpGrRq+gyCwwENYTm9XV8zj9R1lrqdNIX
X-Gm-Gg: ASbGncvhfCOckyJpyRQ2r+6TG7heoD4kfxmd8nwLp5mXB7Brkx1eymhUNiwnqAVmR6b
	qBp9uJ8yVKj6lG0wSUhy+bfXaARZQvhkDRWwscglozQ4SRy89XyQuBgjdSkwswihQZu2ajHtlS5
	R7XjyGhl9jxt+6rSTFID/V9XO5WOwGt0CUfXcpB37IHBgFBhLt+rje8abJuJAO/bYogazr08x4D
	9D/Iu0tjdRTXe//cVBoRELY2h03ZqlLmXu34jI5npmWLTPj+5cqSjOI8ET3On9f76vtTnim+dgx
	STJaGx9SP5aKEkIgB2kwuY6SDjyLiikgk+HhdtOTnoBvttwJFBduPBXsgi64D1v6x6n/kyeS4kf
	GD7CvXi1YUw==
X-Google-Smtp-Source: AGHT+IE0cQxiz2TamryIIQ2/SiJBdhTuMo5sJTcxTkSDicqObOaxK2kHgRuBWmwr6WL7cV806yn3bA==
X-Received: by 2002:a05:622a:2b4c:b0:4ab:69e3:420f with SMTP id d75a77b69052e-4ae6dfcca29mr75492801cf.37.1753322795079;
        Wed, 23 Jul 2025 19:06:35 -0700 (PDT)
Received: from pc ([165.51.88.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e355ad6sm4253531cf.28.2025.07.23.19.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 19:06:34 -0700 (PDT)
Date: Thu, 24 Jul 2025 03:06:31 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] rtc: twl: Check return value of platform_get_irq()
Message-ID: <aIGVJ7UV1wzkQ2Bt@pc>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

platform_get_irq() may fail, so check its return value and propagate
the error in case of failure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/rtc/rtc-twl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index e6106e67e1f4..992b3e1347f2 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -224,8 +224,11 @@ static int twl_rtc_alarm_irq_enable(struct device *dev, unsigned enabled)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct twl_rtc *twl_rtc = dev_get_drvdata(dev);
-	int irq = platform_get_irq(pdev, 0);
-	int ret;
+	int irq, ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	if (enabled) {
 		ret = set_rtc_irq_bit(twl_rtc,
-- 
2.43.0


