Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02371F7EF7
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2020 00:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgFLWgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 18:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgFLWgU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jun 2020 18:36:20 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9D1C03E96F;
        Fri, 12 Jun 2020 15:36:20 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jjsHV-0006C6-Hj; Fri, 12 Jun 2020 18:36:13 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3 v2] dt-bindings: abx80x: Add autocal-filter property
Date:   Fri, 12 Jun 2020 18:35:49 -0400
Message-Id: <20200612223551.282113-1-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add a property to allow control of the autocalibration filter
capacitor.

Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
To: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
v2: Change property to an integer value, and describe possible values
 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 2405e35a1bc0f..18210627b8470 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -29,3 +29,11 @@ and valid to enable charging:
  - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
  - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
                           resistor, the other values are in kOhm.
+
+All of the devices can have a 47pf capacitor attached to increase the
+autocalibration accuracy of their RC oscillators. To enable or disable usage
+of the capacitor the following property can be defined:
+
+ - "abracon,autocal-filter": should be <0> or <1>. 0 indicates that there
+                             is no capacitor attached, 1 indicates that there
+			     is a capacitor attached.
-- 
2.26.2

