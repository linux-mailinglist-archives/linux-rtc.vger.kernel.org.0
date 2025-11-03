Return-Path: <linux-rtc+bounces-5241-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56729C2BA02
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 13:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DBE14F0FEC
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 12:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C02F30BF58;
	Mon,  3 Nov 2025 12:19:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506DF30BBA3;
	Mon,  3 Nov 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172344; cv=none; b=AxHMijxI1TUpY1HesP5wk/LhmxzYdiET8XPZIeKVvm7DwP2WPZSOMIGG/Iebd7jg63EB2uBYHrkhmQ9U+c6gIGne6E6ikmP2P2xpHz09Emnjt4rjtLu8IuuGpbrzZOV8WJI8ztlwCclyrf+hRsIe1rW4f5JaUJalpZ/lmN9qZ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172344; c=relaxed/simple;
	bh=64LEAMsezlm3TlcT0BPOyJYk4hmTo+GSFO0qzsB6Oks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c8j0PFuYotBx+dOecTnoQWY6+nxkO6XNgFwiBpev6cIyQqz68rKeEyK4A2jM6+grt8Yln37tuJV0h20LErFTWVj2nZKT5MDQF/fSJkSL2T0nMzKqMcL+jjsAqBIAaG5QySjxWXMyqFTi/dSrh22eVEunzM+f96NbPP1q36bsiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: kHDHRPyUSjq/MfvKOK+/hw==
X-CSE-MsgGUID: KpzwVxRmRxSSV0sT+qbo4Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Nov 2025 21:18:54 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.152])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2DCA240078B9;
	Mon,  3 Nov 2025 21:18:49 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add RTC support for the Renesas RZ/V2H SoC
Date: Mon,  3 Nov 2025 12:18:44 +0000
Message-ID: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
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

v3:
- Dropped all changes related to "max_user_freq", as it was removed from
  all drivers by:
  https://lore.kernel.org/all/20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com/

v2:
- Updated bindings and RTC dts node with "reset-names" property.

Ovidiu Panait (4):
  dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
  rtc: renesas-rtca3: Add support for multiple reset lines
  arm64: dts: renesas: r9a09g057: Add RTC node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 45 ++++++++++++++++---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 15 +++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 ++
 drivers/rtc/rtc-renesas-rtca3.c               |  2 +-
 4 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.51.0


