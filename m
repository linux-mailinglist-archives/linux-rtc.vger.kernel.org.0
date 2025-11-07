Return-Path: <linux-rtc+bounces-5293-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933CC41BDF
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 22:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7FE9561F1F
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 21:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C2233F37C;
	Fri,  7 Nov 2025 21:07:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC392BEC3A;
	Fri,  7 Nov 2025 21:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549641; cv=none; b=MqLVev4gZXqJK+rxzgI2emupz6DcPq8z+wVVXbRuGq0LfJY0nfHvsd79vUsU/vKW4qwyApIxl+r1CzoMoCEjKbTuYWq2kUKzilTR5ag5ZiGxXu7JEBIsoUAWm/N8zbWbiNvBfyNQCZweViAdItboyJ9Sk6CAdwewoAv3bqKikr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549641; c=relaxed/simple;
	bh=UdLLYJqoBd1wJ9IwbXQoVeuKaNp7Qz1xUYPzexc1gEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHWY2gOzK4Pm4/a7xu29FHmFoKmjcPQPyIXC7ML5eRx+CiMSvEa8liVBRmjihYzX4RcRcmSzr2RW3RcBMtDy24vur7OzfgVSZYnX8ctSmv2oRBlOfbgHs47y21uc8hyhHgPNomI3j4zODHCCTghxD3K5hWvit/q99e/qjqUK2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: VgEgaSSpSkiLI6Fb3d4ypw==
X-CSE-MsgGUID: ql3Yg56uQpiNYom+6Hxkqw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2025 06:07:12 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A8D6A4007D1A;
	Sat,  8 Nov 2025 06:07:07 +0900 (JST)
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
Subject: [PATCH v4 0/4] Add RTC support for the Renesas RZ/V2H SoC
Date: Fri,  7 Nov 2025 21:07:02 +0000
Message-ID: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
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

v4:
- Renamed reset "rtc_rtest" -> "rtest".
- Added "vbattb" reset name to example node.

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

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 46 +++++++++++++++++--
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 15 ++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 ++
 drivers/rtc/rtc-renesas-rtca3.c               |  2 +-
 4 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.51.0


