Return-Path: <linux-rtc+bounces-5710-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3437D063D2
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 22:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C852B303E290
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 21:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809873358BE;
	Thu,  8 Jan 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKV83+e1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hpx34d36"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B21314B6D
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907052; cv=none; b=iF2eLNPPHbJ2VsSDbKmjboY5GaN9/RB+4UG+iP1l2QZwc93ujwHgLjzSQ4Ff3aj7JaUmrQfxih3Ygv/IuMysq34RQaqe4ZkT7Plltq5BKzNJPFmv30heePodZbTVdH+Y3KcIBG0tY3AeQxro4bVRE/bd+8bdOo0DZ/2yW2yrzEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907052; c=relaxed/simple;
	bh=umRDO+6LfN/287FxKKSUjyAEnGgbqrwJmKxDM5IJEb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGTcTooFoMAUSDYhxU2HTXtwVsR8Xnqj5L3D9O6U8Gy/77knTDYjZgLSLcwjP6Al25yaeMzYmVqyO/Un2RpesoZQsPSUVVYpMiIduAuoICOSLUoJav+nN9jCa+i1aM5zdYONOTEA1F/dQG6+GLFdxMk6I8QQCQIYnVONtt5UbhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKV83+e1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hpx34d36; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbe/XApWaL18q7zl45yn83syExfCEwt8uiod4ciQGmg=;
	b=UKV83+e175buGFTK2k7UuYhQ6JR4ekrH/L4BG3d318hJkwABXq5RIT3kyUU6K55YxBg9vx
	Z2ukEJeMYhJdlfdmGJm2VxXyDQSmBgt7qO/VXXS7Z67F5L0iD/N0JPJgaQD26OmMmieA0T
	cgM7edkO/ulMRiWU4u8Xkt6uwrKcL08=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-uHm74Kn-P76fpNoKnyc4jA-1; Thu, 08 Jan 2026 16:17:22 -0500
X-MC-Unique: uHm74Kn-P76fpNoKnyc4jA-1
X-Mimecast-MFC-AGG-ID: uHm74Kn-P76fpNoKnyc4jA_1767907042
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b0cfe81afso8708963e0c.2
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 13:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907042; x=1768511842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbe/XApWaL18q7zl45yn83syExfCEwt8uiod4ciQGmg=;
        b=Hpx34d36BMQtdTJP3jdsuAgrOupkSOL3kdRClqW6iwjD5Aep3DdV8z6nXakM9u5VNj
         3n8BQINQAcCST4JVRwwmXzIC1lOmehylfv129hrJCVUwiQlhOH5WytPu4rfz0Afp3w6v
         0Y2p5cShNWdmWcO9GbUW1jm0522Yr47+BrbzfuCGFE1/q9/UBiYkxzQR7OWgb+sb/N/M
         IWyCiI8kidkuVU97dX+FT2yt5LrBEJAluChZbY2fOB2bAXMrDwbDa+q5D3Y/XWwbC2Gi
         rXxzC9m8ToBVPJaFNg9tVGqRX/LApf1xKHrSEzdIujtjlAB2tHxzv/lkM2SiKRoYkD2j
         7gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907042; x=1768511842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbe/XApWaL18q7zl45yn83syExfCEwt8uiod4ciQGmg=;
        b=ol/4Wl0vvXEOhOIXIGJtSEGKLIxqb1F50VWzzLGo79/FEjt/nYjv3X+W29I/pHs8/c
         6ejQTO/IXb+O1gqGuh6EEFNq/BRLpOHCRghB8ei2J7+sHUMnt5mIF2Jab0x5nres2nE8
         xQcBNmdFUreo9uAi9bgEgxwBLEVGzZDBR7ZXeU8L3atrx4eCbxrQKlgiUdur49u1hqfq
         GQMVz0V0YL9Y3MNs7/EoYVA98GU3IWduIo8Z8mzaviOPIkzxS0CBxPocFrH0INjExybv
         e8oUXCrnDNb3FVjUxZ4i5+NEkPB6seMyVsiwTgkw+XkGiTEmevoEfjosrvNa/7Mg3qwJ
         j1mw==
X-Forwarded-Encrypted: i=1; AJvYcCWt2raqH/23zzBBaO5t9X9XgxRjPhSK2EHwwGTFf9bR3hbvZ4udeR3ukaRwxACRJBGof/gcDEF2TdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVnS/OqHzNqHyv27KWB7Ybro2rXm4dXYvTO7idfZB+glfe3Pt
	no+K+sfVzaKGLCCjlHo6C6jmu+ygHC6pxuLpOObA4QnkSnjFcPoxATHS/jkHgNyWvoql5iQkEDy
	XKTcx+E4hAIqD67vbCSU4KZyFBFOWw8A4Lk6XGW7FY+Ev71Qy4d66BxiN65srww==
