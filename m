Return-Path: <linux-rtc+bounces-6139-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBfCAHrZqmnmXgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6139-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:41:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC3221ECA
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C8AF3080C1A
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 13:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221032FFFA4;
	Fri,  6 Mar 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0+11BaZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72652FB0A3
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804057; cv=none; b=mU/Qlw0A5lFz5X0Z/+zw3mcv1+DSO6aCClN81h2MUujAVo2XT05LvfxGMTfvn0Jf5TmXacHNkqmp6JUhY0YCyGRtqR2KvwU5YJEl4U4zyV3QWtYDR7jtwZI2ck2BXuRmE+w+n1WXIPkaOPD/w0HU9o04NVP6eLW1PC2KAG7ef3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804057; c=relaxed/simple;
	bh=QmVZnymuKZyt+jas88ZdM1RSMSq6eliSCZ7w1JjExYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+SANjYo4YUm3KJcUKYsTL/tefX1JiS9RnAOLa9EI0RpbDKpnyJY79oV9eB3oLe+ZcXNHn1gLVGqoCveAFk6gpO3ai5zD8JscxQBI4RZQdUu3Sp+t4RnDiwCQjpBj82+HRyebsAF+pMwH2tUBctwWOrV7MLGe0bEaHwyZQW8MRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0+11BaZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4833115090dso95309835e9.3
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2026 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804054; x=1773408854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHL/Lpt5xGEmKGDVXqkxWpU21U0hJ9K+23Ta0DfsIv0=;
        b=F0+11BaZ8qBHF2H/cKlbTEPjYC+zLmLRvOE7tfV007hWEmdMYXmydf0JnkG3H3IGX+
         BH4fChB6RPelbTSY4mjiavkOvNFHyEWqTLcjCEU89GNc0ANsZ6997aohUsveQAnv2UfY
         VZKG7wGs9QV4J0mTNyxMxqOgUiDvTuIh5c98VL8FKe4BG3XELH3/fHFSOdwYeLoM5UUN
         fFldh15iRLQlYSsX6Vl+rjUj2o14Ro0qTk6bhmJtuYPoG7krpy8eFPVGQoXGUVfZaOZd
         nBu8GviveTKThgUI1Sd6u9kwLMWKRotLTCTTyxLHrSkKYCQBVPwy8orv6OI9OlBJhIcl
         2Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804054; x=1773408854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHL/Lpt5xGEmKGDVXqkxWpU21U0hJ9K+23Ta0DfsIv0=;
        b=bxsvV8Sla/5B4Ho0FAMsRHPRImv9InP1mNOVI0vWLjoWBXYWlbvxdHqqDBhau8gtqy
         bcCMFCK+OP25BCMFor3+hATayBe6X6BpRgkq6PJ0kK10mh5Y+FTNFLsaHYyp+Vp87rL4
         JdKaNNzqOf3HqS2ZOt3ywiRoNTxdWTT/EdvO53hciLHVMAdEahCnpfpTJqdT6+EElUlg
         DCUcjmuY3Mn2HCkluJsSIKtRaVGXAvBJivdu//+NxlaenRMwxsgsdpxKuym8CYDM5BMN
         5URE/vKgOAZ3Qo3s7f7+H5aVaKA8XoXbKFE7vL+NkAPGJxvNsL7Q27ohPUAxr0lvpM0U
         wTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO5VSgmAFrDPqZKsEsR5KIJhcuOMD10V4SRgYqwAtxyGZ0bdk5PUhNV5WGz5XU88n5xbwbME9mzjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXN2xnZmzWquuzus51ge5a1sQKyoZL9dfEuCCmOiK2OdUVpgKX
	+TW0K8ZIHgzwjBfX2Ctlo9Tg8v0eqNJXpLrTw2RqoL2jBdXvjS32gRYt
X-Gm-Gg: ATEYQzxAXl1mjJ59k18YyD8IqUZ7XrTqyvGp1ojMrd1ZfexId6D7c+4NJJK+8hWhj4X
	2IvDFnVEjnrYoINyqdVl/wkxWAHTKLCobVmFxD2dU7tEPSLxEJDkdzMAdPFypIS0OLq76UymWTW
	tO0S/p4Ypq+gWbj4yPzDuqfotZfEJXxxHe+eeEFy3zCIQSaqheO7IzZ+fPRsKcyBPGcHGblhDkq
	V8SIEro5eND46iKffnR7INWDg5uVnXemkwmCemFIPLq5VSWN6A6NCFuAgrFLyOEjfpfGucbFMbH
	49c22zyJlcLkPSLWYSH4d8GI69BOTovvxqplnNXCPtnrKBNXCxiuR3rjWZJ4or2KGix8kowjlJJ
	aTvDfhsqXJvA3w7oGZ5QiajPrLIicyUUfmXjOE1gUqd1Nsajx1hoxvEri7KMlbzcE5ODpfUOrE8
	SAXL3U4V/M8sNu
X-Received: by 2002:a05:600c:a013:b0:485:17a7:b9cc with SMTP id 5b1f17b1804b1-48526958835mr32628385e9.18.1772804053745;
        Fri, 06 Mar 2026 05:34:13 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm80856735e9.4.2026.03.06.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:34:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 0/6] rtc: max77686: convert to i2c_new_ancillary_device
Date: Fri,  6 Mar 2026 15:33:45 +0200
Message-ID: <20260306133351.31589-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8FCC3221ECA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6139-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

I have tested this patch on LG Optimus Vu P895 with max77663 PMIC and
non-default RTC position. RTC is registered correctly.

---
Changes in v3
- max77620 files converted to DT schema.

Changes in v2
- dropped patch that changes max77686 and adjusted max77620 where max77663
  is described.
---

Svyatoslav Ryhel (6):
  regulator: dt-binding: regulator-max77620: convert to DT schema
  dt-binding: pinctrl: pinctrl-max77620: convert to DT schema
  dt-bindings: gpio: trivial-gpio: remove max77620 compatible
  dt-bindings: mfd: max77620: convert to DT schema
  dt-bindings: mfd: max77620: document optional RTC address for MAX77663
  rtc: max77686: convert to i2c_new_ancillary_device

 .../bindings/gpio/trivial-gpio.yaml           |   2 -
 .../devicetree/bindings/mfd/max77620.txt      | 162 -------
 .../bindings/mfd/maxim,max77620.yaml          | 442 ++++++++++++++++++
 .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 ++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 -----
 .../regulator/maxim,max77620-regulator.yaml   |  99 ++++
 .../bindings/regulator/regulator-max77620.txt | 222 ---------
 .../bindings/thermal/max77620_thermal.txt     |  70 ---
 drivers/rtc/rtc-max77686.c                    |  14 +-
 9 files changed, 650 insertions(+), 585 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt

-- 
2.51.0


