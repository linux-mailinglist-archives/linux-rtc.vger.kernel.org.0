Return-Path: <linux-rtc+bounces-5667-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2599CFE5D7
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 15:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C61E30010F4
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 14:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E2C345CBE;
	Wed,  7 Jan 2026 14:38:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10263451C8
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796682; cv=none; b=hUm1pgciWywfXKmszaCYR+nzbZGw5n9uLUwGW1sn//ykx6uYhOvo9peNcJnom3rFQU/3qquClkl8khPuJ7dDJLN42PhVZchgTGjE/OihcrSEqHf74LE2X2kj1Y/8NFOxIIaA1D0GHFhESq+AIHgQRbUX1JywU3rRA3KRO3h5/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796682; c=relaxed/simple;
	bh=zmsFrayL7ZZHlVzl4S4vDU7yjx+LS7rqU/CY37CW4S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9v1miJ1SaX+bxvkEpO5Na08t1fzvEzbUClOiYkxNyicS/s5VNDAkdbvjg4yZx9dc4J/DdIWyvdWeLK4aN1LdIETlTL7bPexNlvJc0vDIjge3JUajXBDPJ6cpISAHuCTrrLBlvjwq5hwai2pji9n5xp8AOn26cYutHI2tt0tScw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f216280242so334021b3a.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 06:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796680; x=1768401480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2fPmuvoQkKsFKiWzuM4y1JDJhr/vxEX8PqBsrDu8xY=;
        b=n2DmP7gwoZjbkpYJIv57D3zHFxSL3Fvu44EwpqDIC1QY7pwaHhIFBZTmVS99XPnikr
         7tnNZn33JtRLq0vhMoC3z0zhFn3xA11cflISXUtF0+Oy6c2l9dYd88YTKITlp8dbm6XS
         ADYeBX2VyeHFL6/LIwmLlNKoSZ/h+DXkkx13YRkVMflcwZ9I9jhAmefFt4v9SrTnpWk1
         4JjAYL6CGRCVZZ4tByeODXi+Pjm50ncbhOuipMk37cH9VyT/obvbCrpTIOXv4Khg9hdb
         78z4K+ZHYRS6tR3RYEMXQRab+BCav6niyxmqU4UJywsyF2bRCSMDzjpLa7A+tWXgSYfB
         deXg==
X-Gm-Message-State: AOJu0YygmlVfIZJbuV3T3hUOGHJYE6+wseBWnh6o8cvoT6DWzVvtfc5/
	xPXu0e+PI20LdoP0aNDwiz667SVzOeYYgfu4XcldF3tGrg1SiHORe7XR
X-Gm-Gg: AY/fxX7rZbeinw14RWoxJ0iF6fbTGe/kQXBMU/Mt4nxIaw4rlHbYKWGyIBOtUT4cTYd
	WDJCShJBhFn00ettbpsDkQZ8O+JVRD49mEfFzDSRxPoU1bBNWPV63neXqbNaVzw39UI7LaLh82S
	eAuSEgZp8USOAqaaOBW9avCEovrcrpFN56qVM2FG1nuKLepgj+cmWH5FDuOi1hDUOFr96NQU9Ec
	O4V2+pxyOS0wcuJG/qOMRD/aQYYCK9HvmImvk9OiGK/SiYe2rha6Q5Wd16OE4bB3iRT0vFr3YFo
	sDHR6mQTgZwQK7onaLj/YLb1PRE7XWwTQAafTHXWg+PINdhgXURYX5oMEBhqD+zj4RwbhllAHAE
	y9Mk0+aYie5BneuWS1FsoqVZQatBeU6+bm63so5YLj5a9CYzFFaFW0lf6yXwFq3VvoPkY+tMAWq
	mjuWMBA60CDjHbUUqenSaA
X-Google-Smtp-Source: AGHT+IFRmBPhuqfCN8ms3Z1lFF0p3RnIQUHHkoERvq0m076/qo2DEO0rq3YKLLN+awFfTeF7ONqOrg==
X-Received: by 2002:a05:6a20:72a1:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-3898ead8f25mr2550091637.27.1767796679983;
        Wed, 07 Jan 2026 06:37:59 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:37:59 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Date: Wed,  7 Jan 2026 22:37:33 +0800
Message-ID: <20260107143738.3021892-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107143738.3021892-1-sunke@kylinos.cn>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify RTC driver interface by storing driver data on the RTC device
instead of the parent device. Update RTC ops callbacks to pass the RTC
device itself rather than its parent. This change enables better
support for Rust RTC drivers that store data on the RTC device.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/dev.c       |  4 ++--
 drivers/rtc/interface.c | 18 +++++++++---------
 drivers/rtc/rtc-pl031.c |  9 ++-------
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index baf1a8ca8b2b1..0f62ba9342e3e 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
 		}
 		default:
 			if (rtc->ops->param_get)
-				err = rtc->ops->param_get(rtc->dev.parent, &param);
+				err = rtc->ops->param_get(&rtc->dev, &param);
 			else
 				err = -EINVAL;
 		}
@@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
 
 		default:
 			if (rtc->ops->param_set)
-				err = rtc->ops->param_set(rtc->dev.parent, &param);
+				err = rtc->ops->param_set(&rtc->dev, &param);
 			else
 				err = -EINVAL;
 		}
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index b8b298efd9a9c..783a3ec3bb93d 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
 		err = -EINVAL;
 	} else {
 		memset(tm, 0, sizeof(struct rtc_time));
-		err = rtc->ops->read_time(rtc->dev.parent, tm);
+		err = rtc->ops->read_time(&rtc->dev, tm);
 		if (err < 0) {
 			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
 				err);
@@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	if (!rtc->ops)
 		err = -ENODEV;
 	else if (rtc->ops->set_time)
-		err = rtc->ops->set_time(rtc->dev.parent, tm);
+		err = rtc->ops->set_time(&rtc->dev, tm);
 	else
 		err = -EINVAL;
 
@@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_wday = -1;
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
-		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->read_alarm(&rtc->dev, alarm);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
@@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		err = -EINVAL;
 	else
-		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->set_alarm(&rtc->dev, alarm);
 
 	/*
 	 * Check for potential race described above. If the waiting for next
@@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		err = -EINVAL;
 	else
-		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
+		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
 
 	mutex_unlock(&rtc->ops_lock);
 
@@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
 		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
-			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
 		if (err)
 			goto out;
 	} else {
@@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
 	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		return;
 
-	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
+	rtc->ops->alarm_irq_enable(&rtc->dev, false);
 	trace_rtc_alarm_irq_enable(0, 0);
 }
 
@@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->read_offset(&rtc->dev, offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_read_offset(*offset, ret);
@@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->set_offset(&rtc->dev, offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_set_offset(offset, ret);
diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index eab39dfa4e5fe..a605034d44cb7 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 static void pl031_remove(struct amba_device *adev)
 {
-	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
-
-	if (adev->irq[0])
-		free_irq(adev->irq[0], ldata);
 	amba_release_regions(adev);
 }
 
@@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out;
 	}
 
-	amba_set_drvdata(adev, ldata);
-
 	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
 	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
 
@@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 		ret = PTR_ERR(ldata->rtc);
 		goto out;
 	}
+	dev_set_drvdata(&ldata->rtc->dev, ldata);
 
 	if (!adev->irq[0])
 		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
@@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out;
 
 	if (adev->irq[0]) {
-		ret = request_irq(adev->irq[0], pl031_interrupt,
+		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
 				  vendor->irqflags, "rtc-pl031", ldata);
 		if (ret)
 			goto out;
-- 
2.43.0


