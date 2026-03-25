Return-Path: <linux-rtc+bounces-6252-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC8mDLjqw2lvugQAu9opvQ
	(envelope-from <linux-rtc+bounces-6252-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:01:28 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74D3264F2
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EB46308B56D
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 13:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C8F3DD517;
	Wed, 25 Mar 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="ga0YwnPA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC43D4126;
	Wed, 25 Mar 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446904; cv=none; b=nX8gMNg5kj6bSlAcbfLGTyfGyWb6ViVVe1QlcQ15m49DWFZQOCj700ifOOlTLBTYzZblpJJBLvutbZ0EVUUgP7JNT3upiPMWxyv/J1avWZZVZExxqLV0EvYqSYM4P+KR7NaMiTbgYbBgIKlNdTeeSohbydiQ4JY2Tfj7cgxzbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446904; c=relaxed/simple;
	bh=idYORfntNzscJgnzmbLt4sQ7MvG6p9h0c0IYsRJwjYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OAJ7oCPzSc2VTjTbxR9vHrL22Ry066M3iIjFPoeOEDuQSJaJlIXjzdtdip4tempMO6NySekwnO/TCotdi0CwJUSKhYirgz+bKO+XNkPyPT5BCGbmwm43X1ipEQdgsebi4GrqFfBWU0OVAa3bx2j44oZiv2OadkXGBiCzlT6pv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=ga0YwnPA; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde0:9600:8d27:ae39:1dce:2212])
	by srv01.abscue.de (Postfix) with ESMTPSA id 8D1501C0068;
	Wed, 25 Mar 2026 14:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774446892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NySrszc54viDvcCf1q3Lb9Q3LydmegdeNJJpYp0AhEs=;
	b=ga0YwnPAJAUb4JVDCYPVEMw5uZJPPXQq6YFeNnPsBDH8uPPnsqNqEcD4mWsFON6aV1TE+R
	M+D/l+sRE2lsufQvhoZSRZyJ4V6xgtH9FENyZI1oeK3CMmh4reh1kHQRWZiVnSKx06lTQc
	hw5E0y2oDN+Xm7NEOWmeoO577eERezi3orJ0ZKDx3Hys4fpiNJG9squCqY1nJ0KiEZvD9r
	m/5KOQ8OGfUAWtyyVyd3yce0W0rOyvnQbo5G0Q4fIIgvTvk9ed3/Frmdl8tDjaemxN3BAG
	6/b4uIkgk6MnRG/ocbrIK5Eq59+e6oO31So1yNfq3JcWI4dNMa2kiLfb5g4ZCA==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 0/5] mfd: sc27xx: Use MFD cells and
 devm_mfd_add_devices()
Date: Wed, 25 Mar 2026 14:53:42 +0100
Message-Id: <20260325-sc27xx-mfd-cells-v2-0-d0ebb60aa4a7@abscue.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObow2kC/2WNQQ6CMBBFr0Jm7ZgyCg2uvIdhUdqpNEEgHW0wh
 LtbSVy5fC/5768gHAMLXIoVIqcgYRoz0KEA25vxzhhcZiBFtSIqUSzpZcGHd2h5GASd6XSjKn8
 yhiHP5sg+LHvy1mbugzyn+N4fUvm1vxj9x1KJCuumotqzPlutr6YT++KjY2i3bfsA2AKHPbAAA
 AA=
X-Change-ID: 20260221-sc27xx-mfd-cells-dab7905f3aae
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[abscue.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[abscue.de:query timed out];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6252-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[otto.pflueger@abscue.de,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[abscue.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[abscue.de:dkim,abscue.de:email,abscue.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C74D3264F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These changes resulted from the need to decouple the the Linux device
driver hierarchy from the device tree bindings for two different series
introducing regulator [1] and poweroff [2] support for the SC2730 PMIC.

There are different PMICs in the SC27xx series, including SC2730 and
SC2731. These have a lot of similarities, but some differences too. For
instance, they contain compatible RTC blocks, but completely different
sets of regulators.

On the Linux side, each PMIC block needs its own driver. The MFD driver
currently uses devm_of_platform_populate() to load the drivers for the
components of the PMIC, which only works when each component has its own
sub-node with a "compatible" property that is used to select a driver
for the device.

When viewed from the device tree side, the parent node representing the
PMIC already contains a "compatible" property that distinguishes the
different PMICs. While the device tree bindings currently do require a
separate "compatible" property for each sub-node (ADC, fuel gauge,
regulators, ...), this is essentially redundant since the node name and
the parent compatible uniquely identify the component. Moreover, some
parts of the PMIC such as the poweroff/reboot controller do not even
need a corresponding device tree node.

Change the MFD driver to use MFD cells instead, which allows it to
instantiate sub-devices both with and without device tree nodes.
Devices that do not have a separate device tree node with its own
"compatible" property can be matched by their platform device ID.
Use this to hook up the existing SC2731 poweroff and regulator drivers,
which were previously not loaded at all due to the lack of an ID table.

In the device tree bindings, deprecate the redundant "compatible"
property for the "regulators" node. While it might make sense to do this
for the other components too, there are a few reasons to only change the
regulators at this point:
 - The regulators node is special since it is not as independent as the
   other components. For instance, it is the only child node of the PMIC
   that does not have a "reg" property. The set of regulators also
   differs much more between different PMIC models than the register
   layout of the other components.
 - We already have some other PMICs where only the regulators are
   treated specially like this, such as MediaTek MT6359 and MT6370.
 - It was suggested to remove the "compatible" property for the new
   SC2730 regulator bindings I am preparing in [2]. The bindings for
   the other components do not need any significant changes at the
   moment.
 - Unlike the poweroff and regulator components, the other parts are
   already working with the existing drivers and bindings.

For the other components that still have a "compatible" property used
for matching MFD cells, ensure that an SC2730-specific compatible is
defined in the bindings so that it can be listed in the SC2730-specific
device table in the MFD driver.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>

[1]: https://lore.kernel.org/all/20250926-sc2730-reboot-v1-0-62ebfd3d31bb@abscue.de/
[2]: https://lore.kernel.org/all/20260220-sc2730-regulators-v1-0-3f2bbc9ecf14@abscue.de/

---
Changes in v2:
- Changed PMIC type matching in MFD driver to use an identifier like
  other drivers instead of passing pointers through of_device_id.
- Rebased on next-20260324.
- Link to v1: https://lore.kernel.org/r/20260222-sc27xx-mfd-cells-v1-0-69526fe74c77@abscue.de

---
Otto Pflüger (5):
      dt-bindings: rtc: sc2731: Add compatible for SC2730
      regulator: dt-bindings: sc2731: Deprecate compatible property
      mfd: sprd-sc27xx: Switch to devm_mfd_add_devices()
      power: reset: sc27xx: Add platform_device_id table
      regulator: sc2731: Add platform_device_id table

 .../devicetree/bindings/mfd/sprd,sc2731.yaml       |  2 -
 .../bindings/regulator/sprd,sc2731-regulator.yaml  |  4 +-
 .../devicetree/bindings/rtc/sprd,sc2731-rtc.yaml   |  7 ++-
 drivers/mfd/sprd-sc27xx-spi.c                      | 62 ++++++++++++++++++----
 drivers/power/reset/sc27xx-poweroff.c              |  8 +++
 drivers/regulator/sc2731-regulator.c               | 10 +++-
 6 files changed, 77 insertions(+), 16 deletions(-)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260221-sc27xx-mfd-cells-dab7905f3aae

Best regards,
-- 
Otto Pflüger <otto.pflueger@abscue.de>


