Return-Path: <linux-rtc+bounces-4459-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF948B0066A
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938C21C23DFF
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F127602E;
	Thu, 10 Jul 2025 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WY3upx/Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228FC27587F
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160870; cv=none; b=pntPfKEVLMXoq79l4v3v+4bQapzaQe4IXaucgalkGVSgNlvdDanU57b7SouZlRiGvJ7pJgMXTWtqfHuqAVvGmX5S7qD+wS7+fY33wRs7ppSgMhWhEqUxohnYtv6EVftC2MpH/ifcUoHzI9LN7fiNNl58sAjzqTTyH5yerKe0NfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160870; c=relaxed/simple;
	bh=PB+j173ZUCvMx00QR0amUhQt36vO0IOlAp4XxnvHyoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ba82APJO9ITNqEkD3zucmqsGfHCscsjufL52aR0+5XjpAGIbEQPKs3sx5e2xrRxbh/rXRIWBQAKhC/g/hDTJ177uu9Xq2w5/AQQoNQyi2I9D5fvTeIvJ7QDewAuZGEOz/ttY0fiM93/+lB73BqPKAunvbWptmCPCMkJWbNb9xAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WY3upx/Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
	b=WY3upx/Qy1UjDxkiBaD12yS8p/40Y3+dTMF9lLU2+c6GAU0QkaKgFnvPvJV3Fcelt5rzev
	bmnXolneqI7xa5ksO0DpCx8VMVoNqv3KVZwL4lXP+FO2lkDJV4w4w6kO0+V3acncJBiiAX
	C7wLmXpDSj5T/Rr5jveMifli7YF237s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-4ltFqfTpM9GG93B9BFBP6A-1; Thu, 10 Jul 2025 11:21:06 -0400
X-MC-Unique: 4ltFqfTpM9GG93B9BFBP6A-1
X-Mimecast-MFC-AGG-ID: 4ltFqfTpM9GG93B9BFBP6A_1752160866
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a441a769c7so19305421cf.3
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160866; x=1752765666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
        b=qYRf+q0QnrY3GNz5rdhvXuLb8vvFtnuERMGRi+1rK1NXIXgKU93CPS6bflQ1RgSXaU
         9pETBBDmKZAr0viuqVH/9TU3flYdDSE0VH+vmHVbPaOwmnQLI8gM+AUQuRakpTPvMMnM
         89nEdbeXKWg9vJooh7cZxHiYeR3OX7DGXglN8w5xI3NYJnuwMle8ar2Jzszbl3Px3ZYp
         ClOEUMxqAgLMr6ukXNsyVm2hYb3BDW7gi/p46R7uaKs3KqU6EdS2Q+RqSu8uBp21nVNd
         6MoCkd/6ClsyE04XWY89vOQNZIs2ZPlAQbP5sTT4Us0HICIJOiTQdhmpAgGWyM3TegaA
         CSyw==
X-Forwarded-Encrypted: i=1; AJvYcCWZlRVgAVMEHPaG14AJEvqFh4W1RZoc4V4ShouxMnl9F90Y6242Ax4BlDBHf1uIaGff+uZnGam6TuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaXKQGYQvUoKr8Ub6hggFJNATDkI3SQ18XoFuwZETZ5pV/YZ0
	qKNEs/zhyEgZNGpFYj+xU8udt0qyMglf11kqpTCHG6ggqZwdDJDYxYbZpFuddCWhmf1zVjcPq7j
	G6RJidsHAw8eEnmttr0Y+O9w+GVvyGSCREYeoeczgi1AlO+Ai92D0pRZmWm8QjA==
X-Gm-Gg: ASbGnctHlFTpNPdENCp1CaucdsGJGOMpiUqvncDKoemazvXpO3lbb/gygvotkPJFeT7
	TgYj6b8lcdqOUirMOu6yRx4Ghm2j9zmBZul+9B+X6v5r8gMk4bLdJ4luBugX8TAnxRPxpfEZJMZ
	UemOmDBnMLeKdiWL0wUvCxlXi8grFIfGbzRbVt4CqmALVR1XsKu/s2JdECxDRFZdXCoSOgbLi0g
	xUTHTissnK+ubHxmZ2gh5L7yEAwib/O5bSuEGRl9RoU+GylnJSuo8zOYzh+rhIylneY6m3hEEbf
	6HrC/8AnX9T0CQpM506InMS55a9MghEtAoInieVLQtFUv14BVCp9BPGG8/K6
X-Received: by 2002:a05:622a:211:b0:4a7:5c21:d4d with SMTP id d75a77b69052e-4a9dec28dc5mr103787181cf.3.1752160866019;
        Thu, 10 Jul 2025 08:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGi78LTzsYtSVkKEALzl93XPTGvuqLAQzDkHoOcxcArk4oREKyBP6wLdcXeCmuUpcKwg+gWg==
X-Received: by 2002:a05:622a:211:b0:4a7:5c21:d4d with SMTP id d75a77b69052e-4a9dec28dc5mr103786631cf.3.1752160865622;
        Thu, 10 Jul 2025 08:21:05 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:25 -0400
Subject: [PATCH 05/15] rtc: pcf8563: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-5-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1071;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PB+j173ZUCvMx00QR0amUhQt36vO0IOlAp4XxnvHyoA=;
 b=SZd0Tpd6HF4yy+Mmrqrn3tbJsWSKYgTwu87RGcBvNECkHFO1D/v+Vw/xZqNbu+/k2SLWi8+ZB
 mcLVNVwJoO3DhAIo51s6cEWtuxqa7l/mVXZpDVSt8sXgmkm5TMyGPgA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When pcf8563_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: a39a6405d5f94 ("rtc: pcf8563: add CLKOUT to common clock framework")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index b2611697fa5e3adc61f687e39385d10736dec677..a2a2067b28a127bafec66328cd75f50aa4277986 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -339,7 +339,7 @@ static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


