Return-Path: <linux-rtc+bounces-4455-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7DB00654
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E726E3B065A
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D42749EA;
	Thu, 10 Jul 2025 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrkRxx9c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77F27467F
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160859; cv=none; b=u1FGKt2NvHaQrZszJYEi15u3i8tBF0e5xCA2VhKjjU40CQRpp3ugdtV9JEdRXWuFyV8opgQSx/jVHyB99IMAOcIXJA0hIJz5Vy6b4wvEDrUGS9oQ8fuLWEKfHavvhj9X0EiFM9axvg3rGw6DhlDNoH4pHkp60YIf4mjzjurhTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160859; c=relaxed/simple;
	bh=wnFIaXx40Vz/ClvnEh6f8bTkAdbeJwxG+N4rRNHdiSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SipKPUvxzrjBOleLcQFXtK/Mc0hHVY9E1DphQ2LFeu3KOlcIetn4crbBNBzGdqiu48G35X/UyTE4AMf+v1a2i4LXstZcbfDz8Unk2ZDeMxLIMpDnMqco0ziq/0JC8B6/JplckJzavkBh1FVmwOrHMZNmJjjZF6WkmpSjl8QBPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrkRxx9c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
	b=LrkRxx9csUNkBQb7nG+NYro2dI/ar71p3cmElZ8B3yQzG+LMYgBBfiARhYd+KsknVoqy5p
	rgZV97kCxOmqUUM+Ri/w+HV1GamZskBLeWLwLGgey9PKkwMgzgJT4G29pt22QS5+/fCCYL
	SyzeNUX5PMRMrP0kXW1IIcgc46w1/TM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-wnBKY_8cNrKMa-OOABk2Zg-1; Thu, 10 Jul 2025 11:20:55 -0400
X-MC-Unique: wnBKY_8cNrKMa-OOABk2Zg-1
X-Mimecast-MFC-AGG-ID: wnBKY_8cNrKMa-OOABk2Zg_1752160855
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a9af8a0e58so29607661cf.1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160855; x=1752765655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
        b=VfHWDnCCzHaFvpO7QN2kltWcCWWqUi6gckzSaHlOotn3WHOjwpdTvYpJ8odsHKURSj
         9ne5wh9jj7GXvWju5XMR+nJAq2J+Y6cuD7sHhjYAAtFI312UpcFrwcrC9EbT74SfpjJ/
         8oNeSLyF27N/K+3WHlB7qTxz+Hp6CYa5xquwGEbiZNhoS2AXhkA2s4kyz2Ca1YyfsJI5
         FU+Gk9f6YLsb+XS/HT9NxkFG/kYqV0DyfxzggEw5xMdmw99vb3ajZPibrKE2FZyThRYf
         GVN5Wv5lMoQNn3AS2UXSHRbcfKhE/mUIV7aGWQqTeRJrovWR2uTf5irkuqB9JyBo9/AK
         zu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDRUt2F/kiOsSlc++idilYRETe41ZoQgPYGV/g/Z/O86cmwaAuTOBJj7zA3LLG1I8kpXEo2H7o3MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoADnzYbZWi41dlXuT7hWc8Po+26sGCFNw5TCAdDT3kiiJroXM
	ecSGID08D8QEWGoUVPEIYkHY784EFUbBnoawN1oylOAhxplB2W6BTC6AUGPbF/AzrTub6ztsByc
	96bC5qyNY1tPc5cvkksYwWIywgPaUlu6XvR6GwsvMJHli4DY/JdBHQ1fRFEwN/Q==
X-Gm-Gg: ASbGnctk8A9l/8fyv6VGddOYyMoUKNzHYzotzzCIsnwwiTwhHrgN7VwQgp8tp+veDev
	qRsc1NmU/rYesPHMBl/XbafzND3xtVxvsYM7VvrY5CnI0yo4aHMMgPsOrFTWjxIGyT7WFU0BNIT
	gZN63vBULaQy5qU+sj+fR5J40sQ885GpRJnfY5fo6xXnPkYTxPVeL0a6IScISReyCgqpONC1YKH
	a67XR8IR9Gbzlj/i4G3zeOSYszTUsz2FSSCaadmB3jW74saq709wh4PxZOI4DHrPZ12ru0SFuoN
	wS61H0e46B9OFQCamYJxlRsCisEyP5/GqiypeGcNi4k+Eaaamj/5kvLxueua
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392601cf.29.1752160854890;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDLcNv2lDHhPRuPa3PBLGRvRknazi0MkGkMJ3jjn/hzszBgqiL8MPXlo3Ug0921v1/TzKKEQ==
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392181cf.29.1752160854435;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:21 -0400
Subject: [PATCH 01/15] rtc: ds1307: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-1-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1091;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=wnFIaXx40Vz/ClvnEh6f8bTkAdbeJwxG+N4rRNHdiSk=;
 b=+A8YUXgylGkUHOwIsLqyv4get20Ku0mnYqFwH3tYHrj3MlQDQaPOSNxpmXm2HBwGJcu7rJVBN
 2qwZqI6Hq0xA8ZZ0bQnzaWsxGGatsZPg2KaA+vl4sQUtpFK6xQIbwo6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When ds3231_clk_sqw_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 6c6ff145b3346 ("rtc: ds1307: add clock provider support for DS3231")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5efbe69bf5ca8cbc2a325cf2797afcd14f3760bf..c8a666de9cbe9163ab7e112b01b99d97c94970d3 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1466,7 +1466,7 @@ static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
 			return ds3231_clk_sqw_rates[i];
 	}
 
-	return 0;
+	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


