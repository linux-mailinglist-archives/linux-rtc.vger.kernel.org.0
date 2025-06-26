Return-Path: <linux-rtc+bounces-4365-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39089AEA03E
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 16:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350E93B902F
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1429C28C5CC;
	Thu, 26 Jun 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VNMLL8rl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AA288CB5
	for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947516; cv=none; b=K1axBmBgd+73/8w4VuaopIGMCog4kF/gfU+5RLt6EZGx0MujBAFsdgZS45YC6+VkCHqwKdy1PTCmYjvWacoNzoxyGc58agt4UShs04gXrbfrYqE40L00qZc0VC19VEfxakUnb3jitG5LEP9oWbtA6NvFborIqCXHlwCZtyVbv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947516; c=relaxed/simple;
	bh=X0GjaqTTAa5JidnwmIm7FesIRgbpydxFUu/Rva0HYuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp/vbZ6NGirA/6aBi/ZVrYv+s7EC3nkOlStVHDVa1+oG8dcrRIi/hV2mV7l5FQnvEsGoLoNJ5hxQhdYPsf/k+vi8gMXVUqxzKyqXVMUdkfUaIambulU7PzRKdkytifOxIHaQ1ASJl1nOIhHhAgtqRep5SzICPSjMh8ySGtvZBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VNMLL8rl; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a5903bceffso14499341cf.3
        for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947513; x=1751552313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=VNMLL8rllbupPZMvcyxhWWcoHrF6OS0EKkR/8C2YYXpkhhfnuSGgzKE5ReCi6P0MsY
         MfmsRVlki/es7j3vwOn0MPJOLxYRsLu8kmc2DjTi9oTaDFcLHKBKg6d7uQDMkOmOmQVs
         LUWVV8vQfGf/qNhGB0v/fZnHmGaIje++/mJbTTfnn5J/dSOHNwUtjH5Sdy/wZ9JI2aEZ
         1mhNK3s0cjIbDid3M5csMOTADJop6mONVhjQItwPyTUhnVZwOQVy/W11rVpK6vFJ4phd
         HsKxBnqLcBgCNX5PAGYk7mz1aguP+uynBOLNqBoYM2FbM/z1PqRWuK8dsdFBobyhTWKt
         /4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947513; x=1751552313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=ctxmLNrZD6jFxuw5DCx6HN45PqwNT+tzzP2ZEuwJxFt+qRJ1y6UtP9wCvt/lJT5GMG
         +gG5Pn020lYDho3Ed/a04j1d/i6seaGAIrF04Py1LaQtEQL6StMBt9jFgo+EDp0B8iae
         nT85bTYaacjEnaKkbjAioOh5r06hcQqo04kd7r2Rc2ODX96CoMsCm/NLBtGu9s3ZGfLh
         8gbCyuBfC0TfpA7yzAL4ppeE1sVNGbyGYN+i4ozBM4+XAFT2Bni/Ub6YKIaaYLf1Jo36
         K2hdXrCmM3jgNKca1278KQsdBD0xvkbPC0p/tJvb8mk2n20fTisKPJahmWzF7JURY7dn
         y01w==
X-Forwarded-Encrypted: i=1; AJvYcCUUe6CGxeOPAJ46EeiQGhe+XKBVdPiipGOsGxtZ509u8hUXKkTHxskvF8OAhrJYOKxYWx26+x9Pl04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9/Z+c8ZpJrbwtor5Ffg3xDlrf3aG8X1NQsPRvsDRuRBHMCUE
	tJryOkZqckiekVqyXmEfKJhzZu/REjW4zcT5AQPrmJoP46/avC5oRHppTAZrXG8KaAM=
X-Gm-Gg: ASbGnct7OdgRfTPhK3YH0gwO3DqQ712LbPh9O2hDBtzm/hSDIiHTwbyyXLMzA2B0aZG
	+ACFEZVCbqLuNehI2hkwrh0X5YwZ+1PbYc4s7uEKp0PeE/X3QFKmRceJy2CG+u/Wq0EqMj1MvGC
	sZZbp0qwwz3UVNiANPvUChc7K7O9uXzFXKJrEksncjZ7KS0QlsazGi32kah1jDdjhWgHIqb2WVZ
	h4kET0rsMx+U7PrE9ebvTdnFC8TNjTfIevWuXdY2BdJtZ9qBw+EItrZWSj/3D3YuBvuubwmatSb
	uLprQw9MI4IhWYr6SrZb2gLoBSu6PTaWIcWMi57jNxzvLSgdVrZVcsu/hlWuCA2hpwmxu8JCdrN
	4s26U0kEITQZIqeUycf0RdO7WzHyOtkhXVj4=
X-Google-Smtp-Source: AGHT+IH50fVe+8buCV/yNDQQL4G1EmkNFITk4SYtG40d0e2VPlg856V2s5HzZ2dfEIhiKOw+A+yqaA==
X-Received: by 2002:ac8:7d43:0:b0:4a5:a7a8:fd83 with SMTP id d75a77b69052e-4a7f2a3c555mr61902301cf.44.1750947512103;
        Thu, 26 Jun 2025 07:18:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] spacemit: introduce P1 PMIC support
Date: Thu, 26 Jun 2025 09:18:19 -0500
Message-ID: <20250626141827.1140403-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This version updates the RTC code in patch 4 based on a few review
comments from Alexandre Belloni.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v5

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
-- 
2.45.2


