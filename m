Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4683D374440
	for <lists+linux-rtc@lfdr.de>; Wed,  5 May 2021 19:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236190AbhEEQz7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 12:55:59 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46608 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236435AbhEEQts (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 12:49:48 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A671B63571;
        Thu,  6 May 2021 00:39:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232785; bh=K0ehAmtye6+D5vkhbi8tBXlfgGVPJ3u4uj/lFn6bk2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SaXbK7+acQ4gFnJIkkNuwt62EpbSxSOZrOaQkb6aiLyPdlSL/6BYdtfRzWnuDhfxm
         ICIdTjJLpkkHe1vfSMiiLZrWkQMbhO9pbLtpdQGZvqqXF6Aj8sxm6bP+Rjtxa2kfbF
         +J86DtItOZ7221lxUFCFrxqiClKoZTlc5ai35/88=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/6] MIPS: Loongson64: DTS: Add RTC support to LS7A
Date:   Thu,  6 May 2021 00:39:02 +0800
Message-Id: <20210505163905.1199923-4-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210505163905.1199923-1-git@xen0n.name>
References: <20210505163905.1199923-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The LS7A RTC module is now supported, enable it.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f99a7a11fded..39808e97e6e1 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,6 +19,11 @@ pic: interrupt-controller@10000000 {
 			#interrupt-cells = <2>;
 		};
 
+		rtc0: rtc@100d0100 {
+			compatible = "loongson,ls2x-rtc";
+			reg = <0 0x100d0100 0 0x78>;
+		};
+
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0 0x10080000 0 0x100>;
-- 
2.30.1

