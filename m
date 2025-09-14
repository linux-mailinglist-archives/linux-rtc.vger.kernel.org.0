Return-Path: <linux-rtc+bounces-4883-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB01B568B7
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 14:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F201894A51
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F4026657D;
	Sun, 14 Sep 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPnGWKqi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57C25F973
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853761; cv=none; b=R5gIScFYTH7MquPwFAH96xZhdFxNYdpFUutLtjXp/UklGnxMio9HfpeBHW/s/jJHK5S5m9zw/ACTV25bg4AtXoMfqNPp57uTfXfF7q5YiuwHpqyzKk+RtDbskkLMCQm4Un0LUFvhukkr9NrCG356+DlH+GzG0AOPC2NKXjTMBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853761; c=relaxed/simple;
	bh=a0DS+1ZMlf/0j8PrJ136z6bVlAIog4gQ8+ovr9ZcVgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4DTCK4wYjt+Ql6Pt1Aajwn3BaLICXrH5YXyFsbvQGW/NJWgBWinyRTPGBVE/VQrdO07WH8Hi/QvtLgCk6WxMUec8dW648xJ377mXVUioDjAoXhEXJPjfBOuD6wH4xMip5+dsbcF/bij/NZojFu0nCGiokkAzw4SFSYdeKpxwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPnGWKqi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so22175065e9.1
        for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853757; x=1758458557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWkNgc7TTxage7dXNRfg4+5gf5ClKzMP0YRT5Au2R2c=;
        b=mPnGWKqiR75OXmA8flkhbvdmXevDvOJ585jiVFoHBqmGuEd/Sk7A24/8sfbZ/ReLKa
         Ui/If56b3x37Q+u4B71ebHek08VRoTyYThBqUNsLqd8frIYO0mSsmkmV8Ezc43IMdSmZ
         3wJgfu70KctsZSNXBfsslmWk5lBMM2OSLAZibJMN+c3h+JZ/vOdZSz/k3c/uHxFV7YVw
         xEa5jasI1z3Ult+eP5B0Ap19l/EcGGv9Q5xuxTKPLj5q6HjCMKndWamWW5B8DEzqJkow
         jnNxqblbjuCh0yWh149LRBS5IqymXlfweAYKRtez4i9ONcRLK2zyF3AzSdH90pB0fp5L
         jMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853757; x=1758458557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWkNgc7TTxage7dXNRfg4+5gf5ClKzMP0YRT5Au2R2c=;
        b=pRIqWv7m3AT0hCSOWHmQSIowcBUMYuKG/JJe3lAB/mRvfqPUHj8A7Ly8tRosKqMVuF
         AB/TGHs34m54F17ax3wQsAacNoIb1p1PG9XyvGAS11oqvPjMCTc9Ug/ogAHx9tWEPuI3
         q5rYUo/h0A3DxkEu5VCTxhFTJPvd2j3ZagHEU5uHMmVEdJIoCP7ISc0AqYwoPYrehoZR
         IhXYYkpXR8Ifu0z4X3Ovk6IV8q61WDhbcR8wqVfQjDzscpjShGeAv+lw2vU4WXHVYhSf
         EU2SZv3uS1coJtb4Mo94e2FdEhejLfg9IWFTy4jVcDwu8BxwKr2tUdFP1vaCjFbnnNmZ
         Ny4g==
X-Forwarded-Encrypted: i=1; AJvYcCXcY7kSYPVwoRwFCz6WJO8VCpJsX2ORGVntwKdICJVXT+jryZrOSVF8yRoWCLLlHoL6/9Qf2wi2Zso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIAu10m0pO5YRx/PibybPc+tEK5TdAdeRLHuGzxZO4xS5xK9a
	0lmon2kvNirlbmLXemvaFQJdAMe0o4iM0GZjE5JMahlPJoAyRmhEe0G8
X-Gm-Gg: ASbGncvj47Tya9y712sfQqfHFY39MNyKL05G+82aKbEohpx0NkhA93KSq/qd6fq+E94
	nxg9TyekjIJ5mpnBPN6/eqY4xkrwuTRggu5O+pdCdi6EfvmpTIk2fl/73xt3u0fkLCm6ccfzESZ
	9kx6KPQnTc5tdJ0AhAr8+9hU3CfsbKFbt14OY5Bj/lZuJaA4Vd4+iVTPYO0YE4mMfHq/u2rcukY
	BxWoDri8M6xsLH1sYqQnl8jLLAUxRYIyRqybwr9UVSajwM/GIMUvTkkEfL8RHTuZXfov0wAKPQN
	6GpWcOS1K4QGb/4IV8lgWutsl4dONH0JY6OAPSlhZM5K63V8fcHb2oNYnq9AfRhTFZ1XRNo1gue
	9k7+DdOPkdWabjNM/iauwz+W6EG66UgVEhueXHTBTOarjsbmGkV21qE9Kej2WNNChhkLG+0ftZM
	V8LyKis8PK
X-Google-Smtp-Source: AGHT+IFD1dzVaPjd75ZW6xF7NbuDRvrlMisxkkeIZupeaMoc65Ne74ve/Yf/Aq5gRDwhZi8axs3xXg==
X-Received: by 2002:a05:600c:468a:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45f211f2eb5mr109286965e9.17.1757853756463;
        Sun, 14 Sep 2025 05:42:36 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] mfd: sec: add support for s2mps16 pmic
Date: Sun, 14 Sep 2025 15:42:20 +0300
Message-ID: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the s2mps16 pmic, used on devices like
the Samsung Galaxy S7, S7 edge and the Note 7. It is still wired over
I2C, unlike newer exynoses, but also can be communicated with via APM,
support for which is not done (and probably will never be, as it's
pretty much useless).

The order of patches is important, hence why I've not split it into
subsystems. Patch 1/7 should go before patch 2/7, as 2/7 includes the
file made at 1/7. The rest can be applied without a specific order.
Thanks!

Best regards,
Ivaylo

Ivaylo Ivanov (7):
  regulator: dt-bindings: add documentation for s2mps16-pmic regulators
  dt-bindings: mfd: samsung,s2mps11: add compatible for s2mps16-pmic
  dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
  mfd: sec: add support for s2mps16 pmic
  clk: s2mps11: add the support for S2MPS16 PMIC clock
  rtc: s5m: add support for S2MPS16 RTC
  regulator: s2mps11: add support for S2MPS16 regulators

 .../bindings/clock/samsung,s2mps11.yaml       |   3 +-
 .../bindings/mfd/samsung,s2mps11.yaml         |  17 +-
 .../bindings/regulator/samsung,s2mps16.yaml   |  50 +++++
 drivers/clk/clk-s2mps11.c                     |   8 +
 drivers/mfd/sec-common.c                      |  10 +
 drivers/mfd/sec-i2c.c                         |  16 ++
 drivers/mfd/sec-irq.c                         |  46 +++++
 drivers/regulator/Kconfig                     |   4 +-
 drivers/regulator/s2mps11.c                   | 147 +++++++++++++
 drivers/rtc/rtc-s5m.c                         |  16 ++
 include/linux/mfd/samsung/core.h              |   1 +
 include/linux/mfd/samsung/irq.h               |  66 ++++++
 include/linux/mfd/samsung/s2mps16.h           | 195 ++++++++++++++++++
 13 files changed, 574 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps16.yaml
 create mode 100644 include/linux/mfd/samsung/s2mps16.h

-- 
2.43.0


