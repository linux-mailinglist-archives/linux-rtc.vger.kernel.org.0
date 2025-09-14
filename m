Return-Path: <linux-rtc+bounces-4886-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89CB568C4
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 14:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F0441895453
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 12:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14988271441;
	Sun, 14 Sep 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="est7Cdnw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E0326C3AC
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853764; cv=none; b=W9wY6M7zwsZM+Xl6VTucP6YWAVRUJAz2uQL2n7uzKgGFPk6fRNP5DEUYr/19i4IT2ITRG8qLXdXQPfg7k/ey7N0kWxmxjYPJKIPvMrP8AtplYJ8Jd4nSnGb10r2WJCSwsrmXzcam2nIkprBe5ljDrBV+ZL+zYeevluvXl3+kMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853764; c=relaxed/simple;
	bh=BohS/rc6qOfBI1KkyLNcfUimneuQ7sG3nV/JMTpWO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L76mAOYs1TsHOzDQFQqmLdblI3r8Cqbm6ZZgRsYiARkr9r+JxTLRvT5Vv90WDtIV7MwRH47X4FMoVJD4ULmHMaiGsCKL//0+2qBsCa3uUdAEltdI/iyjCbkJzOL0uJ/WCwwO+DdM2rJNSMQXvAam3/ZKwmAT9Sl/zx4YvBNv9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=est7Cdnw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso2366029f8f.0
        for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853761; x=1758458561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=est7CdnwjfHJ8I8fx2plLYIVT8IyjZE2DFzVong6BRhvoA8lbrCXZFgcTdjDE0ooIr
         YZLx41m0N62rTzdEyAmn62YBdh0PRwYYu/2KAYTYwF202nTo6VB1nqctNgthAa7c/ikY
         oHbkd0hHAg1L31qsPzysIUkLz21GycWMbqbvo8rFidAkFP8TOTfIVWrvl41EokS53Gdp
         D4/H2zWhTZpHlnWlCHTjLcqbWTlWX1fzaqmr2r5INMtDgBJHi5dtnVSaBrowyAUss82E
         sZzjgjnfQnEFjMZAnYu+Q031Ld5x+endnHkbmXkIMkxPQisDTOmYZYPL0rvH1nZ35tmQ
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853761; x=1758458561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=XjZemFzN2l7Au4AyxFlvRrelvyxMOyfcLzDAnam3nGqqwzetnQP+KRvLrB0PQfc4SZ
         l43wj3pS/3ufWLnV1P2xZZJ29cycgq+sqA9oVjdyg06w9siNvbzwhyZaeaPW5ObPZSWi
         uL8v7meQY4weDU65tTEKYs9dimIZNdq6TIe6L27jzew3nBlHbTVLoHDetPhU/P5alGCX
         M/OeKG+QYM+zdn7q7qh+R9DeSOjtk6wz9wfhz3AArpJ0EfN+e6cCImnarTbGQ0QOW/Du
         WSFvfdLGFDmm82KH4p4eJ6aFByIIRfytY38cPDR6j8kfD41P00iEPNigC3ID6sXMc3g6
         AtXw==
X-Forwarded-Encrypted: i=1; AJvYcCWWdxMWyaGGkyCN8HnxewM5zuBDdM18RC5Tqd0fiTDZmDZIbr+QRb/pi634UqiV1pIKzUCR2BThj0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPanhI07B/l6DNUiackZNmpeITuySQxsQdipL/c0wPKuCKs0xi
	xO6Zg6dTA3eBW3MrVFSuJtdiDU4uvoAQojs+8LcYI53lRDuficTGGPPv
X-Gm-Gg: ASbGncuKkKuid3pUjaVMoQkEt4kCMsODWZe9M7W9xpVfUcjkZIWK1rHXViCk5U1njrg
	Dqn6jniGoUD+xYySWTLQUixAM4usHiHFpBA/M9ly/66yBanvYJcaediKpNUYfGN7DkTNrOj1gWF
	RGY88nRKrdDbqs/KoPmW35h/A+mSfkSAO7mbrb6cJ5XbcIE2VIscQvNBRaXSn2tGP0gx8TX7SMt
	y7dI2RgHLwvLG2DE7nj1P7sETFcdwCQp9EqIehxPxzp5YZJQ/4SZ52NFYJTEWPMvgPPaYJ+eO9m
	QoCRhnnDgsCTcMibsGmUY9qoB/HTZUhugfQrv+syanVfTEs9/0lyjb9k5hRgUUXta7KmGFdXYUL
	CAvQKQrpyqFRgqU6YmuJmNAAYqG+lbMrpw5cizQ92u9gwy/bD0Sv9ZkkBOdS2atwQuukzVcQZ9w
	==
X-Google-Smtp-Source: AGHT+IEXZd7reUDziErOplgPo67Tm47g/zLW7Hg9UIF0v+P6mjh3cSDXIBSb4wSjeIaZ8c6Ls42mhQ==
X-Received: by 2002:a05:6000:2504:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-3e7658bc950mr7945343f8f.6.1757853760855;
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
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
Subject: [PATCH v1 3/7] dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
Date: Sun, 14 Sep 2025 15:42:23 +0300
Message-ID: <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S2MPS16 PMIC, alongside regulators and an rtc, provides 3 clock
outputs, just like most of the other S2MPS PMICs. Document the S2MPS16
clock compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e605..e1666fff0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -13,7 +13,7 @@ description: |
   This is a part of device tree bindings for S2M and S5M family of Power
   Management IC (PMIC).
 
-  The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
+  The S2MPS11/13/15/16 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
   outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
 
   All available clocks are defined as preprocessor macros in
@@ -28,6 +28,7 @@ properties:
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk
+      - samsung,s2mps16-clk
       - samsung,s5m8767-clk
 
   "#clock-cells":
-- 
2.43.0


