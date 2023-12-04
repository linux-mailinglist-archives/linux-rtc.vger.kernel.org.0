Return-Path: <linux-rtc+bounces-393-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0048033C3
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 14:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5A31C209F9
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 13:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA453249F2;
	Mon,  4 Dec 2023 13:05:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B71DEA7;
	Mon,  4 Dec 2023 05:05:11 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,249,1695654000"; 
   d="scan'208";a="185258370"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Dec 2023 22:05:11 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F3DBC44506C7;
	Mon,  4 Dec 2023 22:05:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] rtc: da9063: Make IRQ as optional
Date: Mon,  4 Dec 2023 13:05:01 +0000
Message-Id: <20231204130504.126787-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
populated by default. Add irq optional support.

v1->v2:
 * Make RTC patch series separate from dt patches.
 * Propagated real errors for platform_get_irq_byname_optional().
 * Cleared ALARM feature bit for non-irq case.
 * Added Rb tag from Geert for patch#2 and #3
 * Restored dev_err() for devm_request_threaded_irq() as an RTC can wake
   up a system without an IRQ.

Biju Das (3):
  rtc: da9063: Make IRQ as optional
  rtc: da9063: Use device_get_match_data()
  rtc: da9063: Use dev_err_probe()

 drivers/rtc/rtc-da9063.c | 89 ++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 48 deletions(-)

-- 
2.25.1


