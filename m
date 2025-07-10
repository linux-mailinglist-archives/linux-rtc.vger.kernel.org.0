Return-Path: <linux-rtc+bounces-4467-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C938BB00681
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7897F640EB6
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AD72797B5;
	Thu, 10 Jul 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HxIL86mb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAA278774
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160891; cv=none; b=e3TmPBNRaf+NVZ/ElOcAM0C2Cvkn7kQK6Dh+NcsJwwRx/7k/6QkJTDsWwHpS60nJiQJTlbZT8d0W24AFYYCAXz05pqXjcB8NjkB8+AILDG9+SLaa44FxtuiglgLjRvc7BB6R8Bc1mC/PJJLYLJkimnLfheU+bXFd0DBH500G+Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160891; c=relaxed/simple;
	bh=kz71FhpXSJiP4LK6NL3EGhiadR4ZZmwclRrRnYVh4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/9HeBkQ/TFKj4BP5acLu63geIBBiNMzGCRowIhYFTYzxNSdiXYbMFeCQ6Q9UBsdRkYG6FhQcv3u6Nsg4XezAM8hZVFwtu7LKsPhAs1hCjPwTHuLTfcT0zAePttyW06lMzCDiDC7swGXjOlZTjfsSulENeP8awRNWhtp8YOyhH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HxIL86mb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
	b=HxIL86mbTXPUSs8uRQ7/altyuecxVdZFp08lkB8sPcsRW/Fw9yIcYWEAcD0eoBj+8G3uCv
	ar1HVFsMRHmE4bjz36dqIrpOMhPyXD7125RHOyzex1R/0yuXHMdqBEec3zJamE5reFrJL0
	S8+SHDGFS+veEuxn+ilXUrK7y5IXnpM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-TU7Q7HbkP1C5diNCMKXY3g-1; Thu, 10 Jul 2025 11:21:28 -0400
X-MC-Unique: TU7Q7HbkP1C5diNCMKXY3g-1
X-Mimecast-MFC-AGG-ID: TU7Q7HbkP1C5diNCMKXY3g_1752160888
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a43988c314so20371581cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160888; x=1752765688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
        b=R2SEpHqPDutDqU6fDNQqFEyhXHytSoRgb1hs0ZmiWocAgYwlVRRn+MJDvROIkUtMqk
         OzNsrVcr2R3YMzwU8agpmKHsVhfJ3U8z6u8BPFfM7p1fi5i1arDBKqjtHJxZiVJXmgQy
         +XBPTf7Es/FBcoMQWhwmdPl9kZrykmcuhptWWHC+/AgrxXJlKHLaefjijiEX3RhzsExw
         k2MeeCPHZYVIoypU8UiK6EqGUfqui6ZUJVgXGF0tXDeoBT5iiu0WEbol6huheDaAUa7C
         H67E8iJHryblC+r7OjwUgQuV1/Cga9p2Mv8N4giAArOsilXhMMAFhGf5fVdwkFuIZxgT
         kGlw==
X-Forwarded-Encrypted: i=1; AJvYcCUYZzs02r7nW53unWSYC13nquA3hkVkscxYJizcxNtK0EHtNI8dDrV+OHlVn8xK6rq5Ub207IV14MA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DZsz7B6aL3r7XtUCESl4NIDFz/BRLrQGw8AAE8K8im+jkboe
	gAaph3J1fvksjL2q3svnsp1PMkcg1VJv3E6sa+r/gWrmRGG7Cgi16kkIrvQQ4SlJb/xTxEt5PdF
	XwfSwqpkPrbEmhkTjwF4MdaKzO+mvh/80FVn5tC8WvFMNdMebUhxq0F+zvw/qRg==
X-Gm-Gg: ASbGnctPed447VSqPOtz27HefEZakhvH7AWXs/KopHK5/N0fJV1T7aUR7cwfDiuwjin
	g6ry1GuJxcstL7oCpSQOTEaNDdvHGmmNIHDp6+Tfz0oI5gAdvBeQ+1Uk+J/FcPFtQIsfjmp95vH
	qQHMtpIMAgme5c5g8wrDls3XDuGbDsTPf0f1i9vE72ytT1joufmEh2MOj5r7t+lx1gXcl2+cyVT
	0MEvjh6RBenDAgUiGHnUGmlOcSSohhscdqZEHvQuh9Twl3B1M1KkqWKAelCSxfqj3+ZUZTCMGqf
	S0svcgZBQyenZWQBJUdEHUeIGPiA/LV93SszAgSq1SLeEBhbkqhx4EVbZC5G
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61243111cf.14.1752160887568;
        Thu, 10 Jul 2025 08:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp+rjgrTFYPXr2yzX0xKnPs2naabQOdY6kOTU0JwDVLzTwczVY74hpEf/KJzdR2RHlWtIYeg==
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61242511cf.14.1752160886948;
        Thu, 10 Jul 2025 08:21:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:33 -0400
Subject: [PATCH 13/15] rtc: pcf8563: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-13-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1660;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kz71FhpXSJiP4LK6NL3EGhiadR4ZZmwclRrRnYVh4iY=;
 b=HtQpQzElJ4/cj2HXLwu5RWF2ZoeaJHJijPuStkArACrAwIcV9r53z/PCLSYCNvmBtXTczzLvw
 Yx0zin2Ti9cAacdRJfzbIpFg3t0sPGRc5CfQjMz4BP5O3od8ES6UfXo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf8563.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index a2a2067b28a127bafec66328cd75f50aa4277986..4e61011fb7a9672ee356f6328a7691ca413a82bc 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -330,16 +330,21 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[buf];
 }
 
-static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int pcf8563_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
-		if (clkout_rates[i] <= rate)
-			return clkout_rates[i];
+		if (clkout_rates[i] <= req->rate) {
+			req->rate = clkout_rates[i];
 
-	return clkout_rates[0];
+			return 0;
+		}
+
+	req->rate = clkout_rates[0];
+
+	return 0;
 }
 
 static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -413,7 +418,7 @@ static const struct clk_ops pcf8563_clkout_ops = {
 	.unprepare = pcf8563_clkout_unprepare,
 	.is_prepared = pcf8563_clkout_is_prepared,
 	.recalc_rate = pcf8563_clkout_recalc_rate,
-	.round_rate = pcf8563_clkout_round_rate,
+	.determine_rate = pcf8563_clkout_determine_rate,
 	.set_rate = pcf8563_clkout_set_rate,
 };
 

-- 
2.50.0


