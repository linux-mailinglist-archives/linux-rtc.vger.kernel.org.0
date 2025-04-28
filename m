Return-Path: <linux-rtc+bounces-4007-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E7A9ED92
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1DF23B2FCF
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D6125FA3B;
	Mon, 28 Apr 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F3Xsy3JA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FA25F793
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834833; cv=none; b=mkLz8Nyk+agBG8WpWmIf4W3XtGUEV1oxYhstfzRdJ5Xw1JuAyLgViwxdjBvPbyMROOuHhREllyleIEzM8ZU1M3OhkI8wIGOzfCZnKks2/1EOB1KJFB/PkzcjgAuQzqiMhM+WIAFsFDXoWJ3ik8DRn7DqkDJRtOIhCySkptusWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834833; c=relaxed/simple;
	bh=kCR/f/rjPnwUXRQOW/h63GEtmBoqR51fZF3et6OR15I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BICNk4zy/xvTnSOC5I4RsdbSh4Z+YSLRcYte0P64FsQAnpCiMUEei0Wd2WptEXCZFWd/5ZbxPH+PKF5KpcS/jLBLGdazxp9RMmzus7n/11yzQYvjni5KAjfwG/t/nc2dCEq+3GZLv7mXtJZOKH7bcX5NAJIo9vht3YnU8LBHzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F3Xsy3JA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5440493f8f.0
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834828; x=1746439628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPm9JKBRkOxrlAiqDIHgvy9NYYBLQuJeIj/qvWByjM4=;
        b=F3Xsy3JAHFDE/9M6QsFovqkHVdl+xwj5fTWuhbMkYwZl58T2rKiELPp1ADezrcI+Ip
         W9y7RXmq0VBQiTY64sNChR071wO3ZFPiEN9Jp34o4OLb1ZF52DALNvfFVJPdwVcy+GjR
         FkphHlAyJ/Om1ox3VY39VCgmB6D/o4dw3faAQUgp+kOn7Z/f7jLrJpOhIqDcDkmxUC7e
         Wv0ntDufcHj0AGkoCLb5odooIyeHVeaKd/tMNckGEroUvabaPnvD+VrDM4VAn2AX01qh
         G2sUsyflGB2FyOTfM+iIlB5BRSuV65zXtldtPdTgSqNnwkCVj29R4RrzWqYbcb4kbGlC
         GKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834828; x=1746439628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPm9JKBRkOxrlAiqDIHgvy9NYYBLQuJeIj/qvWByjM4=;
        b=LDhpAhg5foFbEXkUdAYmYjA6TfU0ZtvDqfXqWVdnbsI9bKpHUTyxZu2GtzaDFdDWX6
         63mpdNky8qsVFeCGH0I73ASzKJrz+6RxXdngmy6qxtIIHPC6OKh9S91QDd45n66eUHIu
         3gNI9WUbP2uiH5p6rNxM/LiJjyb1nPHkOANDOqC+LQI2gbUvKthDZU3eWtF/S08LJypb
         bx8ceBP+fIdTYlgfwtvUaocrtrfVkHjkRlxVR6+v7s/zGdvMySqxu7hi4m1wZwI+Nhiw
         9fDGgsemZHeldvEHj1Jm+bZ81rKV+aDlNibPRThdkUIRczkaOhERO0c1gR430CkxbLip
         ZY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVp4CZn67YI5hIXiU6rU3T4bZnYjitRf0FGwVt6AK5E46u1lePYaCu1EnVx1owx/rOUbQV6Cwo4LjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TtsvJCqI8aC1O+MyOhlrkMOcXzmJQQ1bf0oCHz64kbupvvZI
	96A9r9+OXMVxbt4PquvwBQMgzTyu4JE5MZl9x4CyI7Ht2VQ+SnCS6jqoC1ZOofs=
