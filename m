Return-Path: <linux-rtc+bounces-4466-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC0B0067D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256586419BB
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F1279333;
	Thu, 10 Jul 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="agSibTV6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95E279334
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160888; cv=none; b=tQBVRIQqz3OWiuWc5h+qpAWNJozOo0F2A5EdbIaS9mIyJPkO4nNOQNfF4UWeC+RMois2PP1kE9lwCcueFz27GkgoRy0JgaQXUvrjls5r9scmWwUKyAGIdur3N1c32HAh1CaJ/hrs3zjjTfkGm5uLw5CHN84R550k9H3fmPXvWm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160888; c=relaxed/simple;
	bh=CKo9LaRRqcp1kervDO8TcSEMoHxesfYK30Hcksflj70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwukLoGKcWTMIxTQ/Qu6Ck10eYrKoYc15CHOPdtLrAhAi/QkEs7rQ/2XMp+7j53Af9p2ho677vbt8HnaAdxxC6+tK/lGvrT8d5UEkrAu5cqzLgMqgMBnkBR793Qz1Oz8SSIWU6w9ZqZD31rMfAYDunvzmJAFmIN+YiWAqLuGmGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=agSibTV6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
	b=agSibTV6pMwZOo/oBUfRuxu7MsCoTpGW0QZ+WqY0q5S/bcrZ2OsDp672oUodYfPgQoBDrQ
	naW86nAGk1c//WUzT1RGfCiIeoaDZcXoKZ2Ry8V1p2BfOcS0mUFbt3aPLyJhwdyt+d2di1
	Uiv0kNANgbD7SDj3jjLcQO/DhynjoLs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-XTc-7WoOMSOFgnlmLXrSbg-1; Thu, 10 Jul 2025 11:21:25 -0400
X-MC-Unique: XTc-7WoOMSOFgnlmLXrSbg-1
X-Mimecast-MFC-AGG-ID: XTc-7WoOMSOFgnlmLXrSbg_1752160884
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6ef72a544so24938231cf.1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160884; x=1752765684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
        b=OFqneqaeyD38tzEPjLL8BdS8MrBaV6BMPezvJKdeRXMcfKziobg3cYgsoa4ZFgThoV
         D/Z6LuXOwfyd5klVZ/rT4PlIwVXndcf4elTyswrd+Yj9oBf0UWA7f+5KBjJQ2mrZHKiQ
         Qmxft515avW64MGdvWjJt04spAjjOuU7s94RbgchjpkfAGv2ZLPR5Jn+BSk3GRSiy6tO
         oBwAM6zWO8AkgLSKQVs1mVp6/LtqclrXsSVm/lBfxPd6IsjEAu7MiNjIP/D9WsE1drKa
         ajdEJ4SN8rKONKOwPRucWBN9Pw/hyEJZbNevLDFOgXXPL/zKPO1tKKZvOgfPa8j1lLyZ
         UbUA==
X-Forwarded-Encrypted: i=1; AJvYcCUlGKe+p4ui0hU9AfCVAiFEioJfmNlyjKlas3R83pBckrEqCEUVkbGDJnXHiEbAVVrCoOg4gFZdmP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGBJvqysh+uUf3kJbkofIiGJ/nm8OAaZpwv69cZ0zk/CTu/k9
	7V+TcNveocGI+DeCz7zAZyNW7JPhCO8kTuBCbu+W41Wjco1QUEOx0C7uMQqqQUR/S1/9zMElQbQ
	Sqn+1HHOM4Jm0VvWV4cnz6I5JdhslLRKb0MAEliAfT6mMfh38XDGi4wz54HccdA==
X-Gm-Gg: ASbGncsveVL8gtjGDnXby6JubM0krSOee7fOj+IfAreoJ2ErtXjyFAU/nwp4JisLOsn
	ilQGZy6jpEJ8NobtjovVNIOobo41eVqceDUdcMSyhEK1Tj3SujhQm51qkWA4Bkdbj9kWNYcWRIc
	3r7/52gYFMNdi4vwPfjCDsRekd4+hniF8mvNjDwPgf2XyNaZVc9BfDlBhTnqAo9WRJoUKFsAWYq
	RmZuZ2NOg2AT4Q3oNx3EwqF16YG5Exg5E3X/w3q9F/nqhjFdUOJp4ijHmBW6xcTXxqNd4Nieksy
	vGLlHbuRh24nMlYiL4ky9UdhgM9csMygnYsdAHpX5c0LIUHwc9oaUExgtkD+
X-Received: by 2002:ac8:7dc9:0:b0:4a9:957e:abfa with SMTP id d75a77b69052e-4a9ec768310mr46701551cf.20.1752160884359;
        Thu, 10 Jul 2025 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExNE2eoKe+QdzlIFX9zvN4NAZlfmpgtS7RXKYKxt1/AsAPcsp5gHofzn/kMZ5xQTYoVqGvIA==
X-Received: by 2002:ac8:7dc9:0:b0:4a9:957e:abfa with SMTP id d75a77b69052e-4a9ec768310mr46701151cf.20.1752160883963;
        Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:32 -0400
Subject: [PATCH 12/15] rtc: pcf85063: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-12-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1678;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=CKo9LaRRqcp1kervDO8TcSEMoHxesfYK30Hcksflj70=;
 b=9VCibQW5+lIsm2ZJtIf/1irsi8yh8liaiSDjxvieKKChnEbb58K3vG9919ehBKwAvx8GcyTT1
 a3/d+7m2/QtCzE6zvrB6HQv5fQ3ZG9FGj7pXg48gJgO0YwcR8r1xjEv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf85063.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index b26c9bfad5d9296ca8d2be3b5ecb04c19ac97191..779fd627262bde8429ae48735ca591747f871025 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -401,16 +401,21 @@ static unsigned long pcf85063_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[buf];
 }
 
-static long pcf85063_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int pcf85063_clkout_determine_rate(struct clk_hw *hw,
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
 
 static int pcf85063_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -482,7 +487,7 @@ static const struct clk_ops pcf85063_clkout_ops = {
 	.unprepare = pcf85063_clkout_unprepare,
 	.is_prepared = pcf85063_clkout_is_prepared,
 	.recalc_rate = pcf85063_clkout_recalc_rate,
-	.round_rate = pcf85063_clkout_round_rate,
+	.determine_rate = pcf85063_clkout_determine_rate,
 	.set_rate = pcf85063_clkout_set_rate,
 };
 

-- 
2.50.0


