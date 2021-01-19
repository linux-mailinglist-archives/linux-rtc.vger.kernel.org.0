Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10342FC54B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 01:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbhATACu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 19:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730895AbhATACj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 19:02:39 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB00BC0613ED;
        Tue, 19 Jan 2021 16:01:38 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 3so3792316ljc.4;
        Tue, 19 Jan 2021 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8kNlZyDN8FkUwnB1QEShyik2KU3qyIjO6W1bR+tssYg=;
        b=rjWc8oegYMhka4Rw6HjDIRSsGmGrKfxSwCkYlkHKvRuHCrEb6uAyUyXKKhSsvG2eWz
         vyFi1rvU92P319z+jxslXihW0STX7XrDumNrXMaDUiT1a+Z7dff9ikz7HWCb+VHLz+Yy
         SeipI4YW5bSsN+slUKOFRqKy0wyHc8LfXF/k7WefG6c7oGpHAU68NWxcn9Mhgo4ZI5i8
         z7569Jl9TQ9PWLfDF1fqKrw/7+BSbYIJ3515zJeqP0zXOn0tlI25ZhYQ5UTfKGhf9DIG
         PEe7E889ufTM4hGYS4/5HpGQSV+QKWX25cX3b2a8J/iru+XGdtmeFf4QpLutwsp+GQDy
         2G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kNlZyDN8FkUwnB1QEShyik2KU3qyIjO6W1bR+tssYg=;
        b=V6/35V1liQJ1dq1EB4QpJuwY8c5wkH+m0RDi5kMb6uhU7kcC5xn80rubCAzLFgSDMN
         oG+UXI6Y+ALQUaku44SRPDdm47qWzB4kcsRinwMXqrMwONWfiL/qwSKwS88jmTem7M7H
         LJym4RkxQ01Ar7gjND6sbmolxixA7mDzM8zkhSjByGwXUthByMS9l4uIxCspLTiUsJUf
         iUCBnYo4pr3Cu/EV7dx06KH1IKF3s28Ymw7y5WvdfTWf23SznRhuqCTO83c93wAzcJK4
         J2NIaAXwbtSXII8Udc4Zi48i+I+CZM502tlNeag7tA9DEoamZ6zvMfS+sAspyq+otOdv
         tb6Q==
X-Gm-Message-State: AOAM5307kGXl1DFuYbxui/qcr9fRLABPHtlruvIV5KHGZ23DWW60j0/m
        4jpeFeTRu7jl0UpUXsMVL58=
X-Google-Smtp-Source: ABdhPJw5DNuMCQ8WnFZXjVNALCu+enXRMXr8RmGpWUeW5NSK0DISsJbdwOrk114+Ks0SqxYpnbR11g==
X-Received: by 2002:a2e:819a:: with SMTP id e26mr2954524ljg.429.1611100897457;
        Tue, 19 Jan 2021 16:01:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id t30sm33128lft.266.2021.01.19.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:01:37 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: tegra: Specify tps65911 as wakeup source
Date:   Wed, 20 Jan 2021 02:59:49 +0300
Message-Id: <20210119235949.15601-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119235949.15601-1-digetx@gmail.com>
References: <20210119235949.15601-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Specify TPS65911 as wakeup source on Tegra devices in order to allow
its RTC to wake up system from suspend by default instead of requiring
wakeup to be enabled manually via sysfs.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
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

