Return-Path: <linux-rtc+bounces-4465-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83FBB00683
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74DFF16E8EB
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28670278E7C;
	Thu, 10 Jul 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="II7ovu9h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF904274B5C
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160888; cv=none; b=P57hNteoVoBigSlkvxWVT/ntpGZLYxonbioHQ5PxjOLZhVmwy2wXbNrmFCcFo1I3JM+hTy/PmpfsZALOQE4TWwFc+WxwER5ldejQekOSEy/Eon8GjuiUpSv/tETHwAWnw3JDle72CvIq+XywJ13M8rfvU/rciNz5Rfdc+ol5S6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160888; c=relaxed/simple;
	bh=n49+tG0DWMRf1aqATyzqFiQzu9HDymGoH2RU27/qnxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kx4POSnG0pYBgKBHtib8uZWXHIjStHNdxBKWpm8s0EeAeXmKfUJCWiyNuQ7NYSqR/MZKI1BvHGhxE0GXu6WNzaivUdc+UgITc2qeCiNzrwsRiLkwuThVFNYxhEORxXU7/u4UTvbejL6gXpDtTaqa+11UbuVZ71q29reepQcKzHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=II7ovu9h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
	b=II7ovu9h2AwFcUppAJbPSch4u7QDjbTTF+JL3X+H3s1vESjzahTSkXbHN2pw/wf4GiesB6
	5yipO25tDbp9iZ/kKHVEMoDgFfq7xTjt+Or8O2lEA59iUvCpP/Dw2QbNH8L5MlSHcVhlZG
	8Yo1DtSJSeS3awvlFIF1kXH80628ZrQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-zZcCy5xhPyCV9y4D_Jga7g-1; Thu, 10 Jul 2025 11:21:22 -0400
X-MC-Unique: zZcCy5xhPyCV9y4D_Jga7g-1
X-Mimecast-MFC-AGG-ID: zZcCy5xhPyCV9y4D_Jga7g_1752160882
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a589edc51aso26316471cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160882; x=1752765682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
        b=u5WYp/dvV4hOEysiFBMSShf4JlfzS39nfiAG96qkwbDg+NpbdInJ/VKeuRCUkeONwW
         hHjodZNCRPlS1RikTfmugxTPoU5hcUp8N207mDHHE24eAEJVuB4MQLNymFi/QJP6LV/g
         YXRPHqPnItGSzUGgKEfQ37HUgBZUWKsxL6lPLXj3RJ6ZBQwQaalwJpLemATnZth4SWCr
         Zx1/XQu0EsXGj2UNcjHCB2fHoIWEGbwycJdfBM67rxJKzFXqJ1PSF6U7SorehL6nRVhO
         +P5veI7CWt6DkicG1ItDtRfvxPqkjJnhMaF/OHz3X+RJEahF+if2I/GZo6gV+9HwuPv+
         OdOw==
X-Forwarded-Encrypted: i=1; AJvYcCUnsWJdh87goSgWpq8OQH4rw5NMVBOTspiG65Ho1b1FdBcPlTJvzNf1C/V2UE2XsX1cxEW27FQIJ5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9Q2lGZN2CN7wwZ08rG7btYYdxvZ5U6q3Dtr0945Ov5jKkr9A
	6o/k1sJT0aopjMX1jeeKC3mQaB7QmIKYKMpDzHWckZHdShnpM2WSJo7RuCB++Qdzu4JzZF+tMbG
	sr+cErHynB6SMpgy8KPS4ushWtjyel4g7n7ff8BcGbd/EM4zCO9plIY4FDQKIxA==
X-Gm-Gg: ASbGncuTC71z47w2DDPgqH/qCp4tpgjUpHEkWhqskKjadPVn1wd/fitwJ/XEvt1JaTM
	M88KUwaBYtOCD7M4qqrJu/FoumPQuKvCDWsyV4MP813hm7zv3aR2eOVyquOupwyOOm6sx8HeyZ5
	QvDcguVzwbvcGyi5wJfWGcHnd9yFdZk3Qh5ITEONFC17X2JlIk3ior32ku7cFXR1Ep5A8PPruDB
	e/D9YD3RndJgpbSMSQPlJ6sn0Lf0BXNW6SlQZ+YDPaUzgbrmJ+ULPKhyyUNd1wE5av1ceS+KF2n
	fxAOyLQKN+U853j+wU/fO+O/Zdp6FfTZ9+KTboUK3ogkd5L5MpfH04xwpo/L
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23115531cf.50.1752160881820;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/1O4MLvOzk7gKxJZFO5slOGKTVfTHOFq+wSEYq355CZZ1O7svKyn2khuzgSoy03/2j0xmxA==
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23114911cf.50.1752160881463;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:31 -0400
Subject: [PATCH 11/15] rtc: nct3018y: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-11-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1680;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=n49+tG0DWMRf1aqATyzqFiQzu9HDymGoH2RU27/qnxQ=;
 b=P6B78+RNiRcz4avwFwJ8Y49o2kiWmwP4zkdeQ/qf8zNH+D8uJk3HIGRZAfLT34wdb2ZKqzKoE
 pRY4BcYTZNGDdsBg2fjEfI6IUZY9CLR90bRG/tlSi/EnUAB3F5vgkHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-nct3018y.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cea05fca0bccddc6384c462cf1ebdc59b377a24d..cd4b1db902e9f68781787236bec56c2cae8436ab 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -367,16 +367,21 @@ static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[flags];
 }
 
-static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int nct3018y_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
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
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -446,7 +451,7 @@ static const struct clk_ops nct3018y_clkout_ops = {
 	.unprepare = nct3018y_clkout_unprepare,
 	.is_prepared = nct3018y_clkout_is_prepared,
 	.recalc_rate = nct3018y_clkout_recalc_rate,
-	.round_rate = nct3018y_clkout_round_rate,
+	.determine_rate = nct3018y_clkout_determine_rate,
 	.set_rate = nct3018y_clkout_set_rate,
 };
 

-- 
2.50.0


