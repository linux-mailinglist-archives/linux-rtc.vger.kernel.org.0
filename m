Return-Path: <linux-rtc+bounces-2856-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47253A07C00
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 16:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C58F7A5C93
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 15:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B35721CFE2;
	Thu,  9 Jan 2025 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sKKWUCzp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB121D593
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jan 2025 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436611; cv=none; b=IS6Dg27RAiYb1gWUvl64yIDoTpKCxEiQY1YvR7AYHEDN1CiEiA3JQNBvP5NKgPTwZljS9y2XS41K6wUPXN5gjYg2srF8zyLt+UfONIhyjzbDLw/n26rAx7A5293LGMruomuotx3PI6prkmGeDfENo2rhyAjiRw+yob6DY4o5f4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436611; c=relaxed/simple;
	bh=8DXsWpDVt7tmuo4MQdFq4zvSAYEr9Hi3ET8gNU0ixjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQGYH+imfJUqkMB9iqQrSxZUr7TPLd7dUlttX0Amimrqa/cdWUGJUvXkux0cBSAkBZ0ti6I76rBAnTE/IhoOoYQk75M3xPYYJXYGtpHYR74AZFzy0elRrzHZyoX0oL2ZC0KYHKqEIdGLRLRo7XuEbpRTUMOysoYrZqKX/6yekB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sKKWUCzp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso8660055e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jan 2025 07:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436605; x=1737041405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=sKKWUCzpFWff+YCZ+pfAT5i8VFEaXp+xzrOoc9iHv2PxgNAUeXu8/svBHqV1HsMHBz
         el83Vkf3QiPjwkZF0xroOU8BFA/3yuWbnWslC3Rqc/GlYOuSsWN2dUtr7TDRYSEM5KKd
         nxkJHQvK1xM2mBp9Z2o7FvLFZvAcAofn132kmzMvi8DUX5Bvu/vTIzz1mFE1s5dg6E+h
         jzMlsVYZY8lrZ7c1EDX6pM8ODJyG3rNUNGPwINwb8HCYqszE/HGpgOa4eE/cxlk4mLSM
         xmsVA7sm//wa7yRhOkb2HsOtFQESilyDybMcYXbDmMxnYQ07mIpS1qdLr8r5MZuhS+1j
         +dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436605; x=1737041405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=uDRh77+CuHfdxopvDl5GToQAQ4yMwFXv43HaTGDl+rA+qTm2AvKh2fcpZvFaKtld/S
         OVf5lnUk68mSBDTRbYHdCTxmrmL+xyFCF84hvKjQbVo9XzJaPxY0zV9bSexpBkWawUiy
         d+bwnWt7L8QhoFWoaOvp2ODG1Fw/Z0CRQSdQSUuF+T7huNL8YN3C4xNJRLtq7M6fizDO
         If8pYLfVC3KnDBqaxNM6q3xqXnQiq9/B7dcX+edX23kBlYzaiK1QF+RVSNK1TjBJ59t1
         6ZLGeb1BnehgOgcDQ96zIL+72p2TIYsNTXzk5qxq+6xrylCq5g5j5lVEp8UTIzJDPGas
         9FFw==
X-Forwarded-Encrypted: i=1; AJvYcCU+efR71JAbckccPLa6Oq0B97z3EYpf8ySPyPzd2NS08ZwHCYA7v2ekXpdfDvUqhhNBLJSqMrbOHzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+0/BnmqoYLj/ECCJ578py73x7e533X8aKtpBfxp5Oxqq6BKL
	/WiFTwmC/f1Ut4zyhvS8lLA+agU/R1rfc0u/0hTgACOyyTn3MIzPCACAyVwumqU=
X-Gm-Gg: ASbGncu9zVGviGMn9D80J2BIkVBg2DrR+P9xRDn8d4vWWd+vWT7geoLiZlNxQy/pM8J
	kpI25quSsN2xi7SF4JufintoScRBR+vhUDgdLiroqMSHjpspijYFbIRfiSr1GBCgnClG4vu7gfP
	W36Ayr1mILTGcKSK9Ytj+vNnYZ3QWK/Z+s1GG5LumnBIcB/jLNqPZwRJh7jFe0E+kfrMX0/euF1
	oE7xzzbq95eFL+i+jZwdKIHPWiLQY35lbWWjR/X1fMJc7YyM5NtlFlfsvs=
X-Google-Smtp-Source: AGHT+IFZu92+O1xFBM1o4OIIzCf4RxwxPT44klM4biAbIGEw2EXkTR7f4KbFlUulK4lpC9hB8MpfFA==
X-Received: by 2002:a05:600c:3b0c:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-436e26e51a0mr65752665e9.20.1736436604907;
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 16:29:52 +0100
Subject: [PATCH 2/2] rtc: mt6359: fix year issue
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8DXsWpDVt7tmuo4MQdFq4zvSAYEr9Hi3ET8gNU0ixjk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t6dswjfIEHCOw16BhoepRMqsP3UcnAyvPeeJTX
 +3PsW1qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/regAKCRArRkmdfjHURWq5D/
 4yF/Ns7bGrrNmICUNd3lSvbkchkjrbu8Lq6i1dTdPTLlcSHcgDb3j392v31EGvxWxyiunuUgQXlU+A
 G9jBBc9pdeoKUJo7fOCXYo4cwzmAD5PjxxpFNNVkAS4o6VY2aplaJ0adohCh30xx88Q+B4eBLqI/kh
 FKAKCTzXzK9RrXUg2MHPW70tcfjkJR1CFd5lOqaWfAUjSHWH4BLLd9/LCH9DF3IqLuujJnql/2zZyU
 UgmgJvX3kyRNiZlw8Q8YuqahHJ0oei9M37IcGZPQRwQ3KRo/APehxXJZTzEmGhgwVCikjYKlInBJsV
 ZrX779i4J+SlgOmQeg3ZzbW32/UceHOssj3w2x75lI5oYSvNEwZbvD5XaK7sKsSMSZzap6Oi7wl8ff
 bBiuF0rsBfnptgR4+SfW39cJ4yGyt6hHl5UYu7AvRQp9G1ESykM2aEut/lelQnowEX1qSt9tVD9q7j
 BriB+K4hDUMfG8qc90D7rC2xmBleraXwfk43ef6kAGFbbO2t4V+RgNc9liQqljtOWpSahYmFvXZMaP
 ypWxcobpydIIRi4tgRlllWAA7IC6ddljoKO7g7BADDv9rfhJMLIXkkQVdVFeZnbhIr3JsVMqkOeLEc
 qCPohlusM48uw+H1+KO4XmL5uRVAo28yfO0tPOntC9c6UPUjLzoLhfUH0pKg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
introduced a regression.

~# hwclock -r --verbose
hwclock from util-linux 2.37.4
System Time: 1262312013.143552
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
hwclock: select() to /dev/rtc0 to wait for clock tick timed out
...synchronization failed

Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.

Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 55e75712edd4..9930b6bdb6ca 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
+	/* HW register use 7 bits to store year data, minus
+	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
+	 * RTC_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+
 	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
 	tm->tm_mon--;
 	tm->tm_wday--;
@@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 	tm->tm_wday++;
 
@@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
 
 	return 0;
@@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	mutex_lock(&rtc->lock);

-- 
2.25.1


