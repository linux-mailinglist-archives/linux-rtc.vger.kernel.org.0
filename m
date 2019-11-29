Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72FF110DADC
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 22:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfK2VVO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 16:21:14 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:51784 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfK2VVO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Nov 2019 16:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KnTIFpprYxj1x8gRYnELMEWP/eBeq5J1t/H2JuM0iHU=; b=Ni3txJBXi3BVD6XE8xjJ7nFzcw
        uMKHDs8DxDjDYP9Fi3m/pWBovEacfj0c7qF8sv8aeub2EvT/eiUf5srp5hQfcn5/3dkKYTqf813Kn
        w2nbRUWLzhwTWlFMuvlc4JGF+iyuR+NozOwUhdrmEOShbznkx3WSUMFP4eGojvSg1i3Y=;
Received: from p200300ccff0871001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:7100:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ianhM-0001xs-BJ; Fri, 29 Nov 2019 22:21:08 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ianhM-0004mS-2a; Fri, 29 Nov 2019 22:21:08 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/6] dt-bindings: mfd: rn5t618: Document optional property interrupts
Date:   Fri, 29 Nov 2019 22:20:40 +0100
Message-Id: <20191129212045.18325-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129212045.18325-1-andreas@kemnade.info>
References: <20191129212045.18325-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These chips use interrupts for various things like rtc alarm.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/mfd/rn5t618.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
index b74e5e94d1cb..05650e1ab28a 100644
--- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
+++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
@@ -15,6 +15,7 @@ Required properties:
  - reg: the I2C slave address of the device
 
 Optional properties:
+ - interrupts: interrupt mapping for IRQ
  - system-power-controller:
    See Documentation/devicetree/bindings/power/power-controller.txt
 
@@ -32,6 +33,8 @@ Example:
 	pmic@32 {
 		compatible = "ricoh,rn5t618";
 		reg = <0x32>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		system-power-controller;
 
 		regulators {
-- 
2.20.1

