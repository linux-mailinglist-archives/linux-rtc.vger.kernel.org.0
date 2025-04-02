Return-Path: <linux-rtc+bounces-3721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EBDA78CAC
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 12:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7171890667
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 10:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA19D23771E;
	Wed,  2 Apr 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p0IDCcNw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1C237193
	for <linux-rtc@vger.kernel.org>; Wed,  2 Apr 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591086; cv=none; b=R+UpCV76G9lkN9SjbcCLEJkrc9eLdAe866Z+QPL3Gy8Q9bZp0SbB5dzourV2rA4TcV0N7q87gcJJdRX6PWyS2rW4Uv1yiWnBZJHzVkbENDFrlABBWAXcPQdwFX1YeUGwuGl5bUlXB31Gd4H1LML4+MHOdTvwA6Bs1tDI6dFe/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591086; c=relaxed/simple;
	bh=UlOHaAsiVzggi6F3jr2SNdC4VdtkMhUHdURJ6+cg8Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPftNbz/oZhdRPGRO0eFn6NLcN21kf1CKrN5+gAHKs0Wqg5JkDjmcPfMfpG8NUPXx1OtH7JBVr2o33J0535NNh8ydg9HbOq3jEsNAnqBLvKg1+zcABVC2EO/kamxUclw1HZ79J8TldoxcEez5N2H96tsww3TjADodGBTj8qsPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p0IDCcNw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5647453f8f.2
        for <linux-rtc@vger.kernel.org>; Wed, 02 Apr 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591083; x=1744195883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=p0IDCcNwtOxC9LcVVs7OPu/1mUGdYZ7WkXERa/QV6ThExhVI2VFDXJAHqYQUM23j33
         Ty+36KO3GKZ6FZzrimSkozsKIzuG5iqPCv5iTAFM6wISYfSWLXHl3P8gQLKThX+Chi4s
         MCNaOC5i4EieHHuRNml8cvWZl1Hw4L0ZLUNwbD1/uGSWPYAeKo7wOGi2VjBlG7IlVdAo
         edwXpCESN+nW46rddXOX+y4m4rxdFnkXaDrYo50qfbUlWdPlNVsTA9EQvibkjOpXIarZ
         oyFEvDHrP+L4ZuR/dyJOg07vSYfqE/vv95/Xr0y+Eir1YufLXVfOV1lon9wpB29fLjwj
         8F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591083; x=1744195883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=MjYm7wKP32OyJab8kdO/bcchYOV3+g/vAcIy3NPdI5jdoHwiIgWn6yMO5dEUThu/aE
         zBsfw68Nw7AJCa86LzNaphZ9dvBSTDyKfU1duJMUofk/tRs91lPQBSBKj60yNPNRpIbv
         28N+25vzWO1HXXVMPQSy/2cBOhHnbwkQiy+OQDyMq6o5ROOIkqn/DgFw4XBJOGLw0tOh
         7Ps/IeAYIGPEE/I3Avm+P2H+fxzqSAPlG4eHGYdUIdQkFQKK6nUkAdYU39KAsVKUWxR7
         se0tcifhkwm7CRX6f6p0LiUVihQLqCi1dffYY2jaOvDtF5Lpf5uPcJWNKYu7wq4i8gxT
         120Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBtwW8uCu7Is+fGtcqgcquUO01u7d2OISe/VOSTfZ/K41YHBVNN8ccEkS0j8i/IPmCH15U5JOEsEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkyfk8+zcdMfBtXoKDYjKh1UPG+2x0KeoI1xhu0qsqEHRHFcqY
	a0X2wh9eQ5rhImBPxwRXuIU0D90KM5ryB8lclEyLNxHS+honBh7mqXnNir14j90KKhZd+sF3fG7
	V+XE=
X-Gm-Gg: ASbGncsF9eRGnKQ4ksPNd6ridrPTeJza/WUM4TZeIjJLo9UdUUrLWLJtmBTGoryo1Xi
	VUSgdIKxoX8PtAsET7YGpN0Xn/fSMrB5P0heJkWuGJAS602avAKxZ02TN7LYVd3BXJAKWrWcV2k
	c16wzSWBq0dTfAJn5IzP2AFdcxEKQaZHMpVqialzRywUf3tZcFIxq7qSqZKFAa+NIrNjrFJx7o0
	6aF1Xl5jXuwp/6io5Id1EC6a+yeM1SpKt6wrejH1CulpHJsWMqI6dxJeweomsfDWgMGsSDICi4d
	3tG4FvMxpFHiMv1losBG6X5NB8EHFT44Rt/vIcMh8jZZK+qw
