Return-Path: <linux-rtc+bounces-4463-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FAB00676
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5701CA2138
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BC7278753;
	Thu, 10 Jul 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCUrhQmS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E43274B4E
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160884; cv=none; b=Ml4TIosjSqLF5QH7C9/0PC6/EeuC/Yj0AbGi46L2hmEh4jdzBMStm74xI0Uoc1khQgkL3fFT81vvnRN6zJEStdA+OW1eEY3vVmJXmdalxBtjbEhX9WnFkwodcNCekbFsMIcCcTiHrdfq/DQeKqDQDTesCA1B6A1QE7coA68Tiws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160884; c=relaxed/simple;
	bh=gRYxCnwkm6+irA6938Yxi6DImy0GX438/iYdpVHvAEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVNB1PF1g41AANiL7sbAKJzDJSAr0yZd5aFGGGh8CmXKzV0PG6zPOSrjxoNVcoCrFXCGkU9XE7GAYAS+ML4wN92TDralZx2zbzSYfGHd2imAWJCriGj/ixdeLS3GHZjQToNctgLsTgUrM6jM3sqcPynhb7Cf+wV5gUNt/ya7DpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCUrhQmS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
	b=PCUrhQmSHr+YsApDL1ryLXwjEJjBVCouJQEe7Wzptx3ToKpF8kQd1f7KbL5j144PH+gFCC
	ioDpuj3aDQIDmeCKwd24ObbcE4xtzqQkKxR91Ty9f3AzVXanQPbJE4ZEdDr4gm40Ye21Gs
	2ghd6gMtyTCcPsn2TC4VetF7SsIL8go=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-fXN9ZJ1QOyOc1uWW9wkdOQ-1; Thu, 10 Jul 2025 11:21:17 -0400
X-MC-Unique: fXN9ZJ1QOyOc1uWW9wkdOQ-1
X-Mimecast-MFC-AGG-ID: fXN9ZJ1QOyOc1uWW9wkdOQ_1752160877
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9c7f2f4baso50902961cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160877; x=1752765677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
        b=rAtXK1ewVL3eKmBudRQdemQT1C68NXEPs3DkfznRNCDMeSK8GI2Ghta7KjmDGvbp8o
         mL6cIXnjBIZt/yDcrDWjSKhbVVZYRQ715i5ihpmIPceLllJmYPNGN8EnYgwXaZNVHqCs
         ChkcstXR1ivJrO0Mj5zbzeu0ugv6mRh6DFJLT3H6uVljRxN3lZzh1SqCrkpB02Y+s+o5
         XMrvxRwUGSXyzPpV0WXJgEfuPsji+EAQisyy6dlHdnFaTF3HUmILr3Z96dvsdvl4DfY6
         dKGAij4Py6rdmdtWPzC7Qrky+M6FKDtjLiL6Wrc43rIPHs/Ld5k2niCa2CEWP/uE86jw
         xiWg==
X-Forwarded-Encrypted: i=1; AJvYcCX59feJ46AcaPsn2ZEZ8ir12Ka+cjx5zqzcw+L6NvC5/AVqJFkDx7jmWrFBa7yQiQYRlJUHu45fWlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRaHlS60P37LZcQd9s9LGbG5fGbrqFgP7sH0GWElnL0fHQGjl2
	j/Pm6NuNX2j5zdJOxOiPIMM6uziubNGBTyMNAX3NxfYi8411/B0gKsFX5THV8ISVfuewqeIieGu
	kPKie2vUaYYRCcfB/eDCzZnGOE9/bOtyT7gy2FWMzLhIBy5Ntb+C+/hXGMfJGvQ==
X-Gm-Gg: ASbGnctbhuC2xYEZXeWhaov7FaFS2d0ouZdM8i3kbehAYVPQEfZdGmGgHKjbcme3xvK
	MYUe9C77e0Qc5UsMGoAo6eYNPhxLzW8jG/wPCb+x3fep3qmyz5rReUhRNqHqR43Yiwyf4T2b64Q
	j2CbKwOah3CCR2DYTOKytTWGMlC4BHo90pDWWaFeJ4j4fJ0vHWjxgiRcD6YYHx07Tm6jgSmieiD
	7NEjePahbu+lALaB0YlrdHOE3eIY6d2nVb894Y1HWtr5p1/lM2WT15DoonGQ72qaR9cPQ7KqikW
	ffGOdYMfDqk68zpNXU5KllMAWgXkbNQCT8mg23CFGNYVquD2SylW3ABgIyyU
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515801cf.21.1752160876756;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEktnXBUPzvGbZoA7Bfbi7aUOBKs0QSJoWa7pWCkvWbCkOdt87sQ9haOuMdpsEwCBfM0IV/Rg==
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515221cf.21.1752160876213;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:29 -0400
Subject: [PATCH 09/15] rtc: m41t80: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-9-33140bb2278e@redhat.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1772;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gRYxCnwkm6+irA6938Yxi6DImy0GX438/iYdpVHvAEg=;
 b=kdySgV3nLQK/nOox4fwHOlhGEFmW0wqNr9VHY7vGwOwPSM+A7pKrKapXwM8vxkIukREKQD7cC
 HuxCZizP8wRCrbf5QFXxnXIAg7hjFGFve1Y1H3RLVpUJwKN6oL6+xHw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-m41t80.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index c568639d2151702440d726030e9f08a0eb514da8..719afb9de9a831a4f335f505e3a0eae5293ad6c8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -484,16 +484,17 @@ static unsigned long m41t80_sqw_recalc_rate(struct clk_hw *hw,
 	return sqw_to_m41t80_data(hw)->freq;
 }
 
-static long m41t80_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int m41t80_sqw_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	if (rate >= M41T80_SQW_MAX_FREQ)
-		return M41T80_SQW_MAX_FREQ;
-	if (rate >= M41T80_SQW_MAX_FREQ / 4)
-		return M41T80_SQW_MAX_FREQ / 4;
-	if (!rate)
-		return 0;
-	return 1 << ilog2(rate);
+	if (req->rate >= M41T80_SQW_MAX_FREQ)
+		req->rate = M41T80_SQW_MAX_FREQ;
+	else if (req->rate >= M41T80_SQW_MAX_FREQ / 4)
+		req->rate = M41T80_SQW_MAX_FREQ / 4;
+	else if (req->rate)
+		req->rate = 1 << ilog2(req->rate);
+
+	return 0;
 }
 
 static int m41t80_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -564,7 +565,7 @@ static const struct clk_ops m41t80_sqw_ops = {
 	.unprepare = m41t80_sqw_unprepare,
 	.is_prepared = m41t80_sqw_is_prepared,
 	.recalc_rate = m41t80_sqw_recalc_rate,
-	.round_rate = m41t80_sqw_round_rate,
+	.determine_rate = m41t80_sqw_determine_rate,
 	.set_rate = m41t80_sqw_set_rate,
 };
 

-- 
2.50.0


