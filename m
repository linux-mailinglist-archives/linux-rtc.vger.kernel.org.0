Return-Path: <linux-rtc+bounces-3386-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF9A4E913
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDF7189E22A
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CF128D067;
	Tue,  4 Mar 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITXiACx8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DE283C9D
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107935; cv=none; b=ruC4MF6hTrtF6MSXo1jnyMJibseF3sIsbq+PQuImUXPtv+Vh7S4K5YcyeKzoz3GitZgsLpuPNSOGlUb/rCzM9wnMeqxeDNUaW5WfRN4lK68KT7ftTTuBHSEkXp0evUjPa56dkE9hX+9yh/1ZMDPLSaOmATQ8vq6fKEIhmi0Wfb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107935; c=relaxed/simple;
	bh=vgbHVbyAdNxxqlJ49fGdNGtTt3OgYs9o/Lygu1bq/OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=secvoP/Hf6ccGzfTn/ZyKoV7P3OkXRUyL5J+ZJWJbLihMfqcVk37iDfap3Kqu6sLKDFxfiMmZ+kWUfqreqFK8QhJMSJzu3WCQfqZe8kR6x5kviG22QUp3hPBHvLhWJyfB/tZ4lSBcy6KAHbnBYl1TvGy/esPxNesDuZWBvP8QkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITXiACx8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4cbade42aso8923747a12.1
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107931; x=1741712731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=ITXiACx82elRORdzNYn4xfGKOF8bz9O7LelV8yR1/wQagJY55lumDQGs7DfJxlfeBJ
         QRsAgNJFETKetYw4CRXwLuw+y1OYuXGkXpgCxTiteJXimBvUkOI76Kd0VMDbjz+2a5FY
         hVoh102w72cV+7xNsTs/XPc0vFoqUw1tGENmju171aNoLJ4A5k2S6qIe8IB2A3ADyipv
         Bxg+I4ydJ9ShuXV5XFpoDnHJvMLMwZJiXE7ln4Hv1jM0UDbE0ts/J+2TAL6CwMXiKr5D
         b0ydZxjgUobsM1PoeWdFZqVB8xWNGJhCmgrEzfLqYGk2eG6RrK71mb4cFz5ZB67AyWWF
         gfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107931; x=1741712731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=GW4ouyEiIEc99e4mBzomOIuOk0zlsdLj2Vec4Dm0+ZxMZC0oamdH/3kjlNBqn17Esu
         enbROdMOtS0seGkGnlZ56PHIN+a2C8Hpw/0tDu5Bj4Bc0NAmujLQzjMg9/d32xju88nP
         1GTjR/AH8jt3Mwo35IpmJju9slH1vdD6ej7ZoZj96HZQbXYEWDM3A1FkAUK5EXfXprKT
         XonzyMEpbV5p2SJgUBa/epk1xrZ8sBQunWB8di7X78uf09QVIh4zhe8Q5E1jr4x4uMWK
         xwRoBxtDifeMIoRZrnOT/+svBlGovCV/tR8P/hM8Ns4MYAk2ZbjjsQQR50mT4BWJKh0J
         gGaw==
X-Forwarded-Encrypted: i=1; AJvYcCVTK471ZvrUBLd+/Aa5LE2/sB28vFWElqyP07lmtAnxiCW7Ju+rOEdJINLQa4yA11+B808HIi87IN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycThOHvadbJ3Q8lWX7NoZodz6V/Hfr9CI3J7kqy227ux16Whxn
	FllStxr+mkhEwNUm65bWyCfT8j0o/pgRH4qRuFb0Us+a9x6HlMp0DHjwYQ1B54Y=
X-Gm-Gg: ASbGnct+yiP0hAqb6HL0YK0a5jyuvtGrlVIh5Jws58u26Rr0R6vOO9evzezoQlyZuS6
	qvHFbJvSYk4w2bY5g3c8/PSoSFk7xxtFK4RfvuyFAkUvlE53oMuTlfHt+jmSOe5OtQHRlqu+se1
	EmzXeGbZzLcnOuPPuHpgfxF7IvBzORr49Z4uM9kgHBUgHbNHST49j3Q6T4s9ANMCaDwRf9wI97r
	ZMwZpDl+/9ZB/K2GbITD9h7Bgf+vkKSwsg3Fp2q9I/KwoWgsK7clRzYPJiSbR4RsfaWYpdMl+OB
	pDPrtPNAyv32W9/5ImyOwscxG/OolQX/8pkcbwsKx7r5mMCMJeCv1Y1SYwamxvjleXJBgmGAItV
	EE6jv1S+UZcBmare9pEQhFhfznJ0h
X-Google-Smtp-Source: AGHT+IG1qDKc0hst2zevKKhfPXC0MrEb14O70/5mMsp5hFfaUprLxoI4xNFXRR1d5hlR/z34qhDcpw==
X-Received: by 2002:a17:907:da0:b0:abf:23a7:fc6 with SMTP id a640c23a62f3a-ac1f1185263mr365511466b.16.1741107931351;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/16] a few rtc driver cleanups
Date: Tue, 04 Mar 2025 17:05:28 +0000
Message-Id: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANgyx2cC/3XMQQrCMBCF4auUWRtJxhSDK+9Rukjj2A6UpExqU
 Urubuze5f/gfTtkEqYMt2YHoY0zp1gDTw2EyceRFD9qA2psNaJTsgYVZvLxtWRlMOihNXghb6F
 eFqEnvw+u62tPnNckn0PfzG/9A21GaTVYGyjoq7PO3GeOXtI5yQh9KeULAj75TakAAAA=
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hi,

While looking at RTC, I noticed that various drivers are keeping
pointers to data that they're not using themselves throughout their
lifetime.

So I took the liberty to drop these pointers and this series is the
result.

The last two patches also convert two drivers to using dev_err_probe(),
as I looked slightly closer into those two. They don't exactly fit the
general subject of removal of unneeded pointers, but I wanted to share
them anyway, since they're ready.

Drivers other than s5m were compile-tested only.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- s5m: fix arguments to devm_i2c_new_dummy_device()
- merge two rx8581 & sd3078 patches into one each (Alexandre)
- Link to v1: https://lore.kernel.org/r/20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org

---
André Draszik (16):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

 drivers/rtc/rtc-aspeed.c     | 16 ++++-----
 drivers/rtc/rtc-ds2404.c     | 14 ++++----
 drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
 drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
 drivers/rtc/rtc-m48t86.c     | 14 ++++----
 drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
 drivers/rtc/rtc-meson-vrtc.c | 12 +++----
 drivers/rtc/rtc-meson.c      | 16 ++++-----
 drivers/rtc/rtc-pl030.c      | 14 ++++----
 drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
 drivers/rtc/rtc-s35390a.c    | 22 ++++++------
 drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
 drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
 drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
 14 files changed, 183 insertions(+), 225 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250228-rtc-cleanups-12c0b5123ea4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