X-Google-Smtp-Source: AGHT+IHOeyatznfz5QQNNvi0Wvd10HZ133vP0ZyLTaBfjufR3sET+MdtTaPLpYSIiYEYd4aCYgoPOw==
X-Received: by 2002:a05:6000:2913:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39c1211fed8mr12507155f8f.55.1743591082782;
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:51:00 +0200
Subject: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UlOHaAsiVzggi6F3jr2SNdC4VdtkMhUHdURJ6+cg8Ac=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak9MG2ZQ9wzFG+COaaFPM1OY7zFQL8XoFY8klb
 RxD+gCmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHURdTBD/
 9kUNtbI+e7So11TmUK3hsKh9djqbup6vkAx8Pq68W4fj/BeAMNMd7T9IP5jFDOwwx4PykLAxN6JV6k
 WDxPv/TQp27p8s4T3Bt+Ofre6hh+YAC1yYvJeNx+8cY5xGEQlSj7eIU5yOYz//M83I6OKVJXNPM+He
 AC/z0hj9Gx6AT3DGH3xCNHZKLPY97mqcg7cOxK24/ZszybgGmHBxG7HID+XO+QonhUBRRt9OeSmz31
 CZuMipCh20FBQcLYz3n+JFMEQMbaCOkWXSaiBtziSjBXM9CV7l2KKSkkGL26T8RE77rMh+bf+VCcI8
 SVoEB8xItBDQK1HJmd8DwjjK+UqV9EK0VLm1uwtDOH+IWZmzYXKcXexfPLHc9oHcjLxebstsfM7etp
 qS9Byx0psLWQbS2cgGDhD3EaTF074h5uHg4CyTA24CYE7E5AfxeaPB1eLgyeVsXTZf+DuJPEzowVw9
 cZj4Y0zmqEPte46Vbq+2ELMEDZYpDL4yNSVHVYJjoMB9nPvdCPfKIUFxTiDQmR0tl8z6NyZq3Ozz4d
 m8EV1ehPtjgAPlX4gwTN0RolroIOhAFs9mfYsYxzPO3kYn4kMZTSX6HwJIlQXrsz/0Rjm5zppB0a1q
 +701CD3lM+r7hRswQPjXMMpuzB7mmerc7tQgEGAiydtikIs0A46CFJ9mgv5g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
despite reading correctly through sysfs. There is high chance for other
platform to be impacted by the year offset handling issue.

The hardware RTC registers store years relative to 1968, but the driver
wasn't consistently applying the offset when converting between
hardware and Linux time representation.

This inconsistency caused alarm rollover failures during device
registration, with the error "alarm rollover not handled -22" in the
logs, causing hwclock commands to fail.

The ioctl interface used by the hwclock command requires proper time
range validation that wasn't happening with the inconsistent year
offsets.

Fixes the issue by applying the year offset in all operations:
   - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
   - Subtracting the same offset when writing to hardware
   - Using the same logic for both regular time and alarm operations

With these changes, the hwclock command works correctly and time
values are consistently handled across all interfaces.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..ba52e225dc8fa 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_mday = data[RTC_OFFSET_DOM];
 	tm->tm_wday = data[RTC_OFFSET_DOW];
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR];
+	/* The RTC registers store years since 1968 (hardware's base year) */
+	tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
 exit:
@@ -119,7 +120,8 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	data[RTC_OFFSET_DOM] = tm->tm_mday;
 	data[RTC_OFFSET_DOW] = tm->tm_wday;
 	data[RTC_OFFSET_MTH] = tm->tm_mon;
-	data[RTC_OFFSET_YEAR] = tm->tm_year;
+	/* Convert from tm_year (years since 1900) to RTC register format (years since 1968) */
+	data[RTC_OFFSET_YEAR] = tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	mutex_lock(&rtc->lock);
 	ret = regmap_bulk_write(rtc->regmap, rtc->addr_base + RTC_TC_SEC,
@@ -165,8 +167,8 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
 	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
-
+	/* Apply the same offset conversion for alarm read */
+	tm->tm_year = (data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK) + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 	tm->tm_mon--;
 
 	return 0;
@@ -200,8 +202,9 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 				(tm->tm_mday & RTC_AL_DOM_MASK));
 	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
 				(tm->tm_mon & RTC_AL_MTH_MASK));
+	/* Convert alarm year using the same offset as in read/write time */
 	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
-				(tm->tm_year & RTC_AL_YEA_MASK));
+				((tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR)) & RTC_AL_YEA_MASK));
 
 	if (alm->enabled) {
 		ret = regmap_bulk_write(rtc->regmap,

-- 
2.25.1


