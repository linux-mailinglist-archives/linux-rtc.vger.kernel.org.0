Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 410C396418
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 17:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730443AbfHTPTh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 11:19:37 -0400
Received: from vps.xff.cz ([195.181.215.36]:32796 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729137AbfHTPTh (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566314375; bh=3n0q7CBc9P4bQG/G0hfq9MsM1NWknDFFdma8+IRC/cg=;
        h=From:To:Cc:Subject:Date:From;
        b=RqPDvgDPVzlnaRwp8M3IghFK1wQglwVFc5+QYKZLLecgLDG5Wil2dozlnMco/EYls
         /tTRCmZRHy22lpoHwy9E9Fr/ySqpCuyc55Qs9fnt0P+1UVmbOrWTAtsc86mOFmndqh
         t3CYfwOjHBGp7SjGsGvlX8D7XF7SfRw54iJgeEMc=
From:   megous@megous.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 0/3] Add basic support for RTC on Allwinner H6 SoC
Date:   Tue, 20 Aug 2019 17:19:31 +0200
Message-Id: <20190820151934.3860-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

I went through the datasheets for H6 and H5, and compared the differences.
RTCs are largely similar, but not entirely compatible. Incompatibilities
are in details not yet implemented by the rtc driver though.

I also corrected the clock tree in H6 DTSI.

This patchset is necessary for implementing the WiFi/Bluetooth support
on boards using H6 SoC.

There was some discussion previously of describing HOSC, DCXO and XO
oscillators and clocks as part of RTC in DT, but I decided against it
because it's not necessary, becuse information that would be provided
as a part of DT can already be determined at runtime from RTC registers,
so this woudn't add any value and would only introduce complications
to the driver. See: https://patchwork.kernel.org/cover/10898083/

Please take a look.


Thank you and regards,
  Ondrej Jirman


Changes in v2:
- bindings converted to yaml
- added reviewed by tags

Ondrej Jirman (3):
  dt-bindings: Add compatible for H6 RTC
  rtc: sun6i: Add support for H6 RTC
  arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 13 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
 drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.22.1

