Return-Path: <linux-rtc+bounces-5444-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE8C749C6
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 15:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 16E1528EFB
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8650C299AB5;
	Thu, 20 Nov 2025 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9OhfqCk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E962737E8
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649489; cv=none; b=FyAHgH8dReico5rWGUR9RdduHEqBnTC57f7Zzlbo3JASwxaOG8G/GQaZIr/pG4OEi71vVP3JIdFV872vHzR0nwgRPV/wAv+0nu24ZM74a4vd7fVOFtMV09hIGezfLV93Kh+zzfHWB0y2vwnnJnP/baWsd/6ir2wSvjw7CYbWyHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649489; c=relaxed/simple;
	bh=D80UQ8DT8x5gDNh37qxMkColQlMlnGetG+D6Y4IENvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RVXDfTZho8SEFKPE6L7gaoPCsSE7EWhcJ6A+C8zK++O5yse3tia+hmtB079Hxi7eNVv7gsJbYr3Tjo9fYlxIA0QP1wZFIvjG43Zpn3MzglXLffNveYiS89RXoFYiEVWN5hdunD/QjeGZibNrBloLZ4t6KSu/TrMVc6/uYdAy92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9OhfqCk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7636c96b9aso136417566b.2
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=J9OhfqCk/QC/OwKVaNhXe2M8Ehu4ZxlkhmN7qzC8bY+xQPQawI1089lsnLklPXOwrR
         GY5njRi1ITGUZwwpdThpZTMIzxDjGQiARNUk+kqZkqLomXphbGo/ZH5EJvtvp20WJymz
         PN5K5+9YI62aN0E4gTc30bhTd/RQ5skb4ipLBeC2no5gFSXfLi46dKyfo1epLoPYr3pW
         bCLA73iBVja7e23Dimi/u+B6VT1GOihfxmrjtSCWRvsRlAHtqpzzdoCPffVOfxkEgoie
         yxgAyXfEpI6fT7djbn3b3z5bH4W9PpswUtHjGRjL7h/M0ARNuI7SEscXmM+rGXAuyoc7
         sTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=D1g5KtAj1vTFZTnXUzzG7+DERERtV/uTzYF/TIBUrdySKK1rlDzfJm6ZKAY2E7P1RU
         PfGIZXf9mXpdnJt1SB0pceJgHEjQWh+Sxod0/Ps6qrafuPD+GIWbjacr5EU+Ni6s+/rX
         ptCBhTMCMq6wBwpGwPBKlQ2h+YjGzkhA/BsA/Z4zT6bB6bnTUOi7pqLJ/VrODz3YBUJI
         AWG/Pb3JuJLAwlCmeesrqOLDEoprT1K4CAIMYDCrbBgkmmfdN2IThfdeem2N61pT2k1f
         Wb9iXyIUBKv5kmtvHLQEdyDclx0yAnS1VS6cf70rxdZlTuohDQFT8wsKCdIoxhbPFOGw
         e1ug==
X-Forwarded-Encrypted: i=1; AJvYcCU+z/QFUYDW2WAfzloaLxaSz/bNdvOZkD6EoWqnv5BD6E7K1Kh3fOsSpXab4OhBEH0+4ZSK05bVybs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsidAlqcjAE1+JcQWtHvOCpuKzv37MKXnMYjeq9ojnNAV3XT/2
	F9r4NyQDBTC/A6+Gtt8pEkS0Y9jLTEQ6pCLqhh+BDNpCK9Wqpt1VG1OVkY40u3zTxus=
X-Gm-Gg: ASbGnct3vkdGalEXCnyjOxtDTyxH08dB8OO1GJ4eDeO8cIV/CKPp2U6lEnv7k5NwqWH
	M5IEdV5NtEEUVEOEEME9W83RFG7N3vANY4r6Ih7YJ9JAyGFsp2b3UzVIjlbQO2SP6oaI6dBvZ04
	zHZMtjr3GCy4ldcGofcgvBCrIIMwDen8mzFno/MObq6gJqrAbMhXeORdUUSiYg2RH73Q9zJLTYM
	lfCCHJqMX63B2LCwvMswh2xE04uc78apjkFbhFPHU3zAEQAD8zj7zg/e/4LHRWe2b3kQ1thkrHj
	xuYAfA76CDlUbdq2EcSDw1Lc9lN9djOEGm2pv0LUYXjpVB1ygcnK9sZWQK+spzfo/uwq3RJ+qPT
	9RfuUnHzAoTRtRNsD6IDKnNVoI/FOfsHy57HRd0TdDaLD/6P6/y9TC1CaSLtun+apj5GvmpuVoa
	AmV3QW2LXOFOaYMRAcTJXY6DFHHwlXtTo4DFdX+y15sDNJXxKxi/KdYa/3Fj8BtUOkxzMNx5Pxb
	HttNw==
X-Google-Smtp-Source: AGHT+IE5wgD6HX0xGkFemQxe4ZWTQBoYj3/3DktxKBCpayLDAFuGLY5nOeca0EhTQQNZZprAVE5/oA==
X-Received: by 2002:a17:906:478b:b0:b6c:38d9:6935 with SMTP id a640c23a62f3a-b76552b9f32mr303535766b.24.1763649485153;
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Date: Thu, 20 Nov 2025 14:38:03 +0000
Message-Id: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMsnH2kC/23MywrCMBCF4VcpszaSi1F05XtIF0k6bQfaRCYSl
 JJ3N3bt8j8cvg0yMmGGW7cBY6FMKbbQhw7C7OKEgobWoKW2SqmTyHYVbnG8CjPgRVp01gSE9n8
 yjvTerUffeqb8SvzZ6aJ+6z+lKCFFuHrj0Ts82/G+UHScjokn6GutXxL0g5OjAAAA
X-Change-ID: 20251114-s5m-alarm-3de705ea53ce
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order as patch 2 without 1 will
fail at runtime, and patch 3 without 2 will fail at build time. I would
expect them all to go via the MFD tree. Alternatively, they could be
applied individually to the respective kernel trees during multiple
kernel release cycles, but that seems a needless complication and
delay.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
- return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
- collect tags
- Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org

---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++---------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 61 deletions(-)
---
base-commit: 9ad5de6d54f306b2bbf7ceb27e67a60c58a71224
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


