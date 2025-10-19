Return-Path: <linux-rtc+bounces-5095-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD24BEE1B6
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC9F24E4646
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899BF2E06E4;
	Sun, 19 Oct 2025 09:21:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8156D2DFA4A;
	Sun, 19 Oct 2025 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865683; cv=none; b=WQvRCYWErC+/p8pw9Jls66RuuSrLAQInq4orsXHrTE7Qlb36/Q57oLU3m4hmoXyUmICH6sB5Wo1rI50Y+4uIkFE4GRhp50W/jxWQafjCscS8Sf6eENp8UW+uRO6e5Y/1mV2Cyf6fi0T+F56+v7NBbesomyAlDgEW3+8LTvnqgzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865683; c=relaxed/simple;
	bh=tLKpJyxvlmQ9U/ALJjzP67xU/u9xd0M7cCT/y5qEVfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXPof2AXCjURhD5eifvSKSWPto/tzQO5sDEo4p1gTNCEST0UUE1l4KF0F5c3RiQtZ/OffvFcx3GV/YqZbeEwuQJ30UcjTOVwZyUo7BWaBmsrQ7Ry7lFYFeh2CueomDNa21HhwigFWFztz/CEOqUuCg8yVYcgQwOePe3kA380rlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: iDe8MJGkSL6mtt8EUinhsw==
X-CSE-MsgGUID: NLgvOtY+SZqlO/b7WCJblQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:13 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5DD54416251C;
	Sun, 19 Oct 2025 18:21:08 +0900 (JST)
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
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] Add RTC support for the Renesas RZ/V2H SoC
Date: Sun, 19 Oct 2025 09:21:00 +0000
Message-ID: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds RTC support for the Renesas RZ/V2H SoC.

The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
(r9a08g045), with the following differences:
- it lacks the time capture functionality
- the maximum supported periodic interrupt frequency is 128Hz instead
  of 256Hz
- it requires two reset lines instead of one

Best regards,
Ovidiu

Ovidiu Panait (6):
  clk: renesas: r9a09g057: Add clock and reset entries for RTC
  dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
  rtc: renesas-rtca3: Use OF data for configuration
  rtc: renesas-rtca3: Add support for RZ/V2H SoC
  arm64: dts: renesas: r9a09g057: Add RTC node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 33 ++++++++++++++++---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 14 ++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 +++
 drivers/clk/renesas/r9a09g057-cpg.c           |  4 +++
 drivers/rtc/rtc-renesas-rtca3.c               | 27 +++++++++++++--
 5 files changed, 74 insertions(+), 8 deletions(-)

-- 
2.51.0


