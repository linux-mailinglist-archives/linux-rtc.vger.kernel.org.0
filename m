Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202184F4881
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiDEVlF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573374AbiDES7u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:50 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03748CD33E
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:49 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 72A33CAA59
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:27 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9DC36200004;
        Tue,  5 Apr 2022 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=AlS3iJ+EMBIdu3DwukTkmu3d5S17/P8BS9spNb/Ba7A=;
        b=ovTLWGBmZBlXw85uPL5X6YZwA+kKi9xhS4WzLGT+Ktdp5ydyX1i+EiNrA6fGk2LH/8NNwH
        k1dxdAJx6sXCstShEpnRSdnXhujo5MVJ4LtLn2hjEGZJv9SMPpd6ZuvpzzViZ90RE0lzDp
        xA8SOqFrIEM/WJBP8/pkzO3iEJNIZcq23FifHctf0V3K5YRrV/oRmc0+034G+2D91qS3NC
        +rOFdsAy1yVujV17FVbdPFd/IWLc4BYllOIKytXLXKU10V5O227K8HiRECHHkEmFZtD5KZ
        LHIwXL0wFcUMk2TRUUB24mkSP+s0B3H7mfyxgJzXciQJJgNnC6Owsk4m+MBb9w==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/7] RZN1 RTC support
Date:   Tue,  5 Apr 2022 20:47:09 +0200
Message-Id: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This small series adds support for the RZN1 RTC.

Despite its limitations, I found useful to at least have alarm and
offset support.

This depends on the previous sysctrl/dma/uart changes on the sysctrl
side.

Cheers,
Miquèl

Michel Pollet (1):
  rtc: rzn1: Add new RTC driver

Miquel Raynal (6):
  dt-bindings: rtc: rzn1: Describe the RZN1 RTC
  soc: renesas: rzn1-sysc: Export a function to enable/disable the RTC
  rtc: rzn1: Add alarm support
  rtc: rzn1: Add oscillator offset support
  MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
  ARM: dts: r9a06g032: Describe the RTC

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  69 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/r9a06g032.dtsi              |  12 +
 drivers/clk/renesas/r9a06g032-clocks.c        |  49 ++
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rzn1.c                        | 436 ++++++++++++++++++
 include/linux/soc/renesas/r9a06g032-sysctrl.h |   2 +
 8 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-rzn1.c

-- 
2.27.0

