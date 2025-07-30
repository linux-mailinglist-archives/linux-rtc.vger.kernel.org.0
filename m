Return-Path: <linux-rtc+bounces-4604-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7DB15BA5
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 11:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278CA548591
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED4B2777E1;
	Wed, 30 Jul 2025 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLCOVJYn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB1A26C3A6
	for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867914; cv=none; b=WhqFgL5W5TOuvhqaTZTrPSLGMxQJyKBCEkrAi6gDW1Wh4zpEgqQ3tFqni6WWt+E01w+ofjocLEcwBMCT6LaAXjykv4hjnvVwS0EYQi8bblt+Ig0d6bWUFQgaxgEEvU5u0iTKdWhi8joXnuAFPwN5fkW3KrPqZbDJ8pU3XDhZAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867914; c=relaxed/simple;
	bh=JQvshfvimgHfM0RiZnHUyLwR4iIsBOC1lbymHIY70KQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uIzo4IyW5uKime5rCXtM1h9EwAmRaIOgu3zGzETPy3LZAEmq7o5keBpTlLKiErTM3AVm8Sh+RrKKwMeuhYYBEKlSFfCPtYPOeqAjxQ9svk31hbUmtHy1gxB/+hIijVlZSRURZqYIiX+vlpFnRLOFsr4Gl6DRMyeOEkadTBf3y2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLCOVJYn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so3233009a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=ZLCOVJYnswBPPpfve49dvoNBPTURF6JGwYE52NYmL6TDVwQbrcoB8JMOABRzBgzVxL
         lW7NC8GtIgB1n/fNWFFFFcjAZJjRk6w2HGXg6WjAG/RdjvVmvOcJfxlXna/QIGAIbjCo
         2bG4p1gx91lHn5XGnf47JqMwiOx48Iw2R4J5JaCqYRW7nGl/JgdKUwba0BbI0s/juoYD
         M37Qmy3WZrZvXXei2c3ogzJxE3wx24ACWlIEkjhd8kjJTej6UUcZkcJCVOx+3DYEEIVu
         fjdZQdII/L93zkLFY7bqhDz6q7JTWz/kZKfi97V6afm8vm21X3PrZVkaWvxaM+D3i540
         iiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=SKGjEE2zNob5bFKwneO5rhtbYtUx6SzV/qkfoCxW+rBjU3ZgZu6KjqZqHZ298dnBdQ
         KEBmsKTeGjCy3faMkB0x+6YQfs3CfuOJoLAO7g88H5iJtcgmZUf6tu7TkZuCJiGr9v72
         yXyx9x57XnSTvAgf2IK8MtWW/66G9IB3bmd6X4Xg6AJr3O7RF06rQULAIrXSLvHzmdCi
         6o4dbUK3rYv50xF3c2vgPlG+j0EOK1FwMvY8gdX8XwoEcPOJgi/G5r2trGsLpMhxmLxA
         c3KJDmKpWD+d7LsmR3TwltkfwkrbJKt0QoxK2CIhniiCpoT3gBZddjOH8GqMjQ/xHvQA
         N8aA==
X-Forwarded-Encrypted: i=1; AJvYcCUTN7l0+N3+qUuZQWTyNCt3hQ1GLchcNy3xIfME3+9jRy4k0KwbwerLcPajjpFuAzDXRNJvDkKaD9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTcUG8WFXAPk7+l/ii2RZItMuO1MVcCH8us4J8G9JUX9zA448
	qP8mzoMfpx1QXb80C7Fpdp2dNzaTHZKss4IA2DV+LFcbED56cenWDY9WLqg/197YqAc=
X-Gm-Gg: ASbGncvYlJqH6UO02RbrcD2VSjEkcU339V3nLdWdQnghv8qRZJ4ERLB/MD+ubErd3tB
	yLOMFHFgLqPEwO2WRi3ccJhRexNpEne1Z3D+U0IWmuPv4U+OHKWfkPVXep7P/nLD3MHzARtgseR
	RmWfZmXWmnuFkUy+TNh3/c8HKTBxGJh8+CChizQAg589RFz9jnnAPQKGMYGwhLfHE6Dett3N+33
	LUy9hSvhP1ndZrG1lWAmuqlhqy9PeT6k9tL0io8//2MB1YnSLP+HtKIDf66UWnRICUrQ6A8aaUp
	qy8rB9vDB9FAaonMt9lXr/yQF3LyMOzNiEPRGuIOG2Q8g1SwfWSlXM++34sgDXYntzZiwnU97in
	OawvYCHmPjuubud3NmDpHJt5TVUzcLllEYXc6j8Lq08q+lqOi5iVVeGzfp7WnTP48wb9Z5K4CIh
	oGDYQtww==
X-Google-Smtp-Source: AGHT+IHblx3Qz+7RLXy0BsXAU+JhtlCfvSdqO2qWeJIEcuKpggfXj3qv90ALBrzdmml33C0iVYKiqQ==
X-Received: by 2002:a05:6402:35c3:b0:615:79b9:28ba with SMTP id 4fb4d7f45d1cf-61586eef0e9mr2633422a12.6.1753867909762;
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 30 Jul 2025 10:31:33 +0100
Message-Id: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHXmiWgC/2XOTQ7CIBAF4KsY1mIGBvrjynsYFyJDJdHSgGk0T
 e8u1WhrXL7JfG9mYImip8S2q4FF6n3yoc1Br1fsdD62DXFvc2YSpAaUgid57RoBnJy2goxFUMj
 ydhfJ+furaX/I+ezTLcTHq7gX0/TTgd+OXnDgFqpaYQmyhHJ38e0xhk2IDZtKermE1QxlhkYrS
 4ToTGH+IM5QweIivqE0qEFTUf1BtYT1DNX0alFY7bDOB90PHMfxCcaAvPNKAQAA
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
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


