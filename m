Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8979541AA51
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239482AbhI1IF7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:05:59 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:57467 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239321AbhI1IF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:29 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 356ED2B01458;
        Tue, 28 Sep 2021 04:03:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 28 Sep 2021 04:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=0ug29t+efHhaBUw2Dp50mQebuU
        OvAPftYFzNvqEV2qY=; b=QVNNBVh9PXfkYoaPdq9UUH7QOZikJTT0VB7bfUzlVN
        5kcwLcrWCHGHWmxvu3e9it/qR3/pSzem2vNQeVVD0P9glN/50Lxt6SIZpAlt4DtF
        Mruxk+kZlcpWlEnFM+G1E+iY0+8ZvD+H8l9reXpYbco0nKnG/WVn7j2V+ungOGVS
        Ei3DduyUQ5pWdm9fxrL5ifmMH4kB5pVRvA2QxVceQ/FSNW6X6R0rFD7gruy6sK5o
        XkENSberJhGMlDczdaGmjuYYTdmEUKhx45gmvfbPnFfKVpotRvZHkgVTs4sK3YtY
        OBu0x5VBCMVzuuhPJJkOjHIT2rho/Iyy9G46t/Dcdj+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0ug29t+efHhaBUw2D
        p50mQebuUOvAPftYFzNvqEV2qY=; b=JX4ZcJtpfl6gTkwFqylB5d2NbjKwNa2It
        jJ9LgcUH8reebwd3/pllIGuRI7GTwz3ojhvnjOUWBZm3bLbX4xgbPsyHl+TDeIWr
        wSjymAzhwnXKf3TTj/cvTqSkWVBrRCJfEzNbxQP1nF/+T/aSsZZrBOHQFm34aSsv
        Hs+ts+4kdkH8VpegsfyooIsl5KuCFKVp+jGjIrLbuaBgpG35R3KNTjskAWgx1/k6
        GgqgJ2rKhZ73MPRUD1gTqGUXt642SvLiClrtTsF1k3gdboARhgTOeT7OPxSSt0gQ
        n8JddxFhJzGoKJgDmuuZuLQQ/gqsaf3xuhOv/qDJY2ItVnGX6t+2A==
X-ME-Sender: <xms:WMxSYT6ar2jXCSH9m5EN3hgx9CR1mIZYJImga9SwWvhaJh1N87bWOQ>
    <xme:WMxSYY58dpSujoIicoyNo1EDj09DMvUXh6pV2egWzPPPDUM0GTNd2iX0OXBhT7q2-
    Pld_GxloL_neckM7Q>
X-ME-Received: <xmr:WMxSYaf0opjKVon3ama2KnshCSIfM5ztrFhPRWrBDheYKGg0LXax_C_0BRUmA3ooLabsbWxhR3Q0EEUnK68Y0ObFR7mssLM9T40h1446wQ38mdR7zifmuMFSurS3ueXfXHEz_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehieff
    tdevtdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WMxSYUKhBwbhTYkNP9kb18soWuUFS_NWqwbMlATvyyIzomGHPG4nqQ>
    <xmx:WMxSYXK5PI0U8huuhXGA4arvriLF-dorPeCT8dACRhJwOQKHIJVxgQ>
    <xmx:WMxSYdz9dQP9FSowHY6Z5yuRR31gZPKpDmBa16jnSZnCsoH32x6hGg>
    <xmx:WMxSYWYPtiL_bp4mTAtSUHmF-FVnWt06seTvfdkFKt2_wdSAcKzxKaBNJzc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:36 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 0/9] clk: sunxi-ng: Add a RTC CCU driver
Date:   Tue, 28 Sep 2021 03:03:26 -0500
Message-Id: <20210928080335.36706-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch series adds a CCU driver for the RTC in the H616, R329 and
D1. The extra patches at the end of this series show how it would be
explanded to additional hardware variants.

The driver is intended to support the existing binding used for the H6,
but also an updated binding which includes all RTC input clocks.

A future patch series could add functionality to the driver to manage
IOSC calibration at boot and during suspend/resume.

It may be possible to support all of these hardware variants in the
existing RTC clock driver and avoid some duplicate code, but I'm
concerned about the complexity there, without any of the CCU
abstraction.

This series is currently based on top of the other series I just sent
("[PATCH v2 0/4] clk: sunxi-ng: Module support"), but I can rebase it
elsewhere.

Changes since v1:
  - Rebase on v2 of the module support series.
  - Combine "const"s to "enum" in the DT binding compatible property.
  - Properly update the DT binding clocks and clock-names properties.
  - Load the CCU driver from the RTC driver, not as an OF provider.

Samuel Holland (9):
  dt-bindings: rtc: sun6i: Clean up repetition
  dt-bindings: rtc: sun6i: Add H616, R329, and D1 support
  clk: sunxi-ng: div: Add macro using CLK_HW_INIT_FW_NAME
  clk: sunxi-ng: mux: Add macro using CLK_HW_INIT_PARENTS_DATA
  clk: sunxi-ng: mux: Allow muxes to have keys
  rtc: sun6i: Allow probing without an early clock provider
  clk: sunxi-ng: Add support for the sun6i RTC clocks
  [DO NOT MERGE] clk: sunxi-ng: sun6i-rtc: Add support for H6
  [DO NOT MERGE] clk: sunxi-ng: sun6i-rtc: Add support for T5

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |  84 +++-
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c          | 467 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h          |  16 +
 drivers/clk/sunxi-ng/ccu_common.h             |   1 +
 drivers/clk/sunxi-ng/ccu_div.h                |  14 +
 drivers/clk/sunxi-ng/ccu_gate.c               |   3 +
 drivers/clk/sunxi-ng/ccu_mux.c                |   7 +
 drivers/clk/sunxi-ng/ccu_mux.h                |  28 ++
 drivers/rtc/rtc-sun6i.c                       |  35 +-
 include/dt-bindings/clock/sun6i-rtc.h         |  10 +
 include/linux/clk/sunxi-ng.h                  |   9 +
 13 files changed, 648 insertions(+), 33 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
 create mode 100644 include/dt-bindings/clock/sun6i-rtc.h

-- 
2.31.1

