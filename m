Return-Path: <linux-rtc+bounces-4457-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C878B0065F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F095588383
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160B0274FEE;
	Thu, 10 Jul 2025 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YMd2yIQ0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CB274FD1
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160865; cv=none; b=nIDTKzta0jGV9PVuUiKPbDVsbNpsPEQJwGYwyAw7lnQ2XAwKnS0c5SCvDFtXcpkQ02gABO/Ji5o2hm4tksthp8ouP4bNXvTz0nSihoeWyBSnupYqBLq+3WxkyG2DXGwy6ArmInbEmWx3wghUSgvSG6GNfWyUJ8XP1egGZ6grOzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160865; c=relaxed/simple;
	bh=5dhSXbabSOIot1EwSUx0tN+/kwz+r3qTKvgei/0M1C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twgtNEgwqiyLsI3sDpdY2hL7twCvjoHzEFeI9vHSoDUQQCJGpZu8v088XJlsWfdU92n/UXtx/VvRgvdYv97QChexwj4c8I2FHfCbfTHVTkNS7FWjQwaalp51zJE6eYADnG7ufe9gWn7jHRD2bO799+o6NtEwGZ+0Vldjeu2SZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YMd2yIQ0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
	b=YMd2yIQ0Fw6Q5kdEgkV8XWxJfrhPyUwiWVEgMzVgBK/IkNixBoq1Y4AOUOGpWcJnec26VX
	BRWJyJcFtarJLSctALPPGCQoRHblUX5+Zx3Qg8Z+BaGsMTHVDT40Vsb7fXyW5z7gyrP8nP
	UE2bgWJhTbY8fpmag7Ih6SnkEFnk8tw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-iv__dbQZPaCpvVpvOZhOhQ-1; Thu, 10 Jul 2025 11:21:01 -0400
X-MC-Unique: iv__dbQZPaCpvVpvOZhOhQ-1
X-Mimecast-MFC-AGG-ID: iv__dbQZPaCpvVpvOZhOhQ_1752160861
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9cce09a9aso23565031cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160861; x=1752765661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
        b=nsJxqXNro0HC3AhoOId7KxDyXai4UKRElQiMp4wvTn+Xg6XW2+PeF5bxpjdkaR0JOL
         hYoVUJLlRzAH4PtxC0ci518FhQATNHv+ym/zcCRuA6TuZyeLM4RJ/Ig75vdC97reLS2I
         +8SQTrOuB4Q+3w3y2ad1n1Yy2lFGchNVpcjRjxtvQKs2NUFxPv3XlH/1IA9597HxCtFf
         VMz3Kq0oMteb54mFwu4UeMsQqqC+QvqnHUAz2xrPODq91cbo5kcjfGeFu61U+l2hoNPd
         EiD7CHizlHKWBLwV2SzSFYj6uNxV4SSSiuJ8mZtPH7Z/5XYYO+aNiwukiLcLaTYvWK3F
         jsNg==
X-Forwarded-Encrypted: i=1; AJvYcCUJq1Q7sow/E2GUhmIJDiVV3bwJ0d5HRj9sEwUPGWU+41CwYJkBMnX2Xa3+3MI6X17Lb7fwBU0VPNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jheujHzHlI/z5VPijAgRrFUSPRBz2XYxYPzmZcfx1tq0ogdl
	W3jK+lnJ5g8fxN+jis3O3BPSiqTLiXALvRsG7hS8U/MG11m6t+AD7fkyMqsXFJetq8B36zYw964
	upbDu1yq2b94ZiJdASo2g1mFOVDL94KG+M7e8UhaK21U8QSbQ9e2VHRDOSfXmXA==
X-Gm-Gg: ASbGncsOYZe7RAqzXi2IAaefj9pbbPhPc7AQ8XWEGqRkZ9XY8wSdf4JTHz56k2ojtxo
	6JsxDtUBgBx3B4hIuM+1vLMfF7A5lqS1pbgHfY9fuqotCaTwu9y/0N92/Y4j4aSGCGdAHxRBwSY
	cmMBHeyY3YTsBeNmHaqb9Mt2CmR+/nmPFE4srR6dAGEWKsAcavQpC56XDNVVF52Mvwu1TAHrUnx
	TRbEcQjSAnNeuUJA/BTqK29x7CHZIvRvISjKpWFri+SQr0GURH5rmeWgAPF25iRBEFlpnGC0oUT
	hIVY05o4RuzaB0CkTF9d30A11sji9mbbkcaHwdj4QQw5IjYbGt4kEsgOctmo
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54126441cf.39.1752160860729;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZg7tT2TKkLa812dOO0cuVbNuTqTsuTm9YCrDOkt67pP9zNi/06aVHc55G542WY91jCJtYaQ==
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54125881cf.39.1752160860286;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:59 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:23 -0400
Subject: [PATCH 03/15] rtc: nct3018y: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-3-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1069;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5dhSXbabSOIot1EwSUx0tN+/kwz+r3qTKvgei/0M1C0=;
 b=Z+eHnE3yFv9Mc/2pw97GUAxK2h0eRAwimIQZHOw0PqyzYENQDmyX8/9qqzMvrvfVYCneaOqS6
 wbDceofTElTBQ1umKhp9Jwiwd5C7UTuyCYdg3bAtiY4LJ8MkwhDIFRV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When nct3018y_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 5adbaed16cc63 ("rtc: Add NCT3018Y real time clock driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-nct3018y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 76c5f464b2daeb59fa8367bff3ad261ed75dd937..cea05fca0bccddc6384c462cf1ebdc59b377a24d 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -376,7 +376,7 @@ static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


