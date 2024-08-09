Return-Path: <linux-rtc+bounces-1669-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52094D40A
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Aug 2024 17:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B461B21627
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Aug 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C01198A06;
	Fri,  9 Aug 2024 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GujSMncl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B134168B8;
	Fri,  9 Aug 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723219057; cv=none; b=gd+roCva5XmykL0n61MXZese+OTFWMMgwkBBSs5nYWZXwOCSyIIjrWj5WZNHUSdYwLoQm0uWIrx6xAtAScxGD1Pu1FVI74/NSjGhZl9rE5EePeHwwRXQKwpBUFTcJlf1qYF2UWmQagfSh0LoWQfJ/RxNvRIdVJNoqCgO7bal41o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723219057; c=relaxed/simple;
	bh=aupWW4PudjT0riYrRXYHfSbERNtSjKDoPxOKPQ4Jz3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tx3oEf98ucUJoIp+yDB5zT0raE2qeP7giqnLkm0DVSZH2dA1medN102nAYBm/Ju+vKGx6jYsxOfN5oHo2v8H0z632GPJpLaRfLZxdR8Ebegtc5OnZiT+OAvmyqxakEJ7KSKAvkMA5P4SG/5QwF94BI9+/sAAY8KmIn3BfheHHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GujSMncl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1c655141so1840326b3a.1;
        Fri, 09 Aug 2024 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723219055; x=1723823855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQbheJKaZzimqi2nM1cZ0ksDOovJ28S86O+Xj2+eZ34=;
        b=GujSMncl9kDoHaMs2sjeRZj4xzWKo2BRiVpkBt4485Tf/P0rtX0pV6OS1H2ESw0T9R
         XGcqwow1q/oKmuIuSpK/IHJGlOHPaeala15COdnSYfwdV+BcgXUo+8stt4sgV3y1g0X7
         VRTvLlYGNHto46JW0zy8gKt2f4VM83n8NmXdzrEiNUVIrIplnw8t9UR5sdwwNCX9tbcl
         4Z4MBJ77Y08nnBhsmpXFCkz19aZ60ylh1XxaRJXeQs0pwliW9A0LtEeo1Qxm0zHTSGOm
         GwE6pQKN12X8j8FZB4A62NpXYf3j+uSe+PSoud7IkJxumzShTteHOc/kisv9zUrgLM59
         EA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723219055; x=1723823855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbheJKaZzimqi2nM1cZ0ksDOovJ28S86O+Xj2+eZ34=;
        b=dAq8K3sylRv8B7tcHcyZYr/wHFiO4W6Lxr16qrY9S/4Rk+5zMZ5aaae3huNbjHBjdf
         RMwAnM0fm1cmUrHh0MzhOSedC0IGsRb2DKVJeoo0yVYulftQ1mXaLl4bl8uiHUqutQON
         qKdK6ID0ZWoc6G7BY7XVYLfjmkA0CCwJ40OgfzKVC+mztbw0GLs++03Tp9TRRWZqfSQv
         hvh/C5Uu286wK9eiS+boLra1HEAtIBq5kTEyjfhcSzhQY5m3M1EHVYPYf3GxkYT6RSV+
         pXY6ct0NmJ7DBChBsXKciLwem1WFW8nRecdkjp79lIanGtlB1pOyBG96tbPqpg7wNPLt
         V2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVgT2BFk/540uIvSnQewoIjNnE/KYbyyOuNfvYLb6ExuYCIJ+6+6eUDeQE6cX4DiG3M77Re2c1Dk1jKjirP4Lh0YK/mMANWGvW3Qe5/
X-Gm-Message-State: AOJu0YydTANLDwicfj95xCJ1Eiwd/0bShDWkKeHvoSHN71pP7QhqEMCt
	//lX7cwPlc3cUj9vHTTobd05BCo3NYT0ogh7AaLmkDBkcVdz8SyeZqFVlBAd
X-Google-Smtp-Source: AGHT+IG8JAzFFhDJpXp5iBbOS/4CTp1mY7URlH5eSwuMsh8ncTmLK8FtAeFexWHo5ZBxFFWnFAvk0w==
X-Received: by 2002:a05:6a00:14c4:b0:70d:2b1b:a37f with SMTP id d2e1a72fcca58-710dcaec5cdmr2119906b3a.24.1723219055254;
        Fri, 09 Aug 2024 08:57:35 -0700 (PDT)
Received: from embed-PC.. ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e7490sm2774842b3a.164.2024.08.09.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:57:34 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] rtc: m48t59: Remove division condition with direct comparison
Date: Fri,  9 Aug 2024 21:26:31 +0530
Message-Id: <20240809155631.548044-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'year / 100' with a direct comparison 'year >= 100'
in m48t59_rtc_set_time() function. Improve the code clarity
and eliminate division overhead.

Fix the following smatch warning:
drivers/rtc/rtc-m48t59.c:135 m48t59_rtc_set_time() warn:
replace divide condition 'year / 100' with 'year >= 100'

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/rtc/rtc-m48t59.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..cd2ca49805d8 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -132,7 +132,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	M48T59_WRITE((bin2bcd(tm->tm_mon + 1) & 0x1F), M48T59_MONTH);
 	M48T59_WRITE(bin2bcd(year % 100), M48T59_YEAR);

-	if (pdata->type == M48T59RTC_TYPE_M48T59 && (year / 100))
+	if (pdata->type == M48T59RTC_TYPE_M48T59 && (year >= 100))
 		val = (M48T59_WDAY_CEB | M48T59_WDAY_CB);
 	val |= (bin2bcd(tm->tm_wday) & 0x07);
 	M48T59_WRITE(val, M48T59_WDAY);
--
2.34.1


