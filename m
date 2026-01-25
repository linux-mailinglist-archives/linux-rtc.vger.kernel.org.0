Return-Path: <linux-rtc+bounces-5878-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF/cDLlvdmnyQgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5878-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:32:09 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300D82336
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 919133006B27
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 19:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2928E2F362D;
	Sun, 25 Jan 2026 19:27:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB992F0C45;
	Sun, 25 Jan 2026 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369242; cv=none; b=PLQIU0ecX/fJ1LCF8uwgS27EY7KgYuUUKr4dyTOq14XNNWs+FLptpe716sT+/NmmEm99HaI2402jJiJKbb8ETEU9F+YqpPLhCPpMSinXvhd8Iv8vcoaebXyvK1rFmqU9bYAJUdE6sW1GIdFhEKlN5vV0Uh3lfFWBS+ylcpDuv8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369242; c=relaxed/simple;
	bh=CozdFXiSA7xUiBI/MIqTTQtKj658HtnSPS1kFi0S6Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKXAim8AUbezBVsK/zXHQg+0tckX/U1343HShRtPKv2hla/dF/1Kb7c0a+/ibnz+he3wPFvfkkm+X+tsuSDzecLP69V2sv7k1eQXXjiEvy8WPrzX8/FGdYbJwlAyhYUEl2QTTjsnGG29DHbiQGoO1X+xvtNq5XO0QhJ997652DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: F0m6/hOGRyKe7eKgM3efzA==
X-CSE-MsgGUID: k3yXWxStTOmDi3cmVgLZHg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2026 04:27:12 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B65C4035223;
	Mon, 26 Jan 2026 04:27:07 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/5] Add RTC support for the Renesas RZ/V2N SoC
Date: Sun, 25 Jan 2026 19:27:00 +0000
Message-ID: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5878-lists,linux-rtc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,bootlin.com,kernel.org,glider.be,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:mid]
X-Rspamd-Queue-Id: 0300D82336
X-Rspamd-Action: no action

Hi,

This series adds RTC support for the Renesas RZ/V2N SoC.

The Renesas RZ/V2N RTC IP is identical to the IP found on the RZ/V2H
SoC. This series updates the bindings and the SoC/board dts files.

Best regards,
Ovidiu

Ovidiu Panait (5):
  clk: renesas: r9a09g056: Fix ordering of module clocks array
  clk: renesas: r9a09g056: Add clock and reset entries for RTC
  dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support
  arm64: dts: renesas: r9a09g056: Add RTC node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC

 .../bindings/rtc/renesas,rz-rtca3.yaml        |  5 ++-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 15 +++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  4 ++
 drivers/clk/renesas/r9a09g056-cpg.c           | 40 ++++++++++---------
 4 files changed, 45 insertions(+), 19 deletions(-)

-- 
2.51.0


