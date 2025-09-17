Return-Path: <linux-rtc+bounces-4971-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798AB801A6
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Sep 2025 16:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 439BE3BB375
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Sep 2025 14:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36492F49EF;
	Wed, 17 Sep 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dn3TC6ER"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120E2F28EA
	for <linux-rtc@vger.kernel.org>; Wed, 17 Sep 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119983; cv=none; b=o5yEgCYxaJ01A3ATRD81GRdtg38SCBuDZrorHVM1eKy8c7Bb5/gU9ATLi46i78D3nNrYe/96dCxEROctd5RQBkg0se5E075TEqjPYd5yQIYHcdUDlHUCX5mFILq0X/iG9lCZeWdEfrmh8niTz8WcNzF8jmej6kYjs1mbHrs6RFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119983; c=relaxed/simple;
	bh=JQvshfvimgHfM0RiZnHUyLwR4iIsBOC1lbymHIY70KQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C7r0jH6gwBgo9VoQHGE4J78Z+0H+WHAbRTssN3rw07YxIzRAQDNg+AGSXhrd9tq5oZfpZRib/eBnRaaIDc/DJ1EQoea2hWe4u3dVOJpJCVkx27sWkW1qAwECjtFfPRBBXRW8ShrF+fIeRB0QyswYiqORCjMwgvcPb4YLUnzvOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dn3TC6ER; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso11417075a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 Sep 2025 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119980; x=1758724780; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=Dn3TC6ERkVkuH0TCOdsDTLxTsCKp6ENyTln2iSx5Y/5INH004leh+wKLiSC9YCw5xD
         KrSlNNRxXfVKz5oU3rFo1yjXLbGikamf4KmwKLx7dw+K25hUen3xMMB12BedqNyGx65d
         bnjjDNoEHRGm0gvmFDmaD/TwxyZatq8G/MHLM6BZiCJOODhnRgOnrHE1h2p0kWaw2PFt
         f/A2B/Ym8mGTHAYIO93J4/bLeQjR7Z6QNXdwmCO4tFurRhBUgSNz661cNqrVVZTOq4Qe
         AzHFX29WCHTxjgA7nc3S9nBJK7mxE8++gfVAQRTA8ojQSxDHhA99+2+swzYi56WWNBDk
         /Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119980; x=1758724780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=p+yhN7Tf6JCpZrPdmHyqAS210cFa8Xn7GUthT1S/q8VHEaHpwTpXi44vuM5vtYQq4+
         vI3FJzQ9Vfu/TdaDXaJ1AhK3ifJGcV4pbC0axfLSjgBGWASWdytSmShHVXoy4okY/nr/
         6/PhLy9T3sUcW6GRWzsyQyhYXRNRNUgVyccLD/IHvdvbCdC/GV8+ETy+gu0qoUDp8Eda
         CB8AG/5tRYC25ttG7gH0bwc0oYpfEdhhHiBlEwzryLOexOK1iJqeHQdVJknHt+kVmVjg
         NRdsZq9WGP89yDzj6smsvHztlcBAUPs6QxsciLMPHFSEO2xRnI0cY4MHloN7wFj01hR7
         Uw4A==
X-Forwarded-Encrypted: i=1; AJvYcCVKpd3smdTnl6btLnr8GPkfEugamEkyc+x610mDC5ir1Ir2pxAU/+smX5ruNNgXRqen94waypbBd50=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRWDGNEHfkaGHC9qkFXbn5xQSAYQAIuSpGIy6swvuhR+c2fR/
	UumS2xN78uIy8mVbsWOL2TtCOlA2cLIMTOzSB+qxsEGpg/zmuQBnOdx4Fp3pPdHyyAQ=
X-Gm-Gg: ASbGncvAyMdjFH2NOTl4fA5Ah5JNGfaWlp9p0Ae35qmzkz9qwvJOPRU79uxh3UFhY2/
	voUygzgUiU6EeN9wH8OOGXeIb3/D5esc3qQt+ol+L4LkaYa9f1ujjPuSnaAPdyww3KF8hxKA8jB
	G8kq007zeOyIq355wSRdBKpFzaJ0ub0PplofLsFVT6jK58//TVHQRvxiV3KCoUvA421lmplG369
	vGElbIem4Xp9WHruzGmjNjpHOj+c4IKWiSkN8JJCJ5qUMwa9xj8VrLrnAq9rhBx08nVLRVL4Lu8
	XxAgKPaGvqNfVJ14OeSP54wNr12Gh8iToxlrP8olk2jZOsTxWze1fvytFzP7V4jZQb+lRdyvhXP
	Xf7eVqM19/67eWdRoBaaA72ixyH7XYZCuC6vrhH/VFu2mmdb4tzKcxVt3fo2yIFBjRRZXt6SouW
	dxv8O+19Ftsqlx
X-Google-Smtp-Source: AGHT+IFF8kxUes3UFZ/iPcURSxsxpGZGbUCV4rgSf6BC8Nw9XulL9xf8WQpD9qjmrn6KbrUO3AOgrw==
X-Received: by 2002:a05:6402:23c2:b0:62a:91d5:8844 with SMTP id 4fb4d7f45d1cf-62f84231fcamr2655601a12.21.1758119979856;
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH RESEND v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 17 Sep 2025 15:39:31 +0100
Message-Id: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Original cover letter further down.

This is a resend of two patches from the original series that haven't
been merged yet. That series was merged except for the attached two
patches here. Other than rebasing against next-20250729 there are no
changes to them.

Lee, I think Stephen's intention was to get these two merged via the
MFD tree please.

Original cover letter:
----------------------

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- just a rebase & resend of the last two remaining patches
- no other changes
- Link to v4: https://lore.kernel.org/r/20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org

Changes in v4:
- various updates to sec-acpm (patch 9, Lee)
- cache enum type in patch 25 (Krzysztof)
- collect tags
- Link to v3: https://lore.kernel.org/r/20250403-s2mpg10-v3-0-b542b3505e68@linaro.org

Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (2):
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      clk: s2mps11: add support for S2MPG10 PMIC clock

 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 drivers/clk/clk-s2mps11.c                                    | 8 ++++++++
 2 files changed, 9 insertions(+)
---
base-commit: 54efec8782214652b331c50646013f8526570e8d
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


