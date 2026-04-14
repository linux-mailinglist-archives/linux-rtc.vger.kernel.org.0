Return-Path: <linux-rtc+bounces-6316-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDq4Nf7f3WkYkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6316-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:34:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3553F606E
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1273044825
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2B636C9DF;
	Tue, 14 Apr 2026 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Gq4WNNsb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77C4A0C;
	Tue, 14 Apr 2026 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148396; cv=none; b=LSpSVF88vuxhEuxEfn4ukvd/tDTb4GQSkS36bTw9GZw/To2Li3axdsEkorhraGjMDYnnowpNVwtUXnl8Kku37hSDudsNL+xpHe/uibSH1eNIrxxkVNhbHczu0d/czVhbpQAlUOMTLSm2Go5vTi6vouHDOc3kcPCqauTNWXoW/g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148396; c=relaxed/simple;
	bh=x5EL59GGZCTWzXXjg1+hGKudmcFlG7lTbxYSMeTKHi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KvBgnjH6d1ZBidPi5yI7qTOgg1z0nRehgBt1hEeJBpLCE6OKMFIHArVxbAh7lnJdd5Xkys4pRR6D/7xL/7qIjTPVDgvbQK/0dgif+7JpZBqlkuKVqYpb1Wi52efHbUwE0kI1AX59ljhphaWzF2QRnmaJSvqtfUdIsjtHk53N4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Gq4WNNsb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EBFEC25F7C;
	Tue, 14 Apr 2026 08:33:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2RvONth9XC8; Tue, 14 Apr 2026 08:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148385; bh=x5EL59GGZCTWzXXjg1+hGKudmcFlG7lTbxYSMeTKHi0=;
	h=From:Subject:Date:To:Cc;
	b=Gq4WNNsb1h0cKRJkuPzo8yxjGOexyNAVAlcFI3bLEQS2MSTsPuA5yiFxaHymUyrR3
	 jPmdzzG1/yKmG9ahqVYqmnTNBLORmHBckoOB86dWTwmCSj/DhnWAPb30yjlZRhpH2x
	 MRiECMqtN2oFvPQ9wgjaN0FnSGrg+aXrKhR5mxS4mM1+AMUR6NAaI55iHjweEDAf/o
	 JohiJJrpSWRKyLsVdjzz6sil3r8ULl9jbXx6mWjaZgA89JxUOq46qUU9Hw+PQNztvP
	 JfuHb+UYbvyLebOI14XdTF2uig+nJPJQPrA8o1VD3X7wuUjAsUfO9UJ38AExV+mW7k
	 UvpINXxsQ3WaA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 00/13] Support for Samsung S2MU005 PMIC and its
 sub-devices
Date: Tue, 14 Apr 2026 12:02:52 +0530
Message-Id: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJTf3WkC/2XMTQ6DIBhF0a0YxqWBjz/tqPtoOkCEloFiwJo2x
 r0XTUyjHb6XnDuhZKO3CV2KCUU7+uRDlwc/Fcg8dfew2Dd5IyAgKKWAE7QvQgTuW28wMVI5LWt
 tmEGZ9NE6/15zt3veT5+GED9rfaTLu4X4PjRSTHBlGS15wzQx1bXxKYYwnEN8oCU1wsYloSAPH
 DJXpaNaCSe40v+c/TiAOHCWec21s7biShK25/M8fwHS6SMjKAEAAA==
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
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6316-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A3553F606E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
dt-bindings - 01, 02, 03, 04, 05
mfd         - 05, 06, 07, 08
led         - 01, 02, 09, 10, 11
extcon      - 03, 12
power       - 04, 13

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
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

---
Kaustabh Chakraborty (13):
      dt-bindings: leds: document Samsung S2M series PMIC flash LED device
      dt-bindings: leds: document Samsung S2M series PMIC RGB LED device
      dt-bindings: extcon: document Samsung S2M series PMIC extcon device
      dt-bindings: power: supply: document Samsung S2M series PMIC charger device
      dt-bindings: mfd: s2mps11: add documentation for S2MU005 PMIC
      mfd: sec: add support for S2MU005 PMIC
      mfd: sec: set DMA coherent mask
      mfd: sec: resolve PMIC revision in S2MU005
      leds: flash: add support for Samsung S2M series PMIC flash LED device
      leds: rgb: add support for Samsung S2M series PMIC RGB LED device
      Documentation: leds: document pattern behavior of Samsung S2M series PMIC RGB LEDs
      extcon: add support for Samsung S2M series PMIC extcon devices
      power: supply: add support for Samsung S2M series PMIC charger device

 .../bindings/extcon/samsung,s2mu005-muic.yaml      |  39 ++
 .../bindings/leds/samsung,s2mu005-flash.yaml       |  52 +++
 .../bindings/leds/samsung,s2mu005-rgb.yaml         |  34 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 124 +++++-
 .../power/supply/samsung,s2mu005-charger.yaml      |  39 ++
 Documentation/leds/index.rst                       |   1 +
 Documentation/leds/leds-s2m-rgb.rst                |  60 +++
 drivers/extcon/Kconfig                             |  10 +
 drivers/extcon/Makefile                            |   1 +
 drivers/extcon/extcon-s2m.c                        | 354 ++++++++++++++++
 drivers/leds/flash/Kconfig                         |  12 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-s2m-flash.c                | 357 +++++++++++++++++
 drivers/leds/rgb/Kconfig                           |  11 +
 drivers/leds/rgb/Makefile                          |   1 +
 drivers/leds/rgb/leds-s2m-rgb.c                    | 446 +++++++++++++++++++++
 drivers/mfd/sec-common.c                           |  37 +-
 drivers/mfd/sec-i2c.c                              |  29 ++
 drivers/mfd/sec-irq.c                              |  74 ++++
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/s2m-charger.c                 | 300 ++++++++++++++
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  66 +++
 include/linux/mfd/samsung/s2mu005.h                | 332 +++++++++++++++
 25 files changed, 2387 insertions(+), 6 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20251112-s2mu005-pmic-0c67fa6bac3c

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


