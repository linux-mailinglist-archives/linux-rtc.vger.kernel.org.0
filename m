Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6D3509B68
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Apr 2022 11:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387224AbiDUJDh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Apr 2022 05:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387209AbiDUJD2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Apr 2022 05:03:28 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F7A220D1
        for <linux-rtc@vger.kernel.org>; Thu, 21 Apr 2022 02:00:24 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C835560011;
        Thu, 21 Apr 2022 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650531619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qXWNtp/Z3Mw+KK/AtkZmzuXfaNAB/G/qAlAtA92kuRU=;
        b=jQ4aCqfquTxU9jUbq8mtpcWlCe5fHe2dBc+aUo/eshTwnsX7dXNtGMMX3OkKMfYdDKSy4W
        Qq7i9QhSpymgkBc0gBh3e/AfCZvIY2Bvk8EvfbaYCkmFDNgMteyZXedCWBBwtX+36os2h3
        NQK+yoFHcBbTxz9WpM1ywbcJ9DXBUkN44rad+2YhDiMs4BnaaY+i3OgZwiGaSonaKQomDU
        hJCtzbjkICQZ0QLVT1WuLpT1P0c5JlN4K8N+T5kMY7c+o1qd2Hgv41+KG1oo7/YeArS/24
        1ATsejCX6YzqbXB/WfDLFyQqskXqVwDIe3/MzAuhIZrjlJbieMg07/1+7o07NA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v2 0/7] RZN1 RTC support
Date:   Thu, 21 Apr 2022 11:00:09 +0200
Message-Id: <20220421090016.79517-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This small series adds support for the RZN1 RTC.

Despite its limitations, I found useful to at least have alarm and
offset support.

As the RTC clock issue was addressed by filling the RTC clock
description in the clock driver, we no longer depend on other series.

Cheers,
Miquèl

Changes in v2:
* Fixed the error path in the clk driver, where I missed to release a
  spin_lock.
* Collected tags.
* Moved the rtc subnode in the dt to keep the nodes ordered by unit
  address.
* Dropped the useless "oneOf" statement in the bindings (compatible
  property).
* Dropped the start-year property in the bindings (already defined).
* Avoided rollover calculations that could be more easily handled (and
  reviewed) with a time64_t conversion.
* Returned ERANGE instead of EOPNOTSUPP when the alarm date is not
  valid.
* Cleared RTC_FEATURE_UPDATE_INTERRUPT to avoid warning from the tools.
* Dropped the sysctl patch adding the reset helper, instead fulfilled
  the description of the RTC clock so that when requesting this clock to
  be enabled, the idle bit is released.
* Avoided rollover calculations that could be more easily handled
  (and reviewed) with a time64_t conversion.
* Fixed the max_range value, after a rtc-range test and looking at other
  implementations.

Michel Pollet (1):
  rtc: rzn1: Add new RTC driver

Miquel Raynal (6):
  dt-bindings: rtc: rzn1: Describe the RZN1 RTC
  soc: renesas: rzn1-sysc: Fix the RTC hclock description
  rtc: rzn1: Add alarm support
  rtc: rzn1: Add oscillator offset support
  MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
  ARM: dts: r9a06g032: Describe the RTC

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  65 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/r9a06g032.dtsi              |  12 +
 drivers/clk/renesas/r9a06g032-clocks.c        |   2 +-
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rzn1.c                        | 427 ++++++++++++++++++
 7 files changed, 521 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-rzn1.c

-- 
2.27.0

