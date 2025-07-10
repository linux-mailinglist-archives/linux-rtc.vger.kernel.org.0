Return-Path: <linux-rtc+bounces-4469-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 400F1B00689
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD5818869BE
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B532E279DB4;
	Thu, 10 Jul 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvzmGx1r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA0279DA7
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160896; cv=none; b=Mf2rzSbt+lPyNKuBMrDQWFAdrVu/2LLxvqYXmDMoWCpPWJyW3RhWrOgmrxdNJlyDOv3BCwFbIoQpYLGnfPvyYg6WXKU4CCEbEbpdNEBZddgks1iUFCNiswn2BYyuxp6sRcqMuDZmQuxUeAS6PhAfSSrwpEV4i10GbjuBXzbF0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160896; c=relaxed/simple;
	bh=5ZVOk+ZOrENo582GUq8LCq+7YYXjCzCCpjXuZ1lV7ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u59jGdI/dUGDOVXLTCN+2LCLuYwJyfn7DaxPbGr8KHj2qJ73Gu3vozkaCfgnn9m2PlrShValuiH8LbT8DuKcbp8JeGfDE7VpjGYsoc2dzYbxPMlCHYAshaeaJzpIDJ77k72htGhC/544cO7fQC45aLG6FK3S3T3Lw9Zq6yqfukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvzmGx1r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
	b=HvzmGx1rf/kP8sgfI8FKIroURiqe4k6998B4903i9wqmgxJ4jsqjgMXZBgvkA12R24jn/4
	X7EN7HS3uwN2rMX0j1BNu7v6Q/CRfommcFTAnCpS6Wbzrhz69WBeUZ8HHxIUzZbU5z8i0Z
	BnfelOnVgvqYNuNhI0GLr6E3fcrMJqY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-JSo-KXsDP42apr1eE-MLGA-1; Thu, 10 Jul 2025 11:21:33 -0400
X-MC-Unique: JSo-KXsDP42apr1eE-MLGA-1
X-Mimecast-MFC-AGG-ID: JSo-KXsDP42apr1eE-MLGA_1752160893
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43988c314so20372591cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160893; x=1752765693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
        b=lfC9lg3JchOeLvl2M172wqTVG6bMVd31ggr+GlEIxw0ilPwc0esfI0DQlDQ8D2Dp/x
         p25e2z764u8lbboVPhvVCIuhSujdFnWUzJajBG6z6fPUps0C5ttOvvOi5GD3T5ppDSBm
         uTW7OxLRp+3HBGCOJ4XuEMHdrprrtmqycw8sUq8rbc1DecfMVO3A+WF9W7b6E9AjIQWk
         xG6oawAlA7g/n+S6sKSHFuU1fyQkQ2oyGZ6Inmuq5sJo5YVHixrC9UKNRLepHlTxyQjf
         Z0InGomIOmHPkyxjX4bVeSsjY/EUxJmdywj/w2K+QkqaCs9qaLLPKJDHk6ZrZ4nQtBB1
         ovtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9SA0ZSORg/4gY1Mj8aEnr6t3SQopjG/NXzuOUyO8F0xFuD7jyH0DONi3nqKXD0wzeFtdytb5UxPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHPOxn8KXfzkXid5jwn7F2ZVJhQhAqJ4FXK4I8JZ8ymj68bRU
	27/N4mIBA5v2uhiTErd9rGn+VSKDn3XmGZ6XmEltfhTlurvOXI00R3T4dLoBTqc8bht6zd7ufrk
	y68Q7NGtFXl8W4EJ2NhhUSO02iVyYbF0psog9P0hEuFJzf1PcrB2KKIlFFOXUqA==
X-Gm-Gg: ASbGncsUX6ejq9rbJOGpHec4jNEn8RCJhA6GWnrdPDEQaKKm0QIyjw05e/ArH0h1a3/
	Z+IwFCWGVXPZn2hYNQreFGebEHxAfosDpBBOLlSKBY+M2RtyA6nRP6eYP3ze/wavdZSTfPLxF9e
	1nV/AtXe0pR1oNQ3/GRMnauk+A3zNSusQRvKY8+mD9gbW7RLVOGHa5XEzZyhHcv27tlNO4dVp2H
	C/081NT8OmlabVnzUelZBl2ca41fVVytxj9N/U2NCpSu8FL4gRPVNg0ymXTAK+6Pv37HM8Kt+p7
	Aso2vjHpGlGUXIf6WykeNKl8LOyNvfi25JEhvtJ5OqmSvnoX3feV6u94fxkT
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60788241cf.2.1752160892701;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEssxFzmy5DZaFLWrhwRKaLprHY91yPLmVxKn2VUF7H3TGYR0HmxKyVMLk0dM4mEtgHsRmiqw==
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60787681cf.2.1752160892253;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:35 -0400
Subject: [PATCH 15/15] rtc: rv3032: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-15-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1946;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5ZVOk+ZOrENo582GUq8LCq+7YYXjCzCCpjXuZ1lV7ck=;
 b=DT4kedVd9JHLVr7GcGFwVFd+HuL+eV6cYmrDz6pnKaO4779AT/8pJh1xVZGoHYgcUbXEwBISq
 HkwA/DTaq7wAhW2EXESEGcFAJ+P+8vXhpwlHpiLGX//6sA6oikBaxHi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3032.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 2c6a8918acba50e57ed923db0834c7c4620ef2cd..b8376bd1d905be63afbcbc688825c0caff74a3b5 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -646,19 +646,24 @@ static unsigned long rv3032_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_xtal_rates[FIELD_GET(RV3032_CLKOUT2_FD_MSK, clkout)];
 }
 
-static long rv3032_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int rv3032_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	int i, hfd;
 
-	if (rate < RV3032_HFD_STEP)
+	if (req->rate < RV3032_HFD_STEP)
 		for (i = 0; i < ARRAY_SIZE(clkout_xtal_rates); i++)
-			if (clkout_xtal_rates[i] <= rate)
-				return clkout_xtal_rates[i];
+			if (clkout_xtal_rates[i] <= req->rate) {
+				req->rate = clkout_xtal_rates[i];
 
-	hfd = DIV_ROUND_CLOSEST(rate, RV3032_HFD_STEP);
+				return 0;
+			}
+
+	hfd = DIV_ROUND_CLOSEST(req->rate, RV3032_HFD_STEP);
 
-	return RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+	req->rate = RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+
+	return 0;
 }
 
 static int rv3032_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -738,7 +743,7 @@ static const struct clk_ops rv3032_clkout_ops = {
 	.unprepare = rv3032_clkout_unprepare,
 	.is_prepared = rv3032_clkout_is_prepared,
 	.recalc_rate = rv3032_clkout_recalc_rate,
-	.round_rate = rv3032_clkout_round_rate,
+	.determine_rate = rv3032_clkout_determine_rate,
 	.set_rate = rv3032_clkout_set_rate,
 };
 

-- 
2.50.0