X-Gm-Gg: AY/fxX6vkEVsFD412A+lGFY0Rh5AYL0tdJ0l4DIPW9TzdR8Ty2D/iPKTJ/BcJ9FeWrp
	foIB9sTQNWyFmAahdAG4hvlMPGyUwH8kSef7TzJZSlrJmD0oRUbd4LkAIbxb9pUW+5JLRGWWr2/
	tYIjnLghin1Yzils6J7/22NxP5dFdc4yyWrWMENgiYhFLY14G4VmISfplC1qu/pUWp83OFjIOBc
	1ZbQvPhVAuKkaC5EbMjbIkq1C90/Skip0xenv5jBbMOkRgTAlYXWqZ0RFhSd8FHtlr1wVwt08F2
	Vkc9oQRNLZHtEkGB2vr4ZhE/fq8gtWYHjvhgORMeeurRV2kwqI11t0mrbG8opacqNJpgTlr+RRf
	g8himXgpo5gCvP2I=
X-Received: by 2002:a05:6102:2b8c:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5ecb5cc3249mr3338019137.17.1767907041730;
        Thu, 08 Jan 2026 13:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1x2+oN44SwRZMn0neR813HW1d3t12U7Ab+i+v/CBEKCDCYY1jODx5EVkgCHegnuNvRsKGvg==
X-Received: by 2002:a05:6102:2b8c:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5ecb5cc3249mr3338010137.17.1767907041324;
        Thu, 08 Jan 2026 13:17:21 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:20 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:21 -0500
Subject: [PATCH 03/27] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3747; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=umRDO+6LfN/287FxKKSUjyAEnGgbqrwJmKxDM5IJEb0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LaFZDw2enhddVtjCv8tt2nNjHNUwns4+26Fpf4M1
 Vvt2DK3o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIl81mdk+MBgZfzn+rtk206e
 ieGnNpXUFXfJRe2ZNqXnn/jmGq/9ngz/A745NDB/ZIqY4Ze9653w6RrBIOs0F71FG86mKx7ZqBD
 OCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 33626311fa781b5ce90dcc472f948dc933bbc897..16aca4431da8c029e6195d8a3c9fe75fa95d0bc0 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
 				   AC100_CLKOUT_DIV_WIDTH);
 }
 
-static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long prate)
-{
-	unsigned long best_rate = 0, tmp_rate, tmp_prate;
-	int i;
-
-	if (prate == AC100_RTC_32K_RATE)
-		return divider_round_rate(hw, rate, &prate, NULL,
-					  AC100_CLKOUT_DIV_WIDTH,
-					  CLK_DIVIDER_POWER_OF_TWO);
-
-	for (i = 0; ac100_clkout_prediv[i].div; i++) {
-		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
-		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
-					      AC100_CLKOUT_DIV_WIDTH,
-					      CLK_DIVIDER_POWER_OF_TWO);
-
-		if (tmp_rate > rate)
-			continue;
-		if (rate - tmp_rate < best_rate - tmp_rate)
-			best_rate = tmp_rate;
-	}
-
-	return best_rate;
-}
-
 static int ac100_clkout_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req)
 {
-	struct clk_hw *best_parent;
+	int i, ret, num_parents = clk_hw_get_num_parents(hw);
+	struct clk_hw *best_parent = NULL;
 	unsigned long best = 0;
-	int i, num_parents = clk_hw_get_num_parents(hw);
 
 	for (i = 0; i < num_parents; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
-		unsigned long tmp, prate;
+		unsigned long prate;
 
 		/*
 		 * The clock has two parents, one is a fixed clock which is
@@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 
 		prate = clk_hw_get_rate(parent);
 
-		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
-
-		if (tmp > req->rate)
-			continue;
-		if (req->rate - tmp < req->rate - best) {
-			best = tmp;
-			best_parent = parent;
+		if (prate == AC100_RTC_32K_RATE) {
+			struct clk_rate_request div_req = *req;
+
+			div_req.best_parent_rate = prate;
+
+			ret = divider_determine_rate(hw, &div_req, NULL,
+						     AC100_CLKOUT_DIV_WIDTH,
+						     CLK_DIVIDER_POWER_OF_TWO);
+			if (ret != 0 || div_req.rate > req->rate)
+				continue;
+			else if (req->rate - div_req.rate < req->rate - best) {
+				best = div_req.rate;
+				best_parent = parent;
+			}
+		} else {
+			int j;
+
+			for (j = 0; ac100_clkout_prediv[j].div; j++) {
+				struct clk_rate_request div_req = *req;
+				unsigned long tmp_prate;
+
+				tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[j].div);
+				div_req.best_parent_rate = tmp_prate;
+
+				ret = divider_determine_rate(hw, &div_req, NULL,
+							     AC100_CLKOUT_DIV_WIDTH,
+							     CLK_DIVIDER_POWER_OF_TWO);
+				if (ret != 0 || div_req.rate > req->rate)
+					continue;
+				else if (req->rate - div_req.rate < req->rate - best) {
+					best = div_req.rate;
+					best_parent = parent;
+				}
+			}
 		}
 	}
 
@@ -213,7 +214,7 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 		return -EINVAL;
 
 	req->best_parent_hw = best_parent;
-	req->best_parent_rate = best;
+	req->best_parent_rate = clk_hw_get_rate(best_parent);
 	req->rate = best;
 
 	return 0;

-- 
2.52.0


