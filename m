Return-Path: <linux-rtc+bounces-4460-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19071B0066C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B8E1C87161
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544EF27703D;
	Thu, 10 Jul 2025 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iK+1TXej"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2206277020
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160873; cv=none; b=pZ/EzVHFYUGxXRbNp+L0UbAbgJDDFbtwdqrJijMn3Syzfl0a0KzI7EWs5ErSdQyARQCUVYb452GEwDHVTu07uExLjBF0egJe6ltS/fJ4gSvYoVht2Q7Z2DLEywG0w+DCsG7qFzgCzKdnwu65bmoB98XYvcz7aIhWX2LgiBjOeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160873; c=relaxed/simple;
	bh=y+AZFWJL051hZPxzrLPHAl9zoCHqdwam8bIR61IfRhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egENRVGqbk8xd0GOO+cqXqgxBziCnjo6wgLqoNgeSOuCYSVfVC2HJO3W5JKj9IvUAJ5UaLZpe0QqQhTK7vJsYQs6B9QsF+UaDOjs/pw76xjQwQLoNfYkmQrqw0ZezqWJivBc4vWgsbcjI6D3x2h53GC+FzjWwp3zJUmEkUek054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iK+1TXej; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
	b=iK+1TXejIWMMEsCwUtM4YYc+CqSZh7IfLxrcsuoOnnupsXKtlhYehso3FnHWrm/i548Pou
	r1YGwzhAGcrN830cdItmcupd1hzqaLJBX1LRB/XHKYILV2KVaq5sOaD/+v6JhlgsyAA2OI
	uYNnB7nM6nE4pvGJoipvXXR3zVYeP3k=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-GLt_QBSGMOi4ma8cG7muTQ-1; Thu, 10 Jul 2025 11:21:09 -0400
X-MC-Unique: GLt_QBSGMOi4ma8cG7muTQ-1
X-Mimecast-MFC-AGG-ID: GLt_QBSGMOi4ma8cG7muTQ_1752160869
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a77e31d163so10759071cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160869; x=1752765669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
        b=PUq3ZkLCBieP26bgZ8+85QddeBuIkuBN12cqGxgUTImlXWKO2WafRmwZsBm1BtqxYh
         movckmfzUczFwWHUyS1bQ/xcWxwp9NkpS3KOdrDWdvHYnvswlpLzc2AYLjoHNZxq9WPl
         +9Rrbmk+MN+s1M4gTWn/pbUjarqsTAKUxSR4syKKUDIeaHZzSsohN3G7VbjgrR9kd3f/
         yFndcyE5kL3Pio8fNHvPCcwIbV9NKJ70GDwjFg2FuGWB0Si5US2VR0pAJTZUNJk7d5TH
         Gs8FvNnITDE/uA+lde2gzz8mtnSB6wGMXdlG2qBfY9KOmlpNaHR7Cvx9nup5odXL4gjA
         yh7A==
X-Forwarded-Encrypted: i=1; AJvYcCWIhIb/ngjMtLDvvvWSkS7s3cGGfmGGItBdvp39UL41qZXBj20x/Ly/3qJGrL1EX766LouUJdsi/70=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxwEhlvfuxEX8EKulEx1t0vcX1BUyi57KXOd+eFWoo/rGWLoP
	fc5ftkypI+XN2+lYKq/DSrQj3R3gnwrvQSpr6MwzfNFMJpbRJOFYxcpBnrwLydmsxdl33OToXVP
	nNmt2BUSj2xxQE26P3FZ4mCc+x2lMCSYBVZkaoUm61LrueCed2iTrVZEJ5UL6Fw==
X-Gm-Gg: ASbGncsp1fg/EeUEtCwk1womghGFnRIU7UgVzP8H0gIckjcUaeA7MgrzWJiteJVqA9v
	i1XnzkGrOI4xBwGLUjrgRBIPpn6wcGAL7r2AftPmkAFQ65MuY/N95KWea8tClP4kClG+RUS2Nah
	7DHY7qwWYm0Udnk7xmiZmSHqGDL60Sfvx0p8nOeefMCGdKVr4Io6qk02NN4AzRYKKEA7tPQY4a0
	XXdlnz4AJ9ZoWLO2bjSd5jQM/a2/EmDHKgPEYKot2Yrz33+mup3wTorAbsjgGJgCQ5FN/tvrPdL
	3OUUsMWqP9/SsqSoYpQHZe1baLyNid/l8HmaiznRiUAFZl437RdyG77aDRb8
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45333311cf.41.1752160868717;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuCfhZPQ7Idmvh1qtK7kQPM/uffYT3OzQJBiz87ujd30b3ETbzpQriwnIDdG+tuY1zMSqkBA==
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45332871cf.41.1752160868384;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:26 -0400
Subject: [PATCH 06/15] rtc: rv3028: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-6-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1044;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y+AZFWJL051hZPxzrLPHAl9zoCHqdwam8bIR61IfRhQ=;
 b=0KJSbBt0DCZNkUMOmwxns1NITMSVMXCg2QJNQ7+FpDcQdwXvMZxfWyFb+ZQw34oW708cql8Z0
 8ZzDlOPfUDOCuuTRShwnoG3D5ui88qCACdqmSjcf+TQTW6jSrQvcPZi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When rv3028_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: f583c341a515f ("rtc: rv3028: add clkout support")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 868d1b1eb0f42e8cdf2895033c24f0d2690587ca..278841c2e47edfefd339f04bf5193f6970ba0c65 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -740,7 +740,7 @@ static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


