Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787F144270C
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Nov 2021 07:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhKBGYn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Nov 2021 02:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhKBGYl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Nov 2021 02:24:41 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB9BC061714;
        Mon,  1 Nov 2021 23:22:07 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id k4so4588653plx.8;
        Mon, 01 Nov 2021 23:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Nhi8A69n35wz1j8eG1NavWlgxA1pSKinVrZqcjltJbI=;
        b=V/vUTfg2BkVrAzjLmhrRCg40Do8FURrxL/qf6MuZ+Awqz+Xmt2HGD47BxQsjQzLuGV
         rircwI0/Z/f1ugTHVHzuQ8+Yp3h92l3xCDJQ4vFTSVg4E2GbIF1wiKMP1TxHIGC5YnPX
         0BZL9+59NUUWFRAtDyKQMVihUExCwcJcGtPEX9Dj55pDECy5xFy2dNmVf5K182yinziD
         TKqD8DzZO0kZ4GyC8r/4h3fknLzMMlSWozWsMFEQ9Mbhr55lHvUK7Kiv75kSpIKC37ib
         f+6omtLldJgz2o3evA2PxdJyiOgVs94oKkrxhvfOo6LUGG39EVWSSuwrqJUKChYMRZsA
         xGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nhi8A69n35wz1j8eG1NavWlgxA1pSKinVrZqcjltJbI=;
        b=MKGn3qdZ9EmGILy4ziTeJn3TSTW/En1M8DuixxWnop0A2tLLH/ow0jTvdMjh16Z+vj
         ++MY0jbyXjtxWZcyqjWPFP/Bq7qrBKjvZsnKafWjLcYEDAsd7B04dBVmF5GR/qESbDZY
         7THKago/Kmcr/suz7yebtRO7SW9w+0R0uMOX+kTX3brH5FVH15SITStGQVf1PL1waxU/
         iL8QTkgaPbQo+xjSTL1pioYpDqCGQdALBqM5VeJPpmIJJxHcQb+bXkR7WGif0uQH7yVe
         ezPTHG7xYdWh5DAnbT3HVp/7frOmiD0QEomDENk40cj9kuSHGGBy8QGpgTk6JTpQcBZX
         FvJA==
X-Gm-Message-State: AOAM5313WWHzeSpYK84AxsIWn4lgkO8IKFzCTn2zPgzJdA2Q4l0qUqhh
        i4CaCTh8JcNzlGijtrs6tDSzNgrMjzGBXA==
X-Google-Smtp-Source: ABdhPJwC0E4yPCAHfK7CT3Xzwhf7DMzbwcFu8MAbU79w/UUDVBX3nJLSgWwDGOxd+teoUOYANjZRTw==
X-Received: by 2002:a17:90a:c394:: with SMTP id h20mr4331478pjt.136.1635834127165;
        Mon, 01 Nov 2021 23:22:07 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id v2sm14859402pga.57.2021.11.01.23.22.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 23:22:06 -0700 (PDT)
From:   Vincent Shih <vincent.sunplus@gmail.com>
X-Google-Original-From: Vincent Shih <vincent.shih@sunplus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Vincent Shih <vincent.shih@sunplus.com>
Subject: [PATCH 0/2] Add RTC driver for Sunplus SP7021 SoC
Date:   Tue,  2 Nov 2021 14:22:01 +0800
Message-Id: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
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

 .../bindings/rtc/sunplus,sp7021-rtc.yaml           |  58 +++
 MAINTAINERS                                        |   7 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-sunplus.c                          | 389 +++++++++++++++++++++
 5 files changed, 465 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
 create mode 100644 drivers/rtc/rtc-sunplus.c

-- 
2.7.4

