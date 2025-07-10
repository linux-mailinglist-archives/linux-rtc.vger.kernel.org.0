Return-Path: <linux-rtc+bounces-4456-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D186FB0065B
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA161894B07
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4D8274B53;
	Thu, 10 Jul 2025 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="creHqFdN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954A274B29
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160862; cv=none; b=kdKrDzvpVMDBTkJFN+INFavfbKEwWaGcJT7c2dUd3PE7CiPZF82fAUYMBjoLCStRpr5N93fIrG4mWfBD7lzZFwHGmiZQ0BnEp1tZdriCmzHy59oce5P5+GMFF3XkbYd+0MtqWUNabhr1rQnjnQ8eiPdnhOSciyj6oxS7BvTwofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160862; c=relaxed/simple;
	bh=oTegq5tfB2V7DcSOZNV9XX2rhgoU7Wa+qoYDD3MtOpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCGjw1qh9O9wL4wkwEhShE4lbtxXZSlpTGbDUogfz2guYEYEZwVA4luNEqn79mFW58bcqjGF/SMqkIxlvfcfDd1JajZpK+tfIVTQW98eKuppjM/Dv7mYx7DlFebh4+j+3clTwr9LKmOKP+YAFNvVnIlypGGS7+jdtz+k6oCdz84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=creHqFdN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
	b=creHqFdNmRsF1jerBqkBvqJ7mZeDlNczI/w7e7ISCyRmjNMP5cJO5W9Qhn9PAjqLQTbEw6
	iZWT6zyVUh2U+MYKdnJi5b1kyqNS0tXhqkrz3vcfmDItSyvtcu75TmZgWI/nS4JHtjsaTm
	Vuuw4dIYqdxrCxdJx8QKm089I+UESdQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-bhTaYxxSMEiWJJS71-kQrQ-1; Thu, 10 Jul 2025 11:20:58 -0400
X-MC-Unique: bhTaYxxSMEiWJJS71-kQrQ-1
X-Mimecast-MFC-AGG-ID: bhTaYxxSMEiWJJS71-kQrQ_1752160858
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a441a769c7so19303111cf.3
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160858; x=1752765658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
        b=D+vn/C74YxwvR+h57tFK1cLbB9KibbI160yxZWIDe93lcSwBNZ8SkAAiYw/S1phNcf
         G49JYI18Wm0bwTGI6xhyCXII4LDANTSS6/n6U6WiV+tKTBhaPu8KA/KaqFE9iGOzWISH
         AoqXyopRiz4C0TysoTBe3I+U6EePUm9wIG2sg8l5c9nzvisolW91TdPeKf0sc8B8HrHq
         7Nc07+R3NIPTRS9EO2Nl/Yvsberr0yN5gHEEYPVnyKabkNDZCRrjfbQLkJhKp+srIb9U
         uDlUb8j1OSQRWmpuYvphompILHmcsT2DKmkuMr2eKTnZQCE0yp54ARMb5Cs+2ccRCteD
         m02w==
X-Forwarded-Encrypted: i=1; AJvYcCWJGMFgk9pcq+bDO6cwlQTQ3ly3y5lUoSKf4Od+NX408rfqB5pLylp4JK+yBnRcUoJlKY6dRyCbAGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzefQsxOT72zTm43K4rnlYEHQT5+J+19JmToE7nxNqT8sqXf3V0
	B2N5a2af+762VVfpY3L4RW5mBJdD74trkOntmJoq3j40QFxL4aXfuIyMWRJN8BiOQziz2kQdlfV
	VTsYHYW+Nx5FvtUOzRn4gY7a2YRPuEfmi8bRCPuR7i2Eb27MddttftF/CxPYXXw==
X-Gm-Gg: ASbGncs0OkeWi5PT/tXQJrKb9s1WZsB4YK4tRI6aEmyvIDiw1ZmZU3RjbOxPbMycmLx
	Beo+O+xhad0moY/y4Ys1fq0+5B7OCgCBAHGEvOUHyXNWAJgB6dzYJk/g+ne5M9HfM2q099QJ2HP
	nG04l8cjcmeL25Ir8ZFWe7ObfjEtDtBIILgUyNCLyLpeFPcaqmQy882VrCCXqh3YRCTlKM5ORaT
	Rmpct1qdlKjpLfxNTPEogS/QtNK3GVN3ooXKawD2yYXLLKc8bGnMYKYLac26Ls8h1g5s2ck6i2c
	YMBLuYvM7x+hzz7U4jocYCFMN3Tp80FKAY+z2x6kGeGhZuc2MW9a6thM4Sk1
X-Received: by 2002:ac8:5a83:0:b0:4a7:9d00:770 with SMTP id d75a77b69052e-4a9dec57aa9mr107799031cf.18.1752160857796;
        Thu, 10 Jul 2025 08:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW1Y/+ZghE0XOiqPvb5+bbhr0BhriZx2/H84nr6c5hQpG4IkOaOonwxFNS6q9oehgxfat3nw==
X-Received: by 2002:ac8:5a83:0:b0:4a7:9d00:770 with SMTP id d75a77b69052e-4a9dec57aa9mr107798321cf.18.1752160857249;
        Thu, 10 Jul 2025 08:20:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:22 -0400
Subject: [PATCH 02/15] rtc: hym8563: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-2-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1048;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=oTegq5tfB2V7DcSOZNV9XX2rhgoU7Wa+qoYDD3MtOpY=;
 b=g2MQCAAnSehCZ9tjenRcNXWBC1pOM+MFKKZ0kDoelFsePnd5wSPzRosgQPIlyhLjYj1+jskfi
 fLHbu93SQr/A3IjwrnMB769Q5Odb2T9TMdLRnSLSgnjgIWwtway/qbM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When hym8563_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: dcaf038493525 ("rtc: add hym8563 rtc-driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-hym8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 63f11ea3589d6439ac0ee7f6ee4ab70e2a52bff4..759dc2ad6e3b2ad57072b35a2642ec5bb78cd98c 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -294,7 +294,7 @@ static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


