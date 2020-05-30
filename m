Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57ED11E914B
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 14:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgE3MtK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 08:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MtK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 08:49:10 -0400
X-Greylist: delayed 978 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 30 May 2020 05:49:10 PDT
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0D5C03E969;
        Sat, 30 May 2020 05:49:10 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jf0vE-0003lm-OH; Sat, 30 May 2020 08:49:09 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: abx80x: Add autocal-filter property
Date:   Sat, 30 May 2020 08:48:59 -0400
Message-Id: <20200530124900.363399-1-kevin+linux@km6g.us>
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
 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 2405e35a1bc0..ad5d59ed6f24 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -29,3 +29,9 @@ and valid to enable charging:
  - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
  - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
                           resistor, the other values are in kOhm.
+
+All of the devices can have a 47pf capacitor attached to increase the
+autocalibration accuracy of their RC oscillators. To enable usage of the
+capacitor the following property has to be defined:
+
+ - "abracon,autocal-filter"
-- 
2.26.2

