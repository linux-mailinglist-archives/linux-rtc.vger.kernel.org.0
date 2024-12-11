Return-Path: <linux-rtc+bounces-2705-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C75799EC924
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 10:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A9E285E76
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 09:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ABD236FAC;
	Wed, 11 Dec 2024 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgtD9YJR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01315236FBF
	for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909561; cv=none; b=lDNRuL/YgNpqTpRTUXWfu0iK3zT7x9SUP0BkmFz3ijL7VMSDgrqg3xS0STN/LRtB8cJn/u9jYXVskcy+DO/4YVHuqd8koXoxp7yfjG0Pmwgh9yQ+NkDIpjJQ13oFmFTugDWhc6lUWXmQQ55/qxu7uQYfIaOvw6xSPzQud28/yCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909561; c=relaxed/simple;
	bh=qyKnhrPjdXHEQmybHqZqQhGYiZQe1mwwZIQNT0SPuAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwxBflHFuRKGTWsIzb9G3nD33BHOJ8M6iKktQF2t4ugidekaJo0vKcExiodTSVw4iTDCPRXISagds+FxLtpw/g1DUReg2EpRgc/3GOO4XDOJKlJHwPC9lYOQ1la38d/jfjhX2yaphSW5US3kRQB/wPgTMXcOwxvumAXjB7miklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgtD9YJR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3053125f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909558; x=1734514358; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5VxB938IKtR3Mu0Y5RbPKBoQecG76afLhC+F35TrmE=;
        b=NgtD9YJRPcCBEOJS3AhGUJ72E2qoigxx4gxMxysKyeAZ35LiaAhzMfvTWMmrrlkUcX
         cvsDoRuvQ0Z3uGt2BIRwJbfbL2CFpE476uiP9pTodM/ubyWwdb4Kx8LcH5AWFmjhED88
         RExV2ohDR2BAriaTX5lUmYYTgbXWb93bo+SWsRMHbt6DM0YMK0z2lx5vG0SWOq8EsTFa
         RR76OE+3LRrBJRjqMz7xwFnwrhgO1QLJbbOo74UD62bg8aiVHaLyKAb9qPifLe8G6dk3
         /yVKLN+X+KrSStPF4mjIUdYpwdNCWz2934xa/dbwRFfWim2k8CeGLuY27/rNf9VLEO1+
         3dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909558; x=1734514358;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5VxB938IKtR3Mu0Y5RbPKBoQecG76afLhC+F35TrmE=;
        b=U8kfSKEsJnF7QP4//njK2mQiUL20JxNHQwmgoL6+NalOFhprp45NDSVLreTY8gIZ3s
         wjVDMwzQ/vAjEuGbIiDGX1igSMhB87eAveRUfasgRuwFQ1dQh3C4GlCtKHNzdFp3uWOF
         0NmkQ7CORvSJJMbs4VGgAzFT6EyYaapUn9f55omr2O8tNSAb4m+iun/Z5N4GQYtmnZOq
         AxOoPhuAK+riP3+PvjfSmt3dYlWpoXnMpQj88OfCGYTHn+bc3qH5n1jsqyu1/vDJ4Kfr
         De26eCbfQ9wePnSvhcxhWhJ+eXDDuw1tswf4VRykfdiZLRkMtLrfsarGh+w34KEKvRxf
         PpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNoHTZoYRatW242o1PUw37aG+XbofmwMCjsivEWNjk/894lspdpuX2iocXsWD2IwjmwUUNjrebhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMI4G/Q4s85xqD29Ia7m3DS4psOfMHPUlk7aN1mj/sJT9a3l4q
	twxtCFnZ+eyCjcJE73GmLb23IPWxjv/pf3UDEBa4Mybs9XsaJERBEeRdSIQYuUfOpU3sccZho6d
	f
X-Gm-Gg: ASbGncvBHqDJMcYhPGUryr3xAT9EIX5ebcdLnmynzPbVauyxOPmLG7y6svzl2SL2gCp
	ndzt+bjuhhaAXLQPdq+LPm8dC1EJCAZLMAlJ3GRd+QxkawrW9wX64jW4kmepyRYcSPkhZb+hni2
	+gUuGx8RDXvhUepDIAVGTVITwiAyrk+hJMfOWPOdte6Y53oyPS0xgmcDqhLzo4g1jfXdAW3YvUH
	Q2t9FVz9jp6zGBfDgliwfSzNxlIiVidMZRy2vku6IsIeJQp3spytO/8RdU=
X-Google-Smtp-Source: AGHT+IESPCTVzoAwL8Mu4aP6Ib03zs7NgOeXGz7+aMlKX/SKIPhdsqBIYQQBw02we1gLiAilrzuPjA==
X-Received: by 2002:a5d:598c:0:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-3864ce8959dmr1766176f8f.2.1733909558245;
        Wed, 11 Dec 2024 01:32:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c8a6esm849864f8f.59.2024.12.11.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:32:37 -0800 (PST)
Date: Wed, 11 Dec 2024 12:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Esteban Blanc <eblanc@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
Message-ID: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is this multiply in tps6594_rtc_set_offset()

	tmp = offset * TICKS_PER_HOUR;

The "tmp" variable is an s64 but "offset" is a long in the
(-277774)-277774 range.  On 32bit systems a long can hold numbers up to
approximately two billion.  The number of TICKS_PER_HOUR is really large,
(32768 * 3600) or roughly a hundred million.  When you start multiplying
by a hundred million it doesn't take long to overflow the two billion
mark.

Probably the safest way to fix this is to change the type of
TICKS_PER_HOUR to long long because it's such a large number.

Fixes: 9f67c1e63976 ("rtc: tps6594: Add driver for TPS6594 RTC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-tps6594.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index e69667634137..7c6246e3f029 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -37,7 +37,7 @@
 #define MAX_OFFSET (277774)
 
 // Number of ticks per hour
-#define TICKS_PER_HOUR (32768 * 3600)
+#define TICKS_PER_HOUR (32768 * 3600LL)
 
 // Multiplier for ppb conversions
 #define PPB_MULT NANO
-- 
2.45.2

