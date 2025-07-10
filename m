Return-Path: <linux-rtc+bounces-4461-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717FB0066D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 314E87BA15D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165A2277804;
	Thu, 10 Jul 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYRaYrsh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609F2777E1
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160876; cv=none; b=F9cVH/saato34f7+fkaje2csNCACX53FkjBqFj62/Amytyl7CUISMlbkD9NMVvSszYnYDUJcA+0TAFQdocGDC2xyjPKsYV+HNtzTZgaXyT9w+xK6+Y/YD/cKphyu8J9b3SrlSrtMJUK1kp8OUdbP9mYdP3WCgrY9bf2uR6fx8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160876; c=relaxed/simple;
	bh=4BgFJNK2KApAx8BvGXfufY73usovEfW4jGfRZpX6CSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/2CO8qKy1fCUXoec04XsWS3ek8F/uWX6GKCDPSEphQVTsrAO3uRagrweXZ4cBgJ4gHc/ODuaAdNLGY2nij3Q2uol0PoW6z2vYuplxZGw1BJCaD20c9phKOdRjVYl8927F3BfopvSy5Yecxzpmz5Yxql0sBOPDacAQIBEAeqZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYRaYrsh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
	b=EYRaYrsh9XsXUqUzH7OukTAHoFPnIqFEGnadgpHXOZJnBjWOAzuUyjD6p+sbL8nUZ5t4Qg
	KllvqJp9uR0d8dl6q1PVxHCRrET2pgSAix9TcFGXhKz57anH/nX+1gCiBXqP5GbimtRFEq
	7Q4F5f5l6wG10wGjl4zE6bxTtEe5/HE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-oXN0rXAyMCCPGWgqdZlqnQ-1; Thu, 10 Jul 2025 11:21:12 -0400
X-MC-Unique: oXN0rXAyMCCPGWgqdZlqnQ-1
X-Mimecast-MFC-AGG-ID: oXN0rXAyMCCPGWgqdZlqnQ_1752160871
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a6ef72a544so24934661cf.1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160871; x=1752765671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
        b=a0I2NMoT7n8iRBdcfZ4+3zdaiAznB+K8MvjnFisXRyhI2N4jp7Sr0uPiFl34XHE8+4
         3VxKW0eRtqqlOQKNkalCeyWnpjgvGJrPOBX8qkBW1Vmb1J7PV1LhDOxkJ2mCcpmK7ivO
         IlrbxVRWVbdPbbsyOiC4GtFt6s6E+B1A+exZKyX3SgICdTbVvsi31xFw81u4nJzEqn16
         TFzXxonBlqJG6RXIO4TDS3sfEqNGRJ91xNYSC3iD0l/boSjObwJQcQ3DBKe2OAdiBnNX
         p6S7IaqJuR+q2lIIQ0KVEj3vcgDzSc7a0u/qpkybs+GnzBWsoQqBCwmdtmpr3boqyva+
         xvcw==
X-Forwarded-Encrypted: i=1; AJvYcCW8xRPChUO1eWVf/V2AapUbjYm2T+CwRx35J9ufYNOtcxVKNtELPqRlAaQl98Lzcoz4YMY5DYoeIiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHGXKHbV2BBp+ek9oCvYzY17Rx7Lch6okt0zIKZZkjdBQRlBx
	erBVUo+gFg+Di4MrKAML2rLbqIcZB6THwn3/E9eRDPOB5JUZV5Cig/i55NYQj2cNkZsfRM4nGDx
	wcKvNRGk9jB1ijCVtJNQ4JC6ypxoMsSP4pVzrBbOOiicXyuF3zCiCCVqdtFew0A==
X-Gm-Gg: ASbGncuUlO0awjjSR9vYK08mJzhAwuWpWs9H+AG7AtTRNvwarrBb1SvP+4bJAZ7pdRA
	68cvEz8ey79GxSQLIlBwE03xDY9TKRbPtvnYEkbqjoFossZ4n6jC9sKKXk56mxQPd1Bkk3sjY3u
	w6nQ22uASg9ofXbNIQdAepVJ+bsUZETI76jFwdDASFbU01iAXWRimmO61wsAIDOdpp4eux9ibN6
	DmZnNnv7OoKv1iybp59LmHBf6O4gC3PZ+KlHCOtefQqcYDcOzCosx8DN/ALTkzVPulb/fR0ht5Y
	5zshp6lObFfnB/tOypZVnqFlaJUeOCqqB+k/1XCrJ95kS4qHHLDojDDJudhT
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45147601cf.49.1752160871481;
        Thu, 10 Jul 2025 08:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLT1XiJrU+UqNY9Ntq3luY8jImtJ3Zw7F09c9Cj0qnJVdBHLwN1EIzNkD/8bD8ThuDgwCtJA==
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45146771cf.49.1752160870836;
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:27 -0400
Subject: [PATCH 07/15] rtc: ds1307: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-7-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1810;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4BgFJNK2KApAx8BvGXfufY73usovEfW4jGfRZpX6CSI=;
 b=gO9ysBDglD/2ypzU7AUASOweu+17QRdU21E2uZnqmFKCHQ+Uy7Pcv2JFbQadunS2Oz2cuRLHO
 oMy1rC7ws2ODWASKzDRAvMEp2urJXIZdGJLVZN2+KQPl6b+ZWpTWi8t
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-ds1307.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index c8a666de9cbe9163ab7e112b01b99d97c94970d3..d9d0e482b5ea9300ec9d7e77e4c3ec531b9df867 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1456,17 +1456,22 @@ static unsigned long ds3231_clk_sqw_recalc_rate(struct clk_hw *hw,
 	return ds3231_clk_sqw_rates[rate_sel];
 }
 
-static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int ds3231_clk_sqw_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = ARRAY_SIZE(ds3231_clk_sqw_rates) - 1; i >= 0; i--) {
-		if (ds3231_clk_sqw_rates[i] <= rate)
-			return ds3231_clk_sqw_rates[i];
+		if (ds3231_clk_sqw_rates[i] <= req->rate) {
+			req->rate = ds3231_clk_sqw_rates[i];
+
+			return 0;
+		}
 	}
 
-	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+	req->rate = ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+
+	return 0;
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1525,7 +1530,7 @@ static const struct clk_ops ds3231_clk_sqw_ops = {
 	.unprepare = ds3231_clk_sqw_unprepare,
 	.is_prepared = ds3231_clk_sqw_is_prepared,
 	.recalc_rate = ds3231_clk_sqw_recalc_rate,
-	.round_rate = ds3231_clk_sqw_round_rate,
+	.determine_rate = ds3231_clk_sqw_determine_rate,
 	.set_rate = ds3231_clk_sqw_set_rate,
 };
 

-- 
2.50.0


