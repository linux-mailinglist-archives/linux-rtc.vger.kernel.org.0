Return-Path: <linux-rtc+bounces-4008-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A1A9ED8C
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E4C171465
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FD2261565;
	Mon, 28 Apr 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iVkPT6Td"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5B25EFBD
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834833; cv=none; b=FLSAFgq9Y0gGDlbNHCK2pnHR+qKoPnihz9uI5hamiqBtVEgblfLiV/XMs0KQoMNUWJG8mb4IG8AzDROPBk75QAhnACOlrCMIc1gKygYaW/3ihMDqHeOh0v70J9US0bi0ckj2TliKxTsFXSmNaM0X8YDPTAreHsrQMOz5C5n3iqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834833; c=relaxed/simple;
	bh=YRE1k1adoOCNyd6S0WHYWILGjmtkWL6YcPiVGQgrvZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs0t3lkKM0ebFxmIt2oBWQIrez9iCTbG1Cr/sjKfFFUosxzKHIq0HVOIhdQ76b4KKefWWn9ZzpYBCtF4CuYGgmG2olsb/Q8ZewXj/9qayobtId6VDXn+N2InURUe2g0nTZRv1qWvbfJtDIR+jmCcgBub6EG7SL2myKI/FPGAzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iVkPT6Td; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3312064f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834828; x=1746439628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCKZsecEX6Ld2qZsGyGZSuc7vOgiiSySXxmlfVWnYVQ=;
        b=iVkPT6Td5PRbKwDPTVYJi9dw0Gc10SSNeoWivzjaJL29Uz49eG3aGP9pOhPnKGrlyz
         +yf1cDir7/4nAlwGZhkXjH5FwjvyWlm9HZ/jlhqB4r0WULzqz32N3DfPOe0WL1W/Ef7a
         FTWFe07Nx6VQvONLDyVyhCbNWYzTT0ees0nfezi5Hyj4n/QdDu+k3vXZyRILwQvtKdNS
         6k9eaQsr5xPfUH+UIOtxwriRlA3/IttLxo90vhVuJI2RMfahQnx8AXY0/C9xZkvvtbnH
         GWEdgKAL42WWrKFrDLmimkUKkImuKuG+3cs6l8Gki1r7GZf3aQ5uUiQErTl0dZjZcPsY
         0Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834828; x=1746439628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCKZsecEX6Ld2qZsGyGZSuc7vOgiiSySXxmlfVWnYVQ=;
        b=ao9Wsmm2f67C/VIrA132yzpL7QIkrpS86AOIBMHlEuBlQ5eabOxU/vdcbNfhUC6iRt
         Bgzkk4Ff0Zc1NUtujUz+pqYBjWJfXX2iqx/3SUzsy6dS3sIjuJNO+qDBO/DTCf/oc9R4
         XKcSHMmIXaHx54Bn+6XpQOgDqjRGbRqud5Fl8WOI7V5bl5o8iGKga3tK2EvFeNbx6eIB
         aPkYdoUGBwFcVFrRRC4bHnGZkfTme4jx6JwzatQnmtTsfLxlDZYCeiEr4n/3wd6kvZFc
         UFWWiYEi/3cHpUOobr9a9HJT0tnQj0R5cDT2jnjZP2mgPWkUtbyn8ceEABCvaYodZxoh
         fOQA==
X-Forwarded-Encrypted: i=1; AJvYcCXco6OQxYnCvDzTO6iHmRIdvXDnI5vWg5kj1xZvf6DLcxGDjQr1ujkfSZoAiKp+4YYE6fg+bUyVcLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6DWAWhafVZiN/ebNgyaL9katBgk0kZh1xaolT7B6Tl7xNVQ/
	KHxdNlgfMvDWeTivrhe93UqpCglZGZ46hoYuOjVlg7Sj9nu3h+HE5HxG+yqg368=
X-Gm-Gg: ASbGncv5eDfUGfRwQm0AdFYSGYTbmZrr2VEFpHXR78A7vOVAgwSF/mYBYw9wxSyPucW
	+CW4/sbcQ3pxYldHX9z/o+zHWab3Le7CHnZF7eVdffSS274RGoWyW7ebifisM0Xcb+Wl37Ui9YP
	jAC5FGhcmq6g89cYV3BSZtVCkiwwzM6OoaZ4D4YweSglHd4CJhQz/sU0L3RSY3lcgdTt6t+iojt
	vUNfXtAOp3gEqURSTdKWFh98s+kjxqFi0WUYuPORQ/yVn1lYoxkLH6yDPutU1o4m8g/GGo2ypiu
	XT42ILU8pput+1BJ33u2XY7jNWmxoraSmKIwlcU3VqB8n6MIuLXoJd5Mu6HzyneLJVlQtTRn2YX
	sR0ao
