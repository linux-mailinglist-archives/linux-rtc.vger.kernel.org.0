Return-Path: <linux-rtc+bounces-5402-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F59C68EA3
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 11:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96F4D3627BF
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 10:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4EF34B1A8;
	Tue, 18 Nov 2025 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jaQy0gmv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBEE30F52B
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462945; cv=none; b=Rl8GI7UlSJQZFPvYDQZpJf1yz9lL2dNS/GPm3wBd8NMQekaJ4na9lNO5XD7rESYPaGp7m4yFB+/0yjnwjXHZtkAokK0wtGxNQ+iko6U6uFkS8Xo4+F195vF2Sczb5WsBn/ONjbHGBtS80C8xctecCLKUhl/wJRT2Q9QnlgTGIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462945; c=relaxed/simple;
	bh=pSacPUfTJqdVOpSE7Tqm0QbIDxP64e72/O29IF4V3js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GreTSM0tAmmV6dpe9la1IMHeV0qrhzCsslFl72cPzXDH5tx3hhjRK9KPaUobxDCKmRkV3KHye6JuH0lHRNVsy0fb40MnFYOsmMu8fCnkjjiXERjXCYmffBj536DX/+d7Yp3JUtKFT3WhMWEn/xbAtTlQR0AYCWfvYucPtGlh4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jaQy0gmv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32a5494dso3156810f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763462942; x=1764067742; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1y/mR0RQcwwMGAg4az+yXoD/LmwVs8/J1VOM/Bo49w=;
        b=jaQy0gmv3NmoT4NKJB7QoioFGGvfnAVGT81Oydr3i+Bem9ZQEabq3E9E2b68FynQYZ
         83q+GxfedYbMbLE3xGy+b+e47053OOIj3Kcm0jCekOLh+zVoUnRtQWGZZ3eaElUGWfBN
         /ea0MYfmgUz7+ckU/pwmWeFzWUEEuYxgkuT5AmvYRnnNnRu7N/KN/N4SZccu9pZfIdp7
         lsSsDUk3cF6sXQSEUbSwqRB9MMgl5Ve1TFrMWDeEBSTAIJeigHgpQuCMIy0DWC40lrB/
         M6t4UDBQZrYDVLS0I2Lxc43gg+y8RKdi3dv1EhY60iGSDCVnQYb+8HXse3scznZxiOxp
         nsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462942; x=1764067742;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1y/mR0RQcwwMGAg4az+yXoD/LmwVs8/J1VOM/Bo49w=;
        b=etil4xYlcmteDrw3vQ1nl2PPymwzVUhdcaJ0ejI/MiDaEKCl4yy/n0kG8OlGeT63ek
         ofCQAeF4kT9Vuyx3octl+L9RuHDYGSW08PL68IlyVdQrK6SzopjkPoAQawJsTniWILl4
         orMkvu2EFEwM3b/3lDDGGgsQOzUESsowbKe9kuP66r35vPRTsBT0kRv9gxrysT4H9rnk
         xHMUCX84Zw/b6p44+iQs6XYhJ30QCEMoPsWpPaIGFMd0ImQGd8zWfGj6cbbEzMdWr5C7
         CdNXTKUV2lF4KsQ9aKU9hO4EkpfgbrzFBunwDnZIfTesevbVDxXX+ygRDsRfTYmX8aTB
         fEdg==
X-Forwarded-Encrypted: i=1; AJvYcCWGf5VMxRY/G0R9P8nxCAX1CMizZNb/6UmPAguxzVT0G8XAG3CmQM75Tn8+hJoClz4NMaoFUZxScGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcKwUFR7d1IZMwvaNpQ841z2A5J9EJ8kUTU1LyV1IO5bXtFzrp
	IykqogxeNwN4EBiZxftFZPbqzAWS7u2+oXTPWpUtd/b08ru2raJKc1+Y56MZhUId+tU=
X-Gm-Gg: ASbGncsFqZPsqOTiZeHdhsQzWeCCJhyEaI9UdXKskQTvxeX5YeFrbE3mO19m0mRbJnY
	Hx+Jac0L2TquOKIuetiIKA4qkx0+VEuMCWVMR8IuH2rz2sqTAj5eVAY+0eBQRJZlGDJVRxlsSEO
	Hh/eAXDc8P/n4YmQZiTmlWT0JVh5qg7jV6XfhXI23J9rUC2ctkIb/XQBnKXUGj6GHcVptnwGhuG
	I+MGK4dsuZZOCuPJ95mkt3ZNYSOa5H07SiXVm0Ix3InshMG2IizweDICgM+AsJTTrTyMC+Ie0Pt
	54gHocQgha9GVF59vgZmmnovdR+PlbHuerJgf2fxKhj8i/w7ft4ezLvsN0OQe+uDXkK1NViyc6F
	/d4R2H7ZMo2zwwzkfrf2kapHfa8kJC0q8FGawz8Cz6moNMsBFCjR8IjjBRP8Y8wu57Crl9gip1G
	JIYKS/sg==
X-Google-Smtp-Source: AGHT+IE+uO9N9ifqs1Y8ygDQTWEad0nnwpu/28efWIWor11GJUehCS6HQAbsFian1eY23T6Y6M2COg==
X-Received: by 2002:a5d:5f42:0:b0:429:c711:22d8 with SMTP id ffacd0b85a97d-42b59339b7dmr15233727f8f.15.1763462941281;
        Tue, 18 Nov 2025 02:49:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e7ae16sm31647134f8f.3.2025.11.18.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:49:00 -0800 (PST)
Date: Tue, 18 Nov 2025 13:48:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: CL Wang <cl634@andestech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <aRxPGBEX8hbY6sjV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "atcrtc_dev->alarm_irq" variable is an unsigned int but it needs to
be signed for the error handling to work.  Use the "ret" variable
instead.

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-atcrtc100.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 51933ae1a2fa..9808fc2c5a49 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -296,10 +296,12 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to initialize RTC: unsupported hardware ID 0x%x\n",
 				     rtc_id);
 
-	atcrtc_dev->alarm_irq = platform_get_irq(pdev, 1);
-	if (atcrtc_dev->alarm_irq < 0)
-		return dev_err_probe(&pdev->dev, atcrtc_dev->alarm_irq,
+	ret = platform_get_irq(pdev, 1);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get IRQ for alarm\n");
+	atcrtc_dev->alarm_irq = ret;
+
 	ret = devm_request_irq(&pdev->dev,
 			       atcrtc_dev->alarm_irq,
 			       atcrtc_alarm_isr,
-- 
2.51.0


