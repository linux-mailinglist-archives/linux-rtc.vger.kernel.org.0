Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F66B43D6B6
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Oct 2021 00:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhJ0WiA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 18:38:00 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:57436 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhJ0Wh4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 18:37:56 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id DBA10F40CA5; Thu, 28 Oct 2021 00:35:24 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] powerpc: gamecube_defconfig: Enable the RTC driver
Date:   Thu, 28 Oct 2021 00:35:14 +0200
Message-Id: <20211027223516.2031-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027223516.2031-1-linkmauve@linkmauve.fr>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This selects the rtc-gamecube driver, which provides a real-time clock
on this platform.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/configs/gamecube_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/gamecube_defconfig b/arch/powerpc/configs/gamecube_defconfig
index 24c0e0ea5aeb..91a1b99f4e8f 100644
--- a/arch/powerpc/configs/gamecube_defconfig
+++ b/arch/powerpc/configs/gamecube_defconfig
@@ -68,7 +68,7 @@ CONFIG_SND_SEQUENCER=y
 CONFIG_SND_SEQUENCER_OSS=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_GENERIC=y
+CONFIG_RTC_DRV_GAMECUBE=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
-- 
2.33.1