X-Google-Smtp-Source: AGHT+IExS4NUA31fzSOzXsYxBs7XcMFI7Fz4FM0MrAeJpEq6AepdH4YfqTLeZCcONOMt1wdwq62FtA==
X-Received: by 2002:a5d:5f44:0:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-3a07aa7594amr5828489f8f.28.1745834827701;
        Mon, 28 Apr 2025 03:07:07 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 12:06:47 +0200
Subject: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YRE1k1adoOCNyd6S0WHYWILGjmtkWL6YcPiVGQgrvZE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJnK4sd1o97pVIQoyWmnc8KDC1fQcBvfY289Cj
 q2Wr/GaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURQngEA
 CRuk8bNa84SlGxUONMkt8pA0Ql57oaN3Jd7x4XxbAG+Mgk78AoJsR4P7n7ehv2x0/rxAXOS2p1+ero
 El+TVKvnM69JM7FPZQqWTIx4VoY2N0SA4/CyNWIWNYny8VG/uti5Xom1grolZdipBSQkqJOhrpB7Gd
 bxpx+nEXe+NZqONwPZNxIWLzuTE707HZWe17zKxHkYJWRFKa9TxsYy9LJZNCNSR97uC9OUfjRMOJG3
 KICwvWKTBxxHQIW6OFJUADjovqPNpUj0NYiaywMPTVquBEhHYQe7mtW5TjjhbRJcv+ZzlG8lfC7z1N
 uGWmiFI6EQ4ZCPY7AGk2Uk9vObjlLrkVe4mYrn0EFlHkbBFqXlurxlxqJrVojJVfleWxAn6qSl/Lvw
 1k1odtDBgJO1r4snygC8Q+QdRfME9BVCXxNujRcc9OFLgAPwl9pTQbOVs3CwTodsnQamw+q+zkuKKe
 XL+j5v9WNzXiTRF8N484k+y9VdRMdEGsVuv5CvSvt668HfQN33Pqv1ClrRj2ginUVuHKa4pJ4L/xpB
 Cq+j60n6bbiwrFfP6i/O0AjYgYv8vR57ES0lDr1yPRSBvJ60PJdrQICuEOuzjGB2mxQXcamK/ciCOu
 n9CtSHgGf9WuxbBWE4C/e8Vo8IWlTKI/v6JipCCP8EL41qducKPHz8DMDHDA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Conversion of dates before 1970 is still relevant today because these
dates are reused on some hardwares to store dates bigger than the
maximal date that is representable in the device's native format.
This prominently and very soon affects the hardware covered by the
rtc-mt6397 driver that can only natively store dates in the interval
1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
to such a device, rtc_time64_to_tm() must do the right thing for
time=-2208988800.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a3f8cb116c78b5aeea74eb90080b5..13b5b1f2046510d1a552473c441b89e23faa6793 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
  * rtc_time64_to_tm - converts time64_t to rtc_time.
  *
  * @time:	The number of seconds since 01-01-1970 00:00:00.
- *		(Must be positive.)
+ *		Works for values since at least 1900
  * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	unsigned int secs;
-	int days;
+	int days, secs;
 
 	u64 u64tmp;
 	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
 		day_of_year, month, day;
 	bool is_Jan_or_Feb, is_leap_year;
 
-	/* time must be positive */
+	/*
+	 * Get days and seconds while preserving the sign to
+	 * handle negative time values (dates before 1970-01-01)
+	 */
 	days = div_s64_rem(time, 86400, &secs);
 
+	/*
+	 * We need 0 <= secs < 86400 which isn't given for negative
+	 * values of time. Fixup accordingly.
+	 */
+	if (secs < 0) {
+		days -= 1;
+		secs += 86400;
+	}
+
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
+	/* Ensure tm_wday is always positive */
+	if (tm->tm_wday < 0)
+		tm->tm_wday += 7;
 
 	/*
 	 * The following algorithm is, basically, Proposition 6.3 of Neri
@@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= ((u32) days) + 719468;
+	udays		= days + 719468;
 
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;

-- 
2.25.1


