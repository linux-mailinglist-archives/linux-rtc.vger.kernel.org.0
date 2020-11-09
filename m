Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB602AC0EB
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgKIQeV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgKIQeU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:20 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C199C0613CF
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:20 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s8so2263710wrw.10
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RisDz0V45EQlzvyWebamhtTboWMEKqcBFHWeOs5i9/U=;
        b=czXE7RQzxbdaq6AqCnJgvz0c74Q+O5zLXlphU+2xebulX0D/t6rXdtiV5B4qebTRaX
         PIxwJLwHF81W/fBlFlciuuRqKE4IojjIdbmV8qK4zdOKze3n6gml4d0cJAzW4Jg+bCZF
         oLmthw30+eXBEJv3ELQ1L2tUxXN0VNAIBqUbNeroL8kxKLT0X+hnUF1AQi04B1znrQYj
         YMXnjl6buIwnU6cCnJGE9mEsp69vTvGQltyxsyDaGDphm9xmVic83VlnmoVs0jcbBBsQ
         uYN3SIkAxJpumSlB3nfOCZKuvWvRFyIVzg0XfeINCwoepLUh1YWkLIqif8ylhlAjjVvV
         LgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RisDz0V45EQlzvyWebamhtTboWMEKqcBFHWeOs5i9/U=;
        b=lE3B9YTrV66Wd4z83OE+wsPQC7QINVsJL8lueUNHhogYy0vZoXmGm2JsPvl1DqZ+em
         6bVSnCaMrpJ6fykQnQmaxO264xVM1uLikAoa8vjjya6yvbFgIihPQ8Lgah6CFO48j403
         eOHChRsDZxWgg8LNcba2J9zieToeXWgwycTUIPFfyDbqip9zNKaLLYaO7m00fupM8l6j
         fZ6RgVnOHCuzjYDA8+hGPscsc9M3S2pKhDlNAoaDDqDQCPn+JSDTumG8G/h0KHeP0PMF
         csTnVVEPYNUuFBs8E2Vnu2Fy93SFzO5mn0qj4iJ/W/aUb850ULebyDsHlL3WRdSSVxW0
         70GA==
X-Gm-Message-State: AOAM532ao1VFhqZzmmt1UP4IdosAGHUpEVFSOyIoS0NmJHTdebfnNpDk
        5bIBugY/seku7J3F54ieknohPA==
X-Google-Smtp-Source: ABdhPJwHNscxiNKvZ2uDl97DaKYveHjx5AtKj0JTHirSlM3/v+hOCWHWaL6GVjKDr/qJ2zBYI3fQfg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr15135335wrr.1.1604939659144;
        Mon, 09 Nov 2020 08:34:19 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/8] rtc: rework resource management
Date:   Mon,  9 Nov 2020 17:34:01 +0100
Message-Id: <20201109163409.24301-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Alexandre,

As discussed: this is my take on RTC devres. The series does a couple things:
it adds missing documentation of managed RTC functions, adds the 'devm_' prefix
to managed APIs, makes the rtc_device struct unaware of being managed (removes
the registered field) and also shrinks devm_rtc_allocate_device().

Other than that, there are some semi-related patches in here, like the one
using the managed variant of pinctrl_register() in rtc-omap and another one
adding a generic error message when nvmem registraton fails.

I incorporated your RTC nvmem patch into the series with a minor tweak to it.

Alexandre Belloni (1):
  rtc: nvmem: remove nvram ABI

