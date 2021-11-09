Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CAD44A6EC
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Nov 2021 07:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243220AbhKIGlL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Nov 2021 01:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhKIGlL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Nov 2021 01:41:11 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF23C061764;
        Mon,  8 Nov 2021 22:38:25 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id q17so7055851plr.11;
        Mon, 08 Nov 2021 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=YXrLP/6w0RPBXSzKwulXWqp10SzvQvnKnc1yXHAk4Tw=;
        b=P29Nsp+qcRAs+O6ZhboLiCkOkyogcYbvCxZdTTgiFho2vL3lrGeNbor5q3/V4UDnLZ
         NeJGNt49CtZAbjl4xsIlmHJEdwMKDTjmDWv4NxP1bJw5tnZhaRcj+qhKISrAsQyk6IO/
         N8Ela4GBPY9d3YWtL+nWyiAEBpauBd9hPJKyGvBj0wcXXI4zxF20DBD0riTyeDy6tkx0
         aKMkoaYxtRMY1dXWpPRQu904c1a4jGl4r8fERoM0GWmBbrkcAPlj+1Pnqxp8omdQ15G0
         9AouRNhMmazsO12JBfF+gMwkbeC7bJZfLzwVSy8u5mUJSGbvk7cHHN8lu3QjzYZY2khx
         eCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YXrLP/6w0RPBXSzKwulXWqp10SzvQvnKnc1yXHAk4Tw=;
        b=5gUSQV2BQzMgKdO89yhF4ZeZZJff4cILi6VOXuX5QsH+7qM1jP9wpeuyocKF3r/+4K
         wOO17Z+fLXfR39x4mCCDlANtDf9la8yZaF+85GxwlpcaMmunmNVB7nhCoNI+nr65hs4W
         PT/dAvid6HYbX/e9URn6IBfdTbK4RgkdIDqYPEx0TgDWWs/NcuyYvvit7kjv5asHL13l
         JB/+Dq5Assfo15MrO3AGHgjBpNKOdKE2YRivm+nRxly9u0I1QEBYr0tze5UlvhLwPG4A
         vQe5K185AkTdwWmiV2pXPAEfEasVAirplHtPub5IQLOL81EEmNGOfKOegApmUTNdvvD4
         qrUA==
X-Gm-Message-State: AOAM533kx5qUW8x9Uz7sVYlz7P5II6jWz9VtPgZL6s2nBjqxFzo3mPM5
        mhebEizZOprCsvgS7Q8HePI=
X-Google-Smtp-Source: ABdhPJxImBMzajXwqpFPjTT32OCGCFa21KgttTLnepIV1uorWAx1Evem+sVAIZ1bcTD+MDrdRgmtrA==
X-Received: by 2002:a17:90a:191c:: with SMTP id 28mr4681654pjg.121.1636439904585;
        Mon, 08 Nov 2021 22:38:24 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id k22sm17466833pfi.149.2021.11.08.22.38.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 22:38:23 -0800 (PST)
From:   Vincent Shih <vincent.sunplus@gmail.com>
X-Google-Original-From: Vincent Shih <vincent.shih@sunplus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, wells.lu@sunplus.com,
        in-reply-to=1635834123-24668-1-git-send-email-vincent.shih@sunplus.com
Cc:     Vincent Shih <vincent.shih@sunplus.com>
Subject: [PATCH v2 0/2] Add RTC driver for Sunplus SP7021 SoC
Date:   Tue,  9 Nov 2021 14:38:16 +0800
Message-Id: <1636439898-7358-1-git-send-email-vincent.shih@sunplus.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This is a patch series for RTC driver for Sunplus SP7021 SoC.

Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD Card and
etc.) into a single chip. It is designed for industrial control.

Refer to:
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
https://tibbo.com/store/plus1.html

Vincent Shih (2):
  rtc: Add driver for Sunplus SP7021
  dt-bindings: rtc: Convert Sunplus RTC to json-schema

 .../bindings/rtc/sunplus,sp7021-rtc.yaml           |  56 ++++
 MAINTAINERS                                        |   7 +
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-sunplus.c                          | 370 +++++++++++++++++++++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
 create mode 100644 drivers/rtc/rtc-sunplus.c

-- 
2.7.4

