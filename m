Return-Path: <linux-rtc+bounces-4468-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B67B00685
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6636439A0
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A823279DAA;
	Thu, 10 Jul 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNYuRFz9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E3E2798FF
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160895; cv=none; b=cuvcaraqQbtWGOkT0pRPMMZ1R8F4x57m3p1TP/vFHjGAYFdWVmngjmU0Vided7DewHrguKoZ75ZBhCD5EgjjKLXOPM8Ki1BDbQ+Y+zLlClsCYualjFQ3C14+qInLTv/uCudifa5TL+s1UdbN1ARBFUYidK8GZmW/1CeYh1vhpw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160895; c=relaxed/simple;
	bh=1K6+kw78MFrCZuqcS+uDVaMjkGSwFqJNnx34G76ScJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3OJvgzXa195t+l88p7ewW6siwf4g2I2tfpX9iwm7K8+uG7CpSF5OSJD3n4Pcvuc5jJ9uV/5Ok++/MGeHQQkrcnzMrNr33NO3MPE1MOPv0QXE73J1aH6GQ70zSmfE23+cfGGqUL9/veilC0VEpFmdPkCsrP3QQYPF1U0awYL8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNYuRFz9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
	b=KNYuRFz9L60ub8CSLFwHUu3vpsezmpyNnheTpJAVZphV/8PBS7Bna55TwXWvy7skuXmIYN
	hsm6+l9mrYsdcp/HSc5wSh5lDiyC6x/Gc5BHNK+6gpxZtuZUMB9JjBjNTD5GhDErvwRAjz
	NpDyQeXGAmrd1M7HkJb/cazO0U868tk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-EYN2K6bmP3qdupMySMQe0Q-1; Thu, 10 Jul 2025 11:21:31 -0400
X-MC-Unique: EYN2K6bmP3qdupMySMQe0Q-1
X-Mimecast-MFC-AGG-ID: EYN2K6bmP3qdupMySMQe0Q_1752160891
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a77e31d163so10762391cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160891; x=1752765691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
        b=MOP7lJN1r59zHT1eeAcbuj4uLU6n6rFqPG6ks6TdD7S/CFlop67GROxDO/jZdyKC4S
         z/nxF1KFG1Q91Dy8e8mxpfccsQPGVVDcb7dHWzQzEAjbbBJc/UTmuPv+ZOYHKk5dI0rf
         wdr18wLxw/7PRjbE0n2I4vM1r1KPqgfIirU2OefgBC8p6iYJXsbMdEAkvi1K/o5eSTsB
         IYNeplzEqMytpLaPnrjG6S06LUccB1IY1ataPRcUAsk2y2b9mjG//eteQ/q7XWjFCOKv
         xB10bVSmQriz3deLasN3x7qlbhTZpKMCuk6q0ZRO6bmtut3MV8B48i+2gAzPwDqleX96
         1Z3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKW8SP2xPR18kRtinsLA35wFpRi4fPuNXIr2opOvePb9c2D/bHzesV7qv9f4EXfnU9MnuIdTq1mYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHrjrk/HTFPp5xxC2d5o+MdkAAQywEeUc137kpjsHwhTrpl+0
	e5Zgw8VJVFnjYyllW/JcbNQppRxaZU/bnqx8VdkxMRlzYZLezvOYW031nJtlMRVNTzURGiR8myr
	xurSUQf1I/bhYmAJgWbkwzOVPMWzjUD9OvaE5D7aHjFzeFjdIV3/yyrgfXg/AiQ==
X-Gm-Gg: ASbGnctHr1q6vLy/G0yZmHQZUEdi6or0FDZpH14Jze0jGWyJvWYtNfziz2t0/8BONSR
	y61coVoKKBdS9l80yswZhzAO9pEyPO6OTwrORaF0wCqqnc5mfIQ49VEgR5puC7m1SNKrhthgCTy
	wi+P8lGCT5vg3IPrQ97hqgIi4c2D+rPdiijmhtL2oSbcZbcslE5FNpudWqdGNVjDcPl4J3N0vzE
	aFpQ4Qe7I+R7vwxwmGmT8rZ/40sdOK1ZqUG6ZLAqNG/Lf/rXozpybg2gx9RLH86tCkScPBAsOr5
	uFmEM2WxnuqrHAYK7JawJ35b4iPnuFA5+n8ADk/knaG8vWySbq7+kNdzFmOH
X-Received: by 2002:a05:622a:578e:b0:4a5:afa8:b3f with SMTP id d75a77b69052e-4a9ec71135fmr53584791cf.3.1752160890232;
        Thu, 10 Jul 2025 08:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELn9Yyxrnbnbzv+8WIZ291jXoQKfvhFR4df1+Ujd1Pr0EttvM1cwH6sXYLpUMcViqOsgHoPg==
X-Received: by 2002:a05:622a:578e:b0:4a5:afa8:b3f with SMTP id d75a77b69052e-4a9ec71135fmr53584041cf.3.1752160889737;
        Thu, 10 Jul 2025 08:21:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:34 -0400
Subject: [PATCH 14/15] rtc: rv3028: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-14-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1645;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1K6+kw78MFrCZuqcS+uDVaMjkGSwFqJNnx34G76ScJw=;
 b=SGK3029kP4/euTyn5/BgsABWH/oduagDLrCnI0mn6/tcnTK4jthZhARW1z/WusOrcyzA0u+qN
 OAx2xRUZGWcBPB//y/aWqeri4puyAzBmXlLt3nrF5Xeb60q8feOxkwU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3028.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 278841c2e47edfefd339f04bf5193f6970ba0c65..c2a531f0e125be7514fb3ad2b11fdb670fb47a16 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -731,16 +731,21 @@ static unsigned long rv3028_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[clkout];
 }
 
-static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int rv3028_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
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
 
 static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -802,7 +807,7 @@ static const struct clk_ops rv3028_clkout_ops = {
 	.unprepare = rv3028_clkout_unprepare,
 	.is_prepared = rv3028_clkout_is_prepared,
 	.recalc_rate = rv3028_clkout_recalc_rate,
-	.round_rate = rv3028_clkout_round_rate,
+	.determine_rate = rv3028_clkout_determine_rate,
 	.set_rate = rv3028_clkout_set_rate,
 };
 

-- 
2.50.0


