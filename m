Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36EB2FDBEC
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 22:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbhATV1e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 16:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731779AbhATVRZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Jan 2021 16:17:25 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8760C061793;
        Wed, 20 Jan 2021 13:16:44 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 3so122044ljc.4;
        Wed, 20 Jan 2021 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DF5/8mvzSfiGycoIma/P/kossQy+bTKj7uhIK5+9g84=;
        b=SEM2f1XTZnmxQc8DDftrsvO5tknEgmo7q0X9sMV39nJGNqqWPpMyWZw9Y8Ol+7dDsv
         1ESPFWj8y+XS+vGPCuF9NIIhMrkEiCvvkqJl8+EDKGUH9d/ZMLZoTyiwtswb1o80OW41
         b7jhTis9Cf4OCE/RwfpUXcS5GqpoYEXU4wox7jxR34Ffj+sIpHPqJR74JR4VdIxOtf82
         c77GrrL8UZJD4RuCmZmqY0HIf1bDI7sACfaHZG3I4gjsgMW9mD43J4E99pRo3HSi82N0
         sdSNl9l8suD84WU8P+ncf0Q2KMTt16UeT4NMR5fIO0aEGI1C18OK/N92C2pKqBlrSVuB
         qBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DF5/8mvzSfiGycoIma/P/kossQy+bTKj7uhIK5+9g84=;
        b=MvOo9DuvbBnKZjtubGEGEtBn5+aG5r3kp+s3/4c2YDjBk72K4K9onsCQMYddFYnvnT
         r/7XNmmrzr1aLmz8fGfPcFT70CCeuY9U/j/tt2FXs2Qebdfd5AlA/mPckb22H5I71uJ5
         HaDy0cBl+BCfZygekg7tfk1E45pSe4Bm2d5dY+47bxCSaYf5Bgih/6TQG6m7dCSwfNYz
         DTzzYHRoAUtgn7BKPjCX8gWOHW3clLUr0M4tTCj6oSdxc/PZMuTNOTl47/uT0VE9kSqI
         EMSX+4locolxyEt0V2tK64Bht1WJSs6/xd2NYNxtqUaRxvWu1o90YlmoG2rR6yAoteWw
         z6nw==
X-Gm-Message-State: AOAM532wX0h866Bh+4FxysQy9kHSIEDRlHmep4LYq66+RSUWmqGEgdFi
        CxC2S6FfGhpqPnfgV+hnLV4=
X-Google-Smtp-Source: ABdhPJzzLIF6ZpLXnsyzomeFZ5w/ZoMkgCgSocdkBNEfk2QGoygsqtLeD9z/z1HxfQ61b6G9qMJN6A==
X-Received: by 2002:a2e:9749:: with SMTP id f9mr5073277ljj.118.1611177403452;
        Wed, 20 Jan 2021 13:16:43 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id e20sm341986lja.123.2021.01.20.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:16:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: tegra: Specify tps65911 as wakeup source
Date:   Thu, 21 Jan 2021 00:16:03 +0300
Message-Id: <20210120211603.18555-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120211603.18555-1-digetx@gmail.com>
References: <20210120211603.18555-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Specify TPS65911 as wakeup source on Tegra devices in order to allow
its RTC to wake up system from suspend by default instead of requiring
wakeup to be enabled manually via sysfs.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
[Matt and Peter tested this change on Tegra30 Ouya]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - No changes.

 arch/arm/boot/dts/tegra30-apalis.dtsi                      | 1 +
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi | 1 +
 arch/arm/boot/dts/tegra30-beaver.dts                       | 1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi                      | 1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi                     | 1 +
 arch/arm/boot/dts/tegra30-ouya.dts                         | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 6544ce70b46f..b2ac51fb15b1 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -860,6 +860,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index bfc06b988781..b97da45ebdb4 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -12,6 +12,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,en-gpio-sleep = <0 0 1 0 0 0 0 0 0>;
 			ti,system-power-controller;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e0624b74fb50..e159feeedef7 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1776,6 +1776,7 @@ pmic: tps65911@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index dab9989fa760..788f16d2a0fa 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -240,6 +240,7 @@ pmic: tps65911@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index e36aa3ce6c3d..413e35215804 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -737,6 +737,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 74da1360d297..8f66b16a786f 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -139,6 +139,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,en-gpio-sleep = <0 1 1 1 1 1 0 0 1>;
 			ti,system-power-controller;
-- 
2.29.2

