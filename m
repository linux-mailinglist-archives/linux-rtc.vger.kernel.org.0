Return-Path: <linux-rtc+bounces-3218-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6750A39A1A
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 12:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D756116EC16
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 11:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C3E23BF9E;
	Tue, 18 Feb 2025 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEkm9i7B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258122DFBD
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877133; cv=none; b=XKdLaKsp8yCfxV9yfml/YeP5uWcAsW4gLZp+rHd76P7xFhZQ8HN7cUnC0yVwN3xmnbGmPgXRj/dfEu+ZfwF5Hk2bQblgo9aVlQzgl3p67GotPZBUGauB6b8q70cW5TZHxOVYRQBDAl3JlSULC0xOrQz1Do6n68TeDMmMGmPuq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877133; c=relaxed/simple;
	bh=4IHTKXUKK4nlNsGSjWCZ8MK6BiQuHtMGWt2dg0sDUcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NeQDgiZnWBewSsHMNh+BfJp7nCQTkkSNvjj87EuXRnCnFpqXDsMkoap8mn6ugLd679Ode9hTK+cmXRhpcaQRyY1PMA3TW61xkdq/qb+XLs+t1W3b1AMUSc13F2tws8DPyilNzPPFytmL4aamQoUcUnt7K5JjuraQEZHHiAEM9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEkm9i7B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f488f3161so858280f8f.3
        for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 03:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739877129; x=1740481929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfXqa12+l7W/WzxoSn5C/l98Gvzn8Loe5HL5SZXxiSI=;
        b=CEkm9i7BxdntPzvIW+7w9CG+M3eGYAKFzuiSA370AKjP503UlzO196RtelgUqXA4bV
         vyfiJpPw+okpjn34e9lQe8gbwy+PqhCMCW77teT3UJjgmgjH/GUWuaadIqTRi1Ohvr0l
         GnIQwhYf4LHn0xTOJBaPPrIhMW2vqCR6q6gdD7A+kJpTAyKEgaAAUTF895DrXvmPVvz4
         xWK6XCSG4za16Nu1aALyMiDNA4E3Z1y9HshF8FbIepePcnrrNtESGeWwaP6wUB9tvZcL
         /RZnEfaNhPCW602o+Cl0kShL18maV+lY6ZHfviaUG+K6Cni96eO//qRMLd0IU4kKKwT9
         QzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877129; x=1740481929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfXqa12+l7W/WzxoSn5C/l98Gvzn8Loe5HL5SZXxiSI=;
        b=L7dLtVOtcYm3QyUdaMinaMmWIFQ7o/M4Scs0w+YT/C/StXrETiLj/Z4hxkds+CVrHl
         CMwM9dr4n/RQUzE2LTkOX2ksZLfhP9h8tFB9dQuUONZJHpphBBFlG3ilaDWsnNmnAVk5
         kd4Kc03EkL9mHKcLeZJGBxrwYi13KRDA+QtQWi56rBS89tLA6JxQTeX7Lscr8VB6nOvE
         svBTh2Uo+z24ekG8zstZviCgvfPrwpU5xe6Wz1Gy8uSD49dMNc99n0ezZxdUBLaiyA5c
         kCOQtLu6z6gHWbZAkybdhTeZMJbhdjPnb37ytKt5le7oNBsrp5fZ3+jW56eTSPjBY+sj
         56Pg==
X-Gm-Message-State: AOJu0YxfgkG27FjEKtkPK+ozasAqdhA055E6LXEtiKUot06G2kOCXtyD
	ly72a5Mh9x5nfmAh4EmFGx+5NNgdhJej3RGIovGolHo1/eIv1oCQQ/Z7pQ==
X-Gm-Gg: ASbGnctiJKyCPJys3hUqOC+5NumF5GGLYwx+aJfrQSK3mcIM5Q8ANOZOPP0yRtl2KUK
	Y6lPo67j7kn1oDL8sDaRctVyaygmsoZL6RQWWQK0fRFfBk9062vYcWaJjNsxTamOQ3d9WQGXFPK
	4qmBZjucH8YuVEji7qmjS2rzNLfFwnVhna5kR7GDTwua/YdLytAtrqzvdEPeM1p7U4XcBWDi1s/
	TLrDvHEeFxEIB83CEtjSJQBnqA49STjIqwPwiKhc/rl5uKLhGmoyv2Ypvd+Mp/s672AsvTEARP1
	z3O48fKVkWAehL958kqNHi3QvtdzVOPW
X-Google-Smtp-Source: AGHT+IFbSjjH2Pxw0XipLIcTEQOgE9ZUObE26InMu0J2YS7PjeiSLgh6x6+yVncym6vFsactTzKkfQ==
X-Received: by 2002:a5d:64a7:0:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-38f33f1155fmr12238360f8f.8.1739877129075;
        Tue, 18 Feb 2025 03:12:09 -0800 (PST)
Received: from vision3-sde.. ([213.255.218.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccda0sm14744988f8f.27.2025.02.18.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:12:08 -0800 (PST)
From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: smuckle@google.com,
	Einar Jon Gunnarsson <tolvupostur@gmail.com>
Subject: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
Date: Tue, 18 Feb 2025 11:11:50 +0000
Message-Id: <20250218111150.3024-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for BITS_PER_LONG == 32 makes no sense after calling
tv64.tv_sec = rtc_tm_to_time64(&tm);

With this check, any 32-bit system will silently return an -ERANGE error
instead of setting the correct time if the hardware clock is storing a
date after Y2K38 (2038-01-19).
Without this check they should all work as intended, since the rest of
the function is perfectly 64-bit safe.

Fixes: f9b2a4d6a5f1 ("rtc: class: support hctosys from modular RTC drivers")

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 drivers/rtc/class.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e..df58edf99ed3 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -72,13 +72,6 @@ static void rtc_hctosys(struct rtc_device *rtc)
 
 	tv64.tv_sec = rtc_tm_to_time64(&tm);
 
-#if BITS_PER_LONG == 32
-	if (tv64.tv_sec > INT_MAX) {
-		err = -ERANGE;
-		goto err_read;
-	}
-#endif
-
 	err = do_settimeofday64(&tv64);
 
 	dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%lld)\n",
-- 
2.34.1


