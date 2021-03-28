Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF0C34BF4D
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Mar 2021 23:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhC1V3e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Mar 2021 17:29:34 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44320 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhC1V3U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Mar 2021 17:29:20 -0400
Received: from [37.142.126.90] (port=46466 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lQcYa-0033OQ-82; Sun, 28 Mar 2021 17:02:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 30910E81CB001;
        Mon, 29 Mar 2021 00:02:47 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 1wbQRpp3nP2J; Mon, 29 Mar 2021 00:02:47 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id EC807E81CB017;
        Mon, 29 Mar 2021 00:02:46 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 9znbjNajhj1m; Mon, 29 Mar 2021 00:02:46 +0300 (IDT)
Received: from kkk.compulab.local (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id D56E3E81CB001;
        Mon, 29 Mar 2021 00:02:46 +0300 (IDT)
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Subject: [PATCH 1/4] dt-bindings: rtc: abracon,abx80x: Add sqw property
Date:   Mon, 29 Mar 2021 00:02:29 +0300
Message-Id: <20210328210232.10395-2-kirill.kapranov@compulab.co.il>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
References: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid no entry from get_recent_authed_mail_ips_entry
X-Authenticated-Sender: clab.compulab.co.il: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Introduce the string property "sqw" to control Square Wave Output register.
This enables pulse generation output, that is useful for xtal calibration
or for an external usage.

Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
---
 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 2405e35a1bc0..4c545ece33b5 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -29,3 +29,15 @@ and valid to enable charging:
  - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
  - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
                           resistor, the other values are in kOhm.
+
+The RTC can produce square wave output on a dedicated pin for an external usage
+or for calibration purpose. A valid string should be assigned to the "sqw"
+property to enable the output:
+
+ - "sqw": should be one of the following:
+	"1_century", "32768_Hz", "8192_Hz", "4096_Hz", "2048_Hz", "1024_Hz",
+	"512_Hz", "256_Hz", "128_Hz", "64_Hz", "32_Hz", "16_Hz", "8_Hz", "4_Hz",
+	"2_Hz", "1_Hz",	"1/2_Hz", "1/4_Hz", "1/8_Hz", "1/16_Hz", "1/32_Hz",
+	"1_min", "16384_Hz", "100_Hz", "1_hour", "1_day", "TIRQ", "nTIRQ",
+	"1_year", "1_Hz_to_Counters", "1/32_Hz_from_Acal", "1/8_Hz_from_Acal",
+	"none"
-- 
2.11.0