X-Gm-Gg: ASbGnctnDBBhbyvQV7NhgW+3hIsuuEm9Suaoh5AdbxesG2teXlhlvTaVixaL4wjkuPP
	kTtpp3Yb8H+US1uMl8Rn4vpN3Qkj/GG+7YEBxKJWhyB6j58do0es3U5BNZbHxjBG6I7WOT2JPr/
	gbt1DxRN7Y6Jdd6UTd+rtoWrJ8jOtK0BmXUvk9yQtjiofvWWvYLBIP8Aw7VEfm/mU/xfqp7K8ef
	PTFFk00DBqzlHWHp72kMHmOpYU2YoDEgdrS8njYbnAK02xSO/2wmYOoSPOeb1D5DOY3Vml/rxPZ
	PMWfPkBW3KIe00JK2SbNyz1XClP6RaDRaxTpGN/jV/KaEB1LV8sJH9oQrhyEULdmgI3jFpUoVXi
	STrPx
X-Google-Smtp-Source: AGHT+IHZP8kaNVF7TSsO8U5BUc7+b5K2q/Hkk8BjGxZa1xV+z2eXuos6kDphq92/vDTZ6jNhOU/krw==
X-Received: by 2002:a05:6000:40ce:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-3a074e37a25mr9383171f8f.31.1745834828511;
        Mon, 28 Apr 2025 03:07:08 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 12:06:48 +0200
Subject: [PATCH v4 2/5] rtc: Fix offset calculation for .start_secs < 0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kCR/f/rjPnwUXRQOW/h63GEtmBoqR51fZF3et6OR15I=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJ4dKIwfT8PC10ae4KNPiR9XhLCOKtZ8Q65cCS
 Hq7l0BCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURTPID/
 9smRKUXUNm4htKO++yqvQ8esFin2+J/JciDzLEgSBnf6whPb5fXA6a1FYvw8YpgRf+UaL169HAgwfz
 jxJaUq2Skp7+/4jjQJ3bo5rPYHZ8f4OJKUDswZkkFi8GZn2cD6vF4J1NQhvAA3M22AAOA8aqfTt6Rm
 L4Oqvfj7wvpi8K+VmtUwlGHWVVskDdkmrc1JcXP4XEgJfFMDWXY+3rztTtQVJ4y4gZTPtht9xaHzt0
 jLcyVWXddxKzTwx2vvsFAsAbg/1TlGbPDoq1uiU8rHV+BKyyLmf0xMfMVTlKEokcIvtWb31Anr3A9+
 Rejuu3pPoySXCPOBGzD5Mu9HCuuEK0vLTNmVGzpE7xfMCuaecrLu1sS7Izjr8KHdeTM3dIdks6daDg
 rVh+vGxTesh3iafop+g8rwlJP4ymeLRlHe3zhiYuZIXwEPlF0hSSyN3NcRerMAPf/ozl1fL9jShgCX
 iHAlU1a6tWAya7slhYZzfDKSC1eMCs26DQmlvh5vRYwtrBtaMD/krOmYYSt5kxZaK8VpFds9snTjqt
 Xk/G64Zgii4yF/x9HiERakufKwcprRw8x3GvzQLzxp54LfvTP6KokDcKA+A9YdMDpKSuqalJCtp9N9
 uJ2pgvjf6byJeBK5vYL2kEMSy5szeK54qZ3Dj0VoPomM9JPFakaMBO++133Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The comparison

        rtc->start_secs > rtc->range_max

has a signed left-hand side and an unsigned right-hand side.
So the comparison might become true for negative start_secs which is
interpreted as a (possibly very large) positive value.

As a negative value can never be bigger than an unsigned value
the correct representation of the (mathematical) comparison

        rtc->start_secs > rtc->range_max

in C is:

        rtc->start_secs >= 0 && rtc->start_secs > rtc->range_max

Use that to fix the offset calculation currently used in the
rtc-mt6397 driver.

Fixes: 989515647e783 ("rtc: Add one offset seconds to expand RTC range")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e9545afac745a621d4ccbcd5fca28..a0afdeaac270f026734be8785e8ed7e1272b2348 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 *
 	 * Otherwise the offset seconds should be 0.
 	 */
-	if (rtc->start_secs > rtc->range_max ||
+	if ((rtc->start_secs >= 0 && rtc->start_secs > rtc->range_max) ||
 	    rtc->start_secs + range_secs - 1 < rtc->range_min)
 		rtc->offset_secs = rtc->start_secs - rtc->range_min;
 	else if (rtc->start_secs > rtc->range_min)

-- 
2.25.1


