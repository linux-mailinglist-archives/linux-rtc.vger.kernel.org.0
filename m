Return-Path: <linux-rtc+bounces-4245-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD7AD2ECB
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 09:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827F81715F6
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 07:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40C627FB1F;
	Tue, 10 Jun 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gsnvm7Qw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2927F16A
	for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540929; cv=none; b=UwfUCFQW8sRKZ0CqqwNP8QegmROsXbq1Hye6KVYMgQHjOsymbGFbh4fv11UM9R99+uxitoszct3wGII/4cIoAWYoFCPUULB5PvCalurGe3qOYcrFcmUwg5A/WsywIY4z1pWw5jLKeIV/q3/k4N8vgXfy1OhnT/mLWhy/heiXLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540929; c=relaxed/simple;
	bh=HWWnALkCBoic0+IbEVAHz7cqr0kTZpuHvWyHIiqQ+EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dajPjzuTbNx7xGULqMNHL9KpIVHpdp+AeBnxx2M8dSlVAmpyOwzk+PeUaCLyPo22kFPzU5L7HOCCaNp2Iz7whirqacuEoD78xm3Xpl5xBbVCZkk882KOLyC2J/RH76SDw7Rl1W5zm35S3c0iYdIdbpy9z0bPA+3Nr1V8Y4f6ygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Gsnvm7Qw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2846896f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749540926; x=1750145726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sG1oR4vFwIzp67GPDuQXvXAdqEu0nlcOGBX3xZd8/Bw=;
        b=Gsnvm7Qw2OSw8SjpBVBiifDIW5BreydwCW1L4Tso2fnMrY/2I1CKro8EqNWyErppNE
         45KhYF2br7qNXsnVdHPqNkopgPhypZqUAIVquPMQgk+zthKzRcRQpLoAdu0/7JGoS2IG
         XcviGftVpSqWDCdv03Ea4ddIL6Uto/NtmMJ3MEX97ysRSRJkS0tLcguhmIeeiJ+OhsQE
         EXf6WwedHamP2UK1E2TBZjnBIojEhYu4L5VtdG3vrp5a13uPJLn+G7ya9f23KBM2Ow4L
         FhLFMdkQy7zO5qi3unTC6RCxYAkp7ea7kbaZN8q6LxoBVQ28wahwMEKWyIXRHY2jJGSo
         4ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540926; x=1750145726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sG1oR4vFwIzp67GPDuQXvXAdqEu0nlcOGBX3xZd8/Bw=;
        b=Uf/5Uky4bwMxxmzghUVYseS4zJuw/aqRk5eKimkZ/Of3iBx2Ighgm7Uzp2iLDrdL5K
         qfbhwdygPTOLxCXvQdCviOfj0E57ZZ8/0vw9o1S3uSJy/QcSA5bvADIJt+t4SyTmRGA4
         q0RzalfhgOk9HOC0yh1vDra5L+ac81vy0GwMG+vImk8Bcq76KI/TWp0GtCb367B6q7z+
         0akD0X2RMY1e4+0SWUG/j07wks+ThjXASjfKjrjbQ5MLNBe/fhgkifdc+cYDqWh9pFpw
         x9cDNYIpL1mTb5kZn7H81cE29IkxgiHQcfyKClYQFYLX5N+o0MaWvx3dWAzSjJ/iyUGX
         bZUw==
X-Forwarded-Encrypted: i=1; AJvYcCX/MMLT2AYELe4vj1zh6lRiJ43tjibdUGXR9UlIlIlrWYW65+CpA7RAQZx6rHv735VtiNeZ/cDeMlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAqo0qHp4gHwtwra3IHa9K4id46g/gx3I3w8nH+ocNVs02cCxK
	hII0dbBwtc8HUqeJw3HYETQU6on6Ui0odtr64Bb+tEH7IXWzZ3Q0XiW14iECK7crGr8=
X-Gm-Gg: ASbGnctZHeXKBxhYLp64QshbaFpTKrM1jtyl3eBp9rxwWjqQS2m8eFfFMDtTn6UFOt7
	FJpuI1jijNfScKOF7jdEHP78lixcldQuRjg4EUFb3Ufv4wOZLl3MCS3lXZm7wwLXdOn1JT0QIiV
	+cAXaBrXHfvb2XpYc+U+3HtLhyG7QmAVqKrYnGLmq33j3FIJXr3305JjeGyL2BOrMYh8R8sEVTK
	vM1A7omWNlZHi+KPMINZnvV4f7xMRnbdoVC8IilVN/3cA73SfZ1UoO0kiGc8vFnx7Z4u5aqt5BH
	ZHPB0GlYC4f3mHVEz1yuZKXahLG1CV3mWNHnjtrTRmKFyd2L4e7Egw7cixONyOvLvzwmVEI6YnM
	e0WLAX4ZULDO9BkvGZZeaqCyD+UH/jL3j9Q7uBxA=
X-Google-Smtp-Source: AGHT+IGlgCtrnYa6jkFl9tdzygnfM4ZBerKUF8tKceCLQnA3qYj+UbnvmZbB5i8R3IdNwpZObZpI8A==
X-Received: by 2002:a05:6000:40c7:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a531cb8333mr13068402f8f.28.1749540926119;
        Tue, 10 Jun 2025 00:35:26 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53244ed76sm11533575f8f.78.2025.06.10.00.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:35:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5.10.y 2/3] rtc: Make rtc_time64_to_tm() support dates before 1970
Date: Tue, 10 Jun 2025 09:34:59 +0200
Message-ID:  <955e2c8f70e95f401530404a72d5bec1dc3dd2aa.1749539184.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qewZU0UD4hWB4Ge19/NgNWUNePaxVKR57Pxicx/COpU=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGhH4Cihwn8zYmrXREvI728wtkWbdcp2cwNWhv8nTz4zI7jOX 4kBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJoR+AoAAoJEI+A+1h9Ev5OFC8H+gL4 L9YzU7SvM7vkRFbDGAUdEHA6pYO7SEG0GGOGrfSnoJmeOBwtgTDBgdOliP5hxQGvrWPAUdjkZmq Z9Wr1P8oOFld434ur4QKGwvbCnK7INVEPZzvBC0XlWIZQR/HKYkN/AhUxVVbKe0Y+8yOwc2aOEW uti/t6ZVy67Q41+13/iM6k7ENViRFKTgfMLjsTIsLQsNL4bTB64K3ZewRjUb33KaPHF05Bk6d8a Cx/kFrzegfi2/1Yu18VGgEG/HbfV8xNB2Vl6pNMnRPW/YtIKzKPte14I0Wssh3VOfAcKB9hNluU JXJJ5lAKaoJSRjsDNInV0kkKZXiF+WVd3dZfYGo=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Alexandre Mergnat <amergnat@baylibre.com>

commit 7df4cfef8b351fec3156160bedfc7d6d29de4cce upstream.

Conversion of dates before 1970 is still relevant today because these
dates are reused on some hardwares to store dates bigger than the
maximal date that is representable in the device's native format.
This prominently and very soon affects the hardware covered by the
rtc-mt6397 driver that can only natively store dates in the interval
1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
to such a device, rtc_time64_to_tm() must do the right thing for
time=-2208988800.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/lib.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a..13b5b1f20465 100644
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
2.49.0


