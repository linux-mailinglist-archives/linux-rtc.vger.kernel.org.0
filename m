Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350913D0027
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 19:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhGTQnO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 12:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhGTQmq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Jul 2021 12:42:46 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8D9C0613DF;
        Tue, 20 Jul 2021 10:23:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso1931197wme.0;
        Tue, 20 Jul 2021 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPW95lb64Ytz4tlki+ReqrdJoY3TpXfPxzeB+jbcK4Y=;
        b=h1Y58ykjJ3F4+1DP/PAnlI8gWSVOl7yqP+Zjdu+Eq+6VfN+V/iLgcCoKMicevOkFN4
         K+KUS4uHakF0Mzf+otsFGbWWKb8+GcG3dvK4p01DwcxujstXxgwr7XWdD03t2X7KJvjw
         uEC4ONZ8+atnXbIWSOqv/04HxrE1GE4P5m3nt6lPW6fkq8EUvED232cK/OdjZHlMHTHo
         jrEz3UPr+H7zAJOl7z7mKUYfICSfHslwPwRNS/GphybWh0QnZEz3dve9DMJTmZ8TiWTz
         cPT1JV+qpyGxhnQvU7gB6I6kHPshk69vyyKd9GH7u20/4o9ux0Q+djiUrF85w6ZEta/l
         Q9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPW95lb64Ytz4tlki+ReqrdJoY3TpXfPxzeB+jbcK4Y=;
        b=AvsWEl5IawqD2gpqbOsz2OwzAXtINuPyT19mplKpfKlCA3iKAzqQ4VUNNuxmp3Gy0j
         6+wPcAXAAduxzP/ylDjGVtYzSeQngYbP9p8Yzortll0TC1TvGqktQ4edf64vaoPWWWnM
         2R0OJKDfW3BvXVtePeEjTj8+p0TirgDqndANwXGSa+qg3+d2qSPuL0ZAYpas/WS0Xfry
         h4LzCqtWvvGCTLiibQaGwmqzhf2MmK92+ne1x6pl1fVQkE0zNEikdCws4a/J8N3NF7V3
         PxN01eh42l+SFvm70Z5I5QPId0rT0/gP489+DPCXprbPlBmSxWdNg5nBryJaRGLH2afK
         +m2w==
X-Gm-Message-State: AOAM5318CkQizUmhkHeauYZYGHh/WcxJPOnpUu6AeILMG0VHoxB6YKRr
        BT2EJd/nC9CQMcVLmYFLv28=
X-Google-Smtp-Source: ABdhPJwjwPsBB+KxDoJoSPw9XBAyqXkyAd6N2QJC6zYOSs8VWb7t51bwWsBuGRMGyAoVQa8PpLbOOg==
X-Received: by 2002:a05:600c:21d7:: with SMTP id x23mr32552240wmj.98.1626801789183;
        Tue, 20 Jul 2021 10:23:09 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id y12sm8132439wmc.12.2021.07.20.10.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 10:23:08 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add RTC for MStar SoCs
Date:   Tue, 20 Jul 2021 19:22:48 +0200
Message-Id: <20210720172251.4504-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patches series adds a new driver for the RTC found in the Mstar
MSC313e SoCs and newer. It adds a basic rtc driver, the corresponding
devicetree bindings and its documentation.

Daniel Palmer (1):
  rtc: Add support for the MSTAR MSC313 RTC

Romain Perier (2):
  dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings
    documentation
  ARM: dts: mstar: Add rtc device node

 .../bindings/rtc/mstar,msc313-rtc.yaml        |  46 ++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |   7 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-msc313.c                      | 246 ++++++++++++++++++
 6 files changed, 311 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
 create mode 100644 drivers/rtc/rtc-msc313.c

-- 
2.30.2

