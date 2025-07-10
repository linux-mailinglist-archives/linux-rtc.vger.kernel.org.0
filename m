Return-Path: <linux-rtc+bounces-4464-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61EB0067B
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEBAE1C873BD
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C35279347;
	Thu, 10 Jul 2025 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6P6d46c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D88278E71
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160887; cv=none; b=XDCe4iN/PiGzqC+iFbNsoulIzpPiN0IChroKc0gsYkGyHLXXPffca4R+KB+LmykhkScI+odC9vY+WeMtAjpejiMzxL51BLq4+O8gYvHGpHn3PDQ3pDh71CXWw/XGia6iOzGZNuEYBH6p+OmVMM0h1tlfH8BRoTVhc+Zdy3qygoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160887; c=relaxed/simple;
	bh=UPXy6/C/RD79zBD8+YjC+4PQ2wHdzGnij5BrRNttYFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjDSwmcRwUf8W9r9qq9bNXzKhYg8Zy7Spz7CQqG5OjLPgYjti246WzN4RjjgT3ORLd/InWgRoE4d/zciDakiuZ3wFIpEF7mMhhnkUe6K9z11yUCk/h3UlEcFPv2FKlaD9adC9o9lErAAdx9EttN3laROqgbRhGPSNJpOsqVvUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6P6d46c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
	b=C6P6d46cAnrR/cwXjvAMh+2T2maOyYO3gOT2RAnGbMzaIyBzK6pEIZXjLRpdv1CxhEUXds
	zgfjrO5yMe26N7ZBkH83kFVoClZ/OBbVDmXdAt46H8omKBZdD4hEgC/IhZXrbXsfs9voap
	9eZHxLrTBqxQdhMf7OyNKv3oNREKQrU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-i1eAXZ2aMoWZ2MrkHlxuHg-1; Thu, 10 Jul 2025 11:21:24 -0400
X-MC-Unique: i1eAXZ2aMoWZ2MrkHlxuHg-1
X-Mimecast-MFC-AGG-ID: i1eAXZ2aMoWZ2MrkHlxuHg_1752160879
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a587c85a60so23111431cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160879; x=1752765679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
        b=qOZJAJVObA1ok/MiCgiLtwJ3xnVhPc7lDl9JDPamfhNZw9hTZO93W0GqBlNYOMcDEz
         wvZkXDU6WtmjeMjBsdrxe5Jl3HdSsoEnG1i0m2YrBYkJ2ZgXYC14HZfO/xiOJFDR5kqV
         BpGZ83g1FwoEe2e221BpKJlN4HnhwKNDYho1JkqY9U6MBO0hc7bFgwNQ/CUbwvnFpbYn
         Iz4zWRMNyEdPr3V+HRywycGcrFbabaodsVLVLHxnnH+FqcNbv+vJfcqltvHeOBZsXoQ3
         QpAI+KaZB53bKLJpgVSgDGZvNo7+uNzYln53RZF8r/KRoqLOcnfj8TA93Z1gbh3pkW/G
         z1yA==
X-Forwarded-Encrypted: i=1; AJvYcCURjEMinfK68OwBFPdE2hbznqFSopbl+F6HJsAPYd++PWpgQ+6I8I7ArvKhHv9waastvEju8IasQJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpteOZSto4wJuzu6yc4gqG5cU1cYFDjtgGuKVdek44d7hmdasY
	ZSS9swloFKTeZaRD103eglr0RRAlY1aPbQBSg/rYd7dpRZLnIZH9qP6C4XsvuwCKCHf9EggsAe8
	g2YeSKMxihPYo7pL6VFk0GQovCUDlykY+1TJRvENIjgY8Kc4gQ1lcwxaai8lMBw==
X-Gm-Gg: ASbGncvdr4Q7PNro0KJtm6nMPoEqMfJwu9oZeWKrvC0C80fDA1sd68Uh5n89FLNDPO2
	MGiQ3EJaEXwfLOy/ahMGFXYhwsEvyIz+zAu3f7S0bjzbMhKN66/9e7zfq8ot+BgVFbCrG2ExbWa
	mrWq1hce8+g0qfVre03behuIHImuTJvbfjTdsgFAgKAsfuh9iavPObGcaeAwbbwtry6Day6S6XF
	KEFxth8QqnDiDQcAo015/s/4Ewd47zTIOKnrvKNvrG7pz1l2CNLfQ0Igzk/FWA4umLcp3zKIY1i
	7NxlUa1TvWMwqNZDCvJXy11xlj9xIU4yDoxayY4s6GVDSi4Kb9w3feHzlwJc
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146541cf.7.1752160879130;
        Thu, 10 Jul 2025 08:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYaK+S6nKLNB0+onalYZ18FMGM4SU1Pk1Rw8vuZDxj3sx1uTSsbM+HxfhIu/O6GetrMHApA==
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146151cf.7.1752160878737;
        Thu, 10 Jul 2025 08:21:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:30 -0400
Subject: [PATCH 10/15] rtc: max31335: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-10-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1704;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=UPXy6/C/RD79zBD8+YjC+4PQ2wHdzGnij5BrRNttYFg=;
 b=VczBglJXF7c0OhaNV6IcNJHendkDjPzxJK9SOdtvRnVBdd83JQDd6pRndtaJb0pB6PnPQgE6n
 YzmdtsurZ5VCbLJUyfz/1pItIEplDMwKOk1THQ06/VWvI4nd8eqLOL0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-max31335.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index a7bb37aaab9e6e315db70bc6bc0dbaa553fdecfa..dfb5bad3a3691d0968bac78cbc9d54a2ea7662ba 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -497,15 +497,17 @@ static unsigned long max31335_clkout_recalc_rate(struct clk_hw *hw,
 	return max31335_clkout_freq[reg & freq_mask];
 }
 
-static long max31335_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int max31335_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	int index;
 
-	index = find_closest(rate, max31335_clkout_freq,
+	index = find_closest(req->rate, max31335_clkout_freq,
 			     ARRAY_SIZE(max31335_clkout_freq));
 
-	return max31335_clkout_freq[index];
+	req->rate = max31335_clkout_freq[index];
+
+	return 0;
 }
 
 static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -554,7 +556,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops max31335_clkout_ops = {
 	.recalc_rate = max31335_clkout_recalc_rate,
-	.round_rate = max31335_clkout_round_rate,
+	.determine_rate = max31335_clkout_determine_rate,
 	.set_rate = max31335_clkout_set_rate,
 	.enable = max31335_clkout_enable,
 	.disable = max31335_clkout_disable,

-- 
2.50.0


