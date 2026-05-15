Return-Path: <linux-rtc+bounces-6522-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJD5OpCSB2pU9AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6522-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4265583EC
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEDB43013266
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420773ED5C9;
	Fri, 15 May 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cXyEcIrq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF6365A1A;
	Fri, 15 May 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881141; cv=none; b=btxcc6oa83/EGc3OKUPUKBVGQb3wmKgylqxqNWH7yKDG0/BIZ8MBBH72QeiUEa2gGI5wDjz2bUraiEy84RKcROv2RLxOqvigqsO5Kgq6Lb3HadcpubBJKmNE9O71wtmEvUpFPAAzI3aFiwUKAHSvuc0u+aDtNAKh1yy7ZjAyZH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881141; c=relaxed/simple;
	bh=gtqm1+szNLp2jwNm6jjF6Mm1t3vnsm1dmQ641nHywG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OLLKIChWwacarDBY3hMW8J1oecDJESg60uIKWSuYs0cWHPhW+T8HNVLIqqe4TuN0EaK8iiDrnU/fIdVLEhoB6hUZhV3gCv59n308Z7ajm9VexKvprphzT9vDzPjxTBiYD0IyV1i2+9xBBFUYTrUBdb2FQIzaPV6zcRPQImK6S0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cXyEcIrq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CF76027198;
	Fri, 15 May 2026 23:38:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GD6M3Ixz-pbv; Fri, 15 May 2026 23:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881137; bh=gtqm1+szNLp2jwNm6jjF6Mm1t3vnsm1dmQ641nHywG0=;
	h=From:Subject:Date:To:Cc;
	b=cXyEcIrqY8lE87UkP3uKV2mQt6IRFmIkW9JMsbDdNnS5JMUL6b2IVIqLdcQYHrJNI
	 ZUkfhkjAndmW+WeJKhGhb2AxvQR1djJyCSjWVqSSvnJzEWVUQ5t3Ut54ay/NLW4m1j
	 I6lWhnEqe0hUO3DX8BcMMCcsmcIN3mPgPagtezLXY8GJReK0V0Dtoiv4hvFp0gA8+j
	 qMigiyklycfaBS9Xj2n5883VCipmbw6eIu8Y5WVOaLts3md4yYedyvZFjfsO04ql5y
	 00umDfqPU18p/ZEuEKQPeA10UUfdo9qKP/LiKYm5Pq57hHtHzG58G8IznO5DUe4zHL
	 wps0dlDs+9Phg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v7 00/10] Support for Samsung S2MU005 PMIC and its
 sub-devices
Date: Sat, 16 May 2026 03:08:32 +0530
Message-Id: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFmSB2oC/2XOy27DIBCF4VeJWJdqZriZrvoeVReYS8IicQSp1
 SryuxdHitya5UH6fubOaiw5VvZ2uLMS51zzdGnDvByYP7nLMfIc2mYEpBCReKXzF4Di13P2HLw
 2yenReeFZI9cSU/5+5D4+2z7lepvKz6M+4/r6DMn/oRk5cBsFDjIIB96+h1zLNN1ep3Jka2qmJ
 9eApHecGjdDQmdUUtK4nouNE6kdF42P0qUYrTQaRM/lxmV3vFx/T9HIAZQxUfdc/eG056rx5Ed
 vg1MOQPZcb1zh/njdOFpjEbS1FHZ8WZZfkF7LX+UBAAA=
X-Change-ID: 20251112-s2mu005-pmic-0c67fa6bac3c
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5D4265583EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-6522-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

S2MU005 is an MFD chip manufactured by Samsung Electronics. This is
found in various devices manufactured by Samsung and others, including
all Exynos 7870 devices. It is known to have the following features:

1. Two LED channels with adjustable brightness for use as a torch, or a
   flash strobe.
2. An RGB LED with 8-bit channels. Usually programmed as a notification
   indicator.
3. An MUIC, which works with USB micro-B (and USB-C?). For the micro-B
   variant though, it measures the ID-GND resistance using an internal
   ADC.
4. A charger device, which reports if charger is online, voltage,
   resistance, etc.

This patch series implements a lot of these features. Naturally, this
series touches upon a lot of subsystems. The 'parent' is the MFD driver,
so the subsystems have some form of dependency to the MFD driver, so
they are not separable.

Here are the subsystems corresponding to the patch numbers:
dt-bindings - 01, 02, 03
mfd         - 03, 04, 05
led         - 01, 06, 07, 08
extcon      - 02, 09
power       - 10

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v7:
- Add missing tags collected from v5
- Add trailing `#` in s2mu005 mfd dt-schema (Sashiko AI)
- Squash [v6 04/11] with [v6 06/11] to prevent bisect regression (Sashiko AI)
- Remove ack_base from regmap IRQ as not needed by hardware (Sashiko AI)
- Update commit message of [v6 04/11] (Sashiko AI)
- Fix reference to leds-trigger-pattern in [v6 09/11] commit (Sashiko AI)
- Remove Kconfig `select REGMAP_IRQ` from [v6 07/11], [v6 08/11] (Sashiko AI)
- Implement lock for s2m_fled_flash_{brightness,timeout}_set() (Sashiko AI)
- Remove superfluous lock from s2m_fled_flash_external_strobe_set() (Sashiko AI)
- Remove incorrect (void *) cast to s2m_fled_v4l2_flash_release() (Sashiko AI)
- Change regmap_{s/update_bits/write} for slope setting in
  s2mu005_rgb_apply_params() (Sashiko AI)
