Return-Path: <linux-rtc+bounces-5812-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GPsLk60cGndZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5812-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:11:10 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6355C1E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15FE56836AC
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63F3E9F72;
	Wed, 21 Jan 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="CjTbgVW8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17312ECEAC;
	Wed, 21 Jan 2026 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993433; cv=pass; b=V13wyvNgyvQgnTYrGznOy8+gZylqEDIgybnVI5cy2QlvIRR7igO032eKbPtJAvsEnvT9/aslHW+W3QX16a0xt2EthaSgRBfcZfpXadwLA/gV4wJBVEx6p3viwPAAwhK/s2ap17gK7B2J7l4YJ/s348VfjylwcEul4p20MeHMBdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993433; c=relaxed/simple;
	bh=ChAE11uB2J9P96UiiuYNslcAUUgF4nuthjgSsDtHVF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ELhyzqlaVfPWBK0iWok6AAe3iZiab11b3e0nrX7TKFbE5opRB6Pif3CyHlt9Vf4MNTiKYGGopONo3Ee0oklbwH3Ra7/674Kegejhm0FsEYWJn1wnZKeGFuAhJbrWsan8CGLy4+szd3nHKbe41LPtjCVMR/G87X8GbRXLAMUhtEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=CjTbgVW8; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NxKL92tnsCo6rQLAN9YJNpmmDqvjzt9U4JGe1g7aiwG6AjuvGgMM29zvZN/UuDwVNO4xTRmPvnlbr8Qto9c9vhvO2S5CC2UtaOih6qsYSsNfga1i9DNekZ2zxCTw1VhxEgDXimU0wk8IBBKBq/skYtAinjucySgx5SXuzqV0fgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993399; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8lJlN0ug6yApIS1+JqeiBezclov7WidFA1UiDZN5V9U=; 
	b=efPAjUeiloqUEzONBIcm104uCSYV+Jd7sosEuBvl055uP86GX+KZ5U5CcrcDoRu/hoalQGfjvTbIMHU+zQ2To0W6S39JMHRXpNRaJDepCFAkLjqTv5oP2XUAbgOFgszsV/8NKx3x5p5vn0VlM0++W/sWGd7TJrTcHOHnNaW4OAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993399;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=8lJlN0ug6yApIS1+JqeiBezclov7WidFA1UiDZN5V9U=;
	b=CjTbgVW8EfrZNxEdESlIHMgnfutX4+6+3f+to8Kp/yx9l8lYvD0k/iIaEY7tKavc
	pV1m/d6wIrZhRyffdyPIuS4bNTGdSuQuMaU8H68vrRDYsUXj08unjWBHyba0IwvLdBA
	ce4qJoMXPMrfRcPX8j1hSk9KeAzGC4O7NGe9UNMg=
Received: by mx.zohomail.com with SMTPS id 1768993396228245.11544303994697;
	Wed, 21 Jan 2026 03:03:16 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Wed, 21 Jan 2026 18:59:06 +0800
Message-Id: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 d2m3lWgAAAA==
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=2495;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ChAE11uB2J9P96UiiuYNslcAUUgF4nuthjgSsDtHVF0=;
 b=bBFnSuz+/bl9OC2UgQWtIVt3n7YgeDUpeh8pSxTE8n661CU44HU8TTshZjDZ6+L6/JWiLFmCR
 fqRC/Pat1bsAJ5yrD039wyRQNtfu1ddmLFoVDYojR9IhQvWwLmeUqQG
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5812-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 67A6355C1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

To facilitate this addition and improve driver modularity, transition
the binding between the RTC and its internal CCU from direct
cross-subsystem function calls to the auxiliary bus. Also extract shared
IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
across newer SoC generations.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only mux operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

---
Junhui Liu (7):
      dt-bindings: rtc: sun6i: Add Allwinner A733 support
      rtc: sun6i: Bind internal CCU via auxiliary bus
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration
      clk: sunxi-ng: Extract common RTC CCU clock logic
      clk: sunxi-ng: mux: Add mux read-only clock operations
      rtc: sun6i: Add support for A733 RTC
      clk: sunxi-ng: Add Allwinner A733 RTC CCU support

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  38 +++-
 drivers/clk/sunxi-ng/Kconfig                       |   5 +
 drivers/clk/sunxi-ng/Makefile                      |   5 +
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c         | 204 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h         |  18 ++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 184 +++----------------
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_mux.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_rtc.c                     | 136 ++++++++++++++
 drivers/clk/sunxi-ng/ccu_rtc.h                     |  44 +++++
 drivers/rtc/rtc-sun6i.c                            |  38 +++-
 include/dt-bindings/clock/sun60i-a733-rtc.h        |  16 ++
 include/linux/clk/sunxi-ng.h                       |   2 -
 14 files changed, 533 insertions(+), 170 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


