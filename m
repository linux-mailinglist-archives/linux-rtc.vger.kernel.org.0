Return-Path: <linux-rtc+bounces-6158-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPxZCE6MrmnlFwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6158-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 10:01:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F99235CBD
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 10:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C19B3037891
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2026 08:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3E627B357;
	Mon,  9 Mar 2026 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="OMeGQgsO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6E36F40E;
	Mon,  9 Mar 2026 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046732; cv=none; b=H0jtncNrpcLyAjt1Ew7lt661rej1MPbP/ScadntPnbYUK+SqMSjk/c6OTrBJbJcjR52MNVEHYG7N9M3us9hORMpb7jIth4NFs/v8wjJX8IyKPwvA7+9iKVB858wiumONQO7eonKOK24ze0AKPhFfA2oqagp8oYDMNIVaUyI5OuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046732; c=relaxed/simple;
	bh=eCONjMsAgxgvPoZCScOH/hRofDA6ahKRJHWeoxdyoJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSTt7iLkgrGALgdj0rCWg/KmHZjPpCW0x/AuXejrQlIHQrpS0DR1bYR8VVT+xxPCmsGmZaz+/V971uJWE48e5k4/IwO13iwpdH2unppP1bFKxQy+FvKjWTIXem79/i4igjG25thTtZADcUPj1QTc9JwKLyf3G5VVsGEjE2hDXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=OMeGQgsO; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1773046717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y99r0w3uvANePHf5fQI+vO5duMCpkElUfeZ9uqmXL/A=;
	b=OMeGQgsOMQfKeYMepAkcSFK6Pmo3P2OnR9lElVhTasV7aPzEeAHNVeu+oMmENaTUo6Y2MY
	7DYqHW85Zd6YGRXVYHHFyq61o38AhxF7LYfFJ7Ly29AYf2epva9H0piiUSsi844nmyJ5+z
	Lw3QXwoE46Q0vmU08fw/Z7+z/ru94w6Wv8F+Ja5bgfI7Kmihm53barnTFuPiQe3dsZjSfF
	SMY0IoI7lGhqNHl049lBGsrMd27FxZCoBNmfXghy37eZRn8ZzVnSFn/+ILrA2C1wdJiUJ8
	k1fWTYwdDauIoag9Iz2Zey8yT7LLqAhcs/KTWoUQhn5ucoKd6JrknKkqD6cHHQ==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/2] Kontron i.MX8MP OSM Devicetree Fixups
Date: Mon,  9 Mar 2026 09:57:41 +0100
Message-ID: <20260309085749.25747-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 70F99235CBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[fris.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[fris.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kontron.de,gmail.com,pengutronix.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-6158-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frieder@fris.de,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fris.de:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kontron.de:email,fris.de:dkim,fris.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This contains three fixes and one cosmetic change for
the Kontron i.MX8MP OSM devices.

Changes for v3:
* Drop applied patches
* Add missing bindings patch for RV3028 RTC

Changes for v2:
* Add Frank's R-b tags (thanks)
* Enhance commit message of patch 2

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (1):
  dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply

 .../devicetree/bindings/rtc/microcrystal,rv3028.yaml        | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi     | 6 ++++++
 2 files changed, 8 insertions(+)

-- 
2.53.0