- Allow for extrapolation in s2m_rgb_lut_get_closest_duration() (Sashiko AI)
- Explicitly initialize ramp_{up,dn}_en in s2m_rgb_pattern_set() (Sashiko AI)
- Use duplicated s2mu005_rgb_subled_info for allowing multi-driver (Sashiko AI)
- Change s/CDP/DCP in s2mu005_muic_attach() (Sashiko AI)
- Remove EXTCON_USB state from USB DCP (Sashiko AI)
- Move muic_attach call to irq init, preventing undefined extcon (Sashiko AI)
- Properly propagate errors in platform_get_irq_byname_optional() in extcon-s2m
  (Sashiko AI)
- Use duplicated s2mu005_muic_irq_data for allowing multi-driver (Sashiko AI)
- Fix if-else-if chain in s2mu005_chgr_get_usb_type() (Sashiko AI)
- Consider errors in extcon_get_state() call (Sashiko AI)
- Handle NULL possibility on extcon child node in charger (Sashiko AI)
- Link to v6: https://patch.msgid.link/20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org

Changes in v6:
- Fix build, UAF, and functional errors with
  CONFIG_V4L2_FLASH_LED_CLASS=m (Lee Jones)
- Remove (ret < 0) wherever redundant (Lee Jones)
- Remove extra conditionals for supporting multiple variants (Lee Jones)
- Fix OOB condition in initailizing flash LED channels (Lee Jones)
- Declare i inside for, like: for (int i = 0; ...) (Lee Jones)
- Rewrite and simplify closest timing function for clarity (Lee Jones)
- Link to v5: https://lore.kernel.org/r/20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org

Changes in v5:
- Drop port property from charger dt binding (Krzysztof Kozlowski)
- Create separate dt binding for S2MU005 MFD (Krzysztof Kozlowski)
- Move RGB LED and charger schema to parent schema (Rob Herring)
- Fix error of using invalid revision mask
- Link to v4: https://lore.kernel.org/r/20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org

Changes in v4:
- Use OF graph to connect charger with MUIC in device tree
- Move DMA coherent mask to all MFD PMICs (André Draszik)
- Modify pointer names for flash/RGB drivers (Lee Jones)
- Use 100-char line wrap for flash/RGB drivers (Lee Jones)
- Revamp LED device initialization in flash driver (Lee Jones)
- Add proper USB 2.0 support in charger driver (Łukasz Lebiedziński)
- Link to v3: https://lore.kernel.org/r/20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org

Changes in v3:
- Remove "extcon" text from dt-bindings documentation (Rob Herring)
- Add connector for MUIC node
- Fix dt binding errors reported by robh's bot
- Fix kernel test robot const errors 
- Remove FIELD_PREP() values in register header file (André Draszik)
- Add max_register, volatile_reg, cache_type (André Draszik)
- Redo [v2 07/12] to NOT store the PMIC revision (André Draszik)
- Add a commit to fix DMA coherent mask in I2C PMICs
- Implement various flow changes in flash LED driver (André Draszik)
- Use device_for_each_child_node_scoped() (André Draszik)
- Fix CFI panic in devm_add_action_or_reset()
- Link to v2: https://lore.kernel.org/r/20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org

Changes in v2:
- Drop [v1 06/13], instead use regmap_irq_chip::get_irq_regs() 
- Remove references to driver in devicetree commits (Conor Dooley)
- Propagate errors of sec_pmic_store_rev() (André Draszik)
- Fix documentation language errors (Randy Dunlap)
- Link to v1: https://lore.kernel.org/r/20251114-s2mu005-pmic-v1-0-9e3184d3a0c9@disroot.org

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: André Draszik <andre.draszik@linaro.org>
To: Nam Tran <trannamatk@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Kaustabh Chakraborty (10):
      dt-bindings: leds: document Samsung S2M series PMIC flash LED device
      dt-bindings: extcon: document Samsung S2M series PMIC extcon device
      dt-bindings: mfd: add documentation for S2MU005 PMIC
      mfd: sec: add support for S2MU005 PMIC
      mfd: sec: set DMA coherent mask
      leds: flash: add support for Samsung S2M series PMIC flash LED device
      leds: rgb: add support for Samsung S2M series PMIC RGB LED device
      Documentation: leds: document pattern behavior of Samsung S2M series PMIC RGB LEDs
      extcon: add support for Samsung S2M series PMIC extcon devices
      power: supply: add support for Samsung S2M series PMIC charger device

 .../bindings/extcon/samsung,s2mu005-muic.yaml      |  40 ++
 .../bindings/leds/samsung,s2mu005-flash.yaml       |  52 +++
 .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 ++++++
 Documentation/leds/index.rst                       |   1 +
 Documentation/leds/leds-s2m-rgb.rst                |  60 +++
 drivers/extcon/Kconfig                             |   9 +
 drivers/extcon/Makefile                            |   1 +
 drivers/extcon/extcon-s2m.c                        | 370 ++++++++++++++++++
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-s2m-flash.c                | 350 +++++++++++++++++
 drivers/leds/rgb/Kconfig                           |  10 +
 drivers/leds/rgb/Makefile                          |   1 +
 drivers/leds/rgb/leds-s2m-rgb.c                    | 426 +++++++++++++++++++++
 drivers/mfd/sec-common.c                           |  37 +-
 drivers/mfd/sec-i2c.c                              |  29 ++
 drivers/mfd/sec-irq.c                              |  73 ++++
 drivers/power/supply/Kconfig                       |  10 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/s2m-charger.c                 | 313 +++++++++++++++
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  66 ++++
 include/linux/mfd/samsung/s2mu005.h                | 332 ++++++++++++++++
 23 files changed, 2308 insertions(+), 6 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20251112-s2mu005-pmic-0c67fa6bac3c

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


