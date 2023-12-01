Return-Path: <linux-rtc+bounces-377-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D580095B
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 12:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1F1B212E9
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 11:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FA5210FD;
	Fri,  1 Dec 2023 11:08:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C4C3193;
	Fri,  1 Dec 2023 03:08:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="185005220"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2023 20:08:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B9FDA40108F2;
	Fri,  1 Dec 2023 20:08:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] Add DA9062 PMIC and built-in RTC support for RZ/G2UL SMARC EVK
Date: Fri,  1 Dec 2023 11:08:34 +0000
Message-Id: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series aims to add support for DA9062 PMIC and built-in RTC found
on RZ/{G2UL,Five} SMARC EVK. On these platforms there is no IRQ populated
by default. Add irq optional support and convert the bindings to
json-schema.

Biju Das (6):
  rtc: da9063: Make IRQ as optional
  rtc: da9063: Use device_get_match_data()
  rtc: da9063: Use dev_err_probe()
  dt-bindings: mfd: Convert da9062 to json-schema
  arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC
  arm64: defconfig: Enable Renesas DA9062 defconfig

 .../devicetree/bindings/mfd/da9062.txt        | 124 ----------
 .../devicetree/bindings/mfd/dlg,da9062.yaml   | 220 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  29 +++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/rtc/rtc-da9063.c                      |  88 ++++---
 5 files changed, 290 insertions(+), 173 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9062.yaml

-- 
2.25.1


