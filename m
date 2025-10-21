Return-Path: <linux-rtc+bounces-5111-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3230BF5285
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 10:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E24A0403421
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 08:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD552E2847;
	Tue, 21 Oct 2025 08:07:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F2B26CE39;
	Tue, 21 Oct 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034036; cv=none; b=K8jr+nLSRHmbIzdF2hHa7poQoTAEwMwmllU8feastLbLGl85HbHCNOtRSfJjhGNRVqvngWzfS2AtpEiHggFrYTk0m5Ikyu90NJVlqhkAWEbKyHA7Kvy/73CwC/TNQvvQw3wJMwhMPTA7/dcEFwEJ2xJ5wMo1xwSc3rHmBy29lKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034036; c=relaxed/simple;
	bh=4kb2HYMejoySv9w9Q1uqYRANRQcyxQHbsxi04sg7A6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gy8aX6US54lJWQUOyLcSOiDIdotsNJrDuJYCpP+vSu+KLdSE2y+8KuwMIDertuBEgOM3QYNYPol9S9V2hhVTFN8/NstU9Z4JPcRSQ5XEaFqy5ga9OjLgAF4yj6IvMwgQdDQjytdhAg6MyzXqXqJV7XlmLxLILVe0mdjCWj4l6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: bir40SgjT8iYeXF1XOMc2A==
X-CSE-MsgGUID: HbllEn4QR+m06bUdj35H6Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Oct 2025 17:07:12 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5F6724141C98;
	Tue, 21 Oct 2025 17:07:07 +0900 (JST)
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
Subject: [PATCH v2 0/6] Add RTC support for the Renesas RZ/V2H SoC
Date: Tue, 21 Oct 2025 08:06:59 +0000
Message-ID: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
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

v2:
- Updated bindings and RTC dts node with "reset-names" property.

Ovidiu Panait (6):
  clk: renesas: r9a09g057: Add clock and reset entries for RTC
  dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
  rtc: renesas-rtca3: Use OF data for configuration
  rtc: renesas-rtca3: Add support for RZ/V2H SoC
  arm64: dts: renesas: r9a09g057: Add RTC node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 45 ++++++++++++++++---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 15 +++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 ++
 drivers/clk/renesas/r9a09g057-cpg.c           |  4 ++
 drivers/rtc/rtc-renesas-rtca3.c               | 27 +++++++++--
 5 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.51.0


