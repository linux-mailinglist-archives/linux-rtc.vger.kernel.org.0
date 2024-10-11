Return-Path: <linux-rtc+bounces-2160-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D636999BB2
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 06:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E246A283A81
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 04:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586D01CCEC2;
	Fri, 11 Oct 2024 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUKHiPyv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14E08F58;
	Fri, 11 Oct 2024 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621265; cv=none; b=CIJi8Bygk4Mxlwsom86FKpCk8fVgqhf45NojNMidl9UvwjD7/MTEvvdVoPdKyF5UZrCXH0lor1IGOdwVjczBwbkFeSh/wY3ULPH4lo9bogt2ZKKNNSvG2WyaBPTKAQ2xMY4jqefA5ABSGxxALHH/BxxFFgPa/4/E/W9XaaHDYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621265; c=relaxed/simple;
	bh=NajNb/I6k/6ZiFsURaEaC5lig7HGp3Cceim03PLo6c0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQethlv4zEM9NlRnI7k7Wudgl4Z7hKqgzWrtRDx3wf/2vGtIT85TR6cR0o35ANVEbd933tpCBMraVtKwsYUh2PJCC3tRqGW1nvQsOTXB/LUylyBTDbAygS7Dd0LHlRWSeW5E+AsekXXqkw6yCMJmzzTkADK0kixbu+VAzt7Hrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUKHiPyv; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-716a3e50a81so980494a34.3;
        Thu, 10 Oct 2024 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728621263; x=1729226063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTjmxcfMzkPqRPKWj2sOMpOalolsk+eot2aDuccwuS8=;
        b=SUKHiPyvIf6bubcaQlL33wmsa4q6MbbX/GZl5KA6VSM6vI7q1T8/csKn3cWNyZ4W0p
         EUk58tMUScEZkIo4EDXP8vRIIwfFAfRbBepjSy5cpNizm3B5tqPuaJLzXcVFE4SDEoNM
         bB1QG5mTuY3A7fpXywSXsXNusSxUK1Z5fayQva4O0LYgwcfGBaJeEQxg3e1/0oZCtHql
         MSFtf7aZu+oq+lhe6JqoRj26fDHPHUcn3iL/vOWtu/0twP2ZDKxE40al+xa/J4EWPDa5
         ArttOF/gIMYP+runeN/lNSEBLtKnVCZWcS+rzIB34o5EftTiSDbZPfr1H1n3nkcmLHgx
         14sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728621263; x=1729226063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTjmxcfMzkPqRPKWj2sOMpOalolsk+eot2aDuccwuS8=;
        b=lHXmsuFpDwhgtNzfOCTDI3u0XSwtFy2epdUD5xgy+sL1mTlmEWzcOvZrRkrhus+29t
         AELQ8cuUg0c78cthS4yVKCqz1rcTDZu7rI5EKoE+/2p9V+kpmAgO1CzkXEB0S6FgooY4
         n0fS8nPtB7loDRpeA8JHmb8R2xuJZVDqLH2GScaIWxI2LBkdyfEIhlI3LM65PjFdce1F
         OTUQPUYAxs7cDUKneJ4iAUVKZSNJWo2zAHkacwc6iPXms1rEzp8HbOSHp7KuG9pBvQLM
         P3WwB5dtW6nQkzxDKwqd9n9w32qjRtPWnIlS0lHcIsWr5S8r/sZ/mcsJrwclg+jlKL2y
         f4tg==
X-Forwarded-Encrypted: i=1; AJvYcCUe7R6wELR1uBQ4SJlUhFj2hON7ruU96wLQPkekCYy+mom6dUgsn0fyGkmPbnW55LOkKVkiTagnCY0Uoiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRhRQDdlj8DEe3FvzcvqbAgxpdNsLG0AcjvKzbUGJCNBRjt4S
	Uie5kzoiauNDASvcpKnUCYlFOigXaBerZT/ZeyHkSqmrO90Dy6tKMhWwdL3z424=
X-Google-Smtp-Source: AGHT+IH8Zw8FYpCDh1vwV2hfKQzUQm4N1CVHuFmC+2X1ytWSMQo/dJ40wFJB5avhJcQ+1dh0bJR30g==
X-Received: by 2002:a05:6830:6e17:b0:70a:94b4:6e67 with SMTP id 46e09a7af769-717d647b8efmr1455296a34.23.1728621262745;
        Thu, 10 Oct 2024 21:34:22 -0700 (PDT)
Received: from VM-119-80-tencentos.localdomain ([14.22.11.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea448f9440sm1821668a12.30.2024.10.10.21.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 21:34:22 -0700 (PDT)
From: Yongliang Gao <leonylgao@gmail.com>
To: alexandre.belloni@bootlin.com,
	john.stultz@linaro.org
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yongliang Gao <leonylgao@tencent.com>,
	Jingqun Li <jingqunli@tencent.com>
Subject: [PATCH] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
Date: Fri, 11 Oct 2024 12:31:53 +0800
Message-Id: <20241011043153.3788112-1-leonylgao@gmail.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yongliang Gao <leonylgao@tencent.com>

If the __rtc_read_time call fails,, the struct rtc_time tm; may contain
uninitialized data, or an illegal date/time read from the RTC hardware.

When calling rtc_tm_to_ktime later, the result may be a very large value
(possibly KTIME_MAX). If there are periodic timers in rtc->timerqueue,
they will continually expire, may causing kernel softlockup.

Fixes: 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
Signed-off-by: Yongliang Gao <leonylgao@tencent.com>
Acked-by: Jingqun Li <jingqunli@tencent.com>
---
 drivers/rtc/interface.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index cca650b2e0b9..aaf76406cd7d 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -904,13 +904,18 @@ void rtc_timer_do_work(struct work_struct *work)
 	struct timerqueue_node *next;
 	ktime_t now;
 	struct rtc_time tm;
+	int err;
 
 	struct rtc_device *rtc =
 		container_of(work, struct rtc_device, irqwork);
 
 	mutex_lock(&rtc->ops_lock);
 again:
-	__rtc_read_time(rtc, &tm);
+	err = __rtc_read_time(rtc, &tm);
+	if (err) {
+		mutex_unlock(&rtc->ops_lock);
+		return;
+	}
 	now = rtc_tm_to_ktime(tm);
 	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
 		if (next->expires > now)
-- 
2.39.3