Bartosz Golaszewski (7):
  rtc: omap: use devm_pinctrl_register()
  Revert "rtc: sc27xx: Always read normal alarm when registering RTC
    device"
  Documentation: list RTC devres helpers in devres.rst
  rtc: add devm_ prefix to rtc_nvmem_register()
  rtc: nvmem: emit an error message when nvmem registration fails
  rtc: rework rtc_register_device() resource management
  rtc: shrink devm_rtc_allocate_device()

 .../driver-api/driver-model/devres.rst        |  6 ++
 arch/alpha/kernel/rtc.c                       |  2 +-
 drivers/mfd/menelaus.c                        |  2 +-
 drivers/rtc/class.c                           | 50 ++++------
 drivers/rtc/nvmem.c                           | 91 ++-----------------
 drivers/rtc/rtc-88pm80x.c                     |  2 +-
 drivers/rtc/rtc-88pm860x.c                    |  2 +-
 drivers/rtc/rtc-ab-b5ze-s3.c                  |  2 +-
 drivers/rtc/rtc-ab-eoz9.c                     |  2 +-
 drivers/rtc/rtc-ab3100.c                      |  2 +-
 drivers/rtc/rtc-ab8500.c                      |  2 +-
 drivers/rtc/rtc-abx80x.c                      |  2 +-
 drivers/rtc/rtc-ac100.c                       |  2 +-
 drivers/rtc/rtc-armada38x.c                   |  2 +-
 drivers/rtc/rtc-aspeed.c                      |  2 +-
 drivers/rtc/rtc-at91rm9200.c                  |  2 +-
 drivers/rtc/rtc-at91sam9.c                    |  2 +-
 drivers/rtc/rtc-au1xxx.c                      |  2 +-
 drivers/rtc/rtc-bd70528.c                     |  2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c           |  2 +-
 drivers/rtc/rtc-cadence.c                     |  2 +-
 drivers/rtc/rtc-cmos.c                        |  6 +-
 drivers/rtc/rtc-coh901331.c                   |  2 +-
 drivers/rtc/rtc-cpcap.c                       |  2 +-
 drivers/rtc/rtc-cros-ec.c                     |  2 +-
 drivers/rtc/rtc-da9052.c                      |  2 +-
 drivers/rtc/rtc-da9063.c                      |  2 +-
 drivers/rtc/rtc-davinci.c                     |  2 +-
 drivers/rtc/rtc-digicolor.c                   |  2 +-
 drivers/rtc/rtc-dm355evm.c                    |  2 +-
 drivers/rtc/rtc-ds1305.c                      |  5 +-
 drivers/rtc/rtc-ds1307.c                      |  5 +-
 drivers/rtc/rtc-ds1343.c                      |  5 +-
 drivers/rtc/rtc-ds1347.c                      |  2 +-
 drivers/rtc/rtc-ds1374.c                      |  2 +-
 drivers/rtc/rtc-ds1511.c                      |  6 +-
 drivers/rtc/rtc-ds1553.c                      |  6 +-
 drivers/rtc/rtc-ds1672.c                      |  2 +-
 drivers/rtc/rtc-ds1685.c                      |  5 +-
 drivers/rtc/rtc-ds1742.c                      |  6 +-
 drivers/rtc/rtc-ds2404.c                      |  2 +-
 drivers/rtc/rtc-ds3232.c                      |  2 +-
 drivers/rtc/rtc-ep93xx.c                      |  2 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c               |  2 +-
 drivers/rtc/rtc-ftrtc010.c                    |  2 +-
 drivers/rtc/rtc-goldfish.c                    |  2 +-
 drivers/rtc/rtc-imx-sc.c                      |  2 +-
 drivers/rtc/rtc-imxdi.c                       |  2 +-
 drivers/rtc/rtc-isl12026.c                    |  4 +-
 drivers/rtc/rtc-isl1208.c                     |  4 +-
 drivers/rtc/rtc-jz4740.c                      |  2 +-
 drivers/rtc/rtc-lpc32xx.c                     |  2 +-
 drivers/rtc/rtc-ls1x.c                        |  2 +-
 drivers/rtc/rtc-m41t80.c                      |  2 +-
 drivers/rtc/rtc-m48t59.c                      |  5 +-
 drivers/rtc/rtc-m48t86.c                      |  5 +-
 drivers/rtc/rtc-mc13xxx.c                     |  2 +-
 drivers/rtc/rtc-meson-vrtc.c                  |  2 +-
 drivers/rtc/rtc-meson.c                       |  4 +-
 drivers/rtc/rtc-mpc5121.c                     |  2 +-
 drivers/rtc/rtc-mrst.c                        |  2 +-
 drivers/rtc/rtc-mt2712.c                      |  2 +-
 drivers/rtc/rtc-mt6397.c                      |  2 +-
 drivers/rtc/rtc-mv.c                          |  2 +-
 drivers/rtc/rtc-mxc.c                         |  2 +-
 drivers/rtc/rtc-mxc_v2.c                      |  2 +-
 drivers/rtc/rtc-omap.c                        | 13 +--
 drivers/rtc/rtc-pcap.c                        |  2 +-
 drivers/rtc/rtc-pcf2123.c                     |  2 +-
 drivers/rtc/rtc-pcf2127.c                     |  4 +-
 drivers/rtc/rtc-pcf85063.c                    |  4 +-
 drivers/rtc/rtc-pcf85363.c                    |  4 +-
 drivers/rtc/rtc-pcf8563.c                     |  2 +-
 drivers/rtc/rtc-pic32.c                       |  2 +-
 drivers/rtc/rtc-pl030.c                       |  2 +-
 drivers/rtc/rtc-pl031.c                       |  2 +-
 drivers/rtc/rtc-pm8xxx.c                      |  2 +-
 drivers/rtc/rtc-ps3.c                         |  2 +-
 drivers/rtc/rtc-r9701.c                       |  2 +-
 drivers/rtc/rtc-rc5t619.c                     |  2 +-
 drivers/rtc/rtc-rk808.c                       |  2 +-
 drivers/rtc/rtc-rp5c01.c                      |  5 +-
 drivers/rtc/rtc-rs5c348.c                     |  2 +-
 drivers/rtc/rtc-rv3028.c                      |  6 +-
 drivers/rtc/rtc-rv3029c2.c                    |  4 +-
 drivers/rtc/rtc-rv3032.c                      |  6 +-
 drivers/rtc/rtc-rv8803.c                      |  5 +-
 drivers/rtc/rtc-rx8010.c                      |  2 +-
 drivers/rtc/rtc-rx8581.c                      |  4 +-
 drivers/rtc/rtc-s35390a.c                     |  2 +-
 drivers/rtc/rtc-sa1100.c                      |  2 +-
 drivers/rtc/rtc-sc27xx.c                      | 10 +-
 drivers/rtc/rtc-sd3078.c                      |  2 +-
 drivers/rtc/rtc-sh.c                          |  2 +-
 drivers/rtc/rtc-sirfsoc.c                     |  2 +-
 drivers/rtc/rtc-snvs.c                        |  2 +-
 drivers/rtc/rtc-st-lpc.c                      |  2 +-
 drivers/rtc/rtc-starfire.c                    |  2 +-
 drivers/rtc/rtc-stk17ta8.c                    |  5 +-
 drivers/rtc/rtc-stmp3xxx.c                    |  2 +-
 drivers/rtc/rtc-sun4v.c                       |  2 +-
 drivers/rtc/rtc-sun6i.c                       |  2 +-
 drivers/rtc/rtc-sunxi.c                       |  2 +-
 drivers/rtc/rtc-tegra.c                       |  2 +-
 drivers/rtc/rtc-test.c                        |  2 +-
 drivers/rtc/rtc-tps6586x.c                    |  2 +-
 drivers/rtc/rtc-tps65910.c                    |  2 +-
 drivers/rtc/rtc-tx4939.c                      |  5 +-
 drivers/rtc/rtc-vr41xx.c                      |  2 +-
 drivers/rtc/rtc-vt8500.c                      |  2 +-
 drivers/rtc/rtc-wilco-ec.c                    |  2 +-
 drivers/rtc/rtc-wm831x.c                      |  2 +-
 drivers/rtc/rtc-xgene.c                       |  2 +-
 drivers/rtc/rtc-zynqmp.c                      |  2 +-
 drivers/rtc/sysfs.c                           |  2 -
 include/linux/rtc.h                           | 22 ++---
 116 files changed, 180 insertions(+), 302 deletions(-)

-- 
2.29.1

