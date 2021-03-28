Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B895734BF4F
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Mar 2021 23:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhC1V3f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Mar 2021 17:29:35 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44328 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbhC1V3Y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Mar 2021 17:29:24 -0400
Received: from [37.142.126.90] (port=46490 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lQcYe-0033On-Vx; Sun, 28 Mar 2021 17:02:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id D5E63E81CB001;
        Mon, 29 Mar 2021 00:02:51 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id MTb07vAuP_T2; Mon, 29 Mar 2021 00:02:51 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id A65A4E81CB017;
        Mon, 29 Mar 2021 00:02:51 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id UxTA4DuKEvAB; Mon, 29 Mar 2021 00:02:51 +0300 (IDT)
Received: from kkk.compulab.local (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 92E58E81CB001;
        Mon, 29 Mar 2021 00:02:51 +0300 (IDT)
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Subject: [PATCH 3/4] dt-bindings: rtc: abracon,abx80x: Add xt-frequency property
Date:   Mon, 29 Mar 2021 00:02:31 +0300
Message-Id: <20210328210232.10395-4-kirill.kapranov@compulab.co.il>
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

Add the string property "xt-frequency" to control xtal calibration of the
RTC. This allows to improve the RTC accuracy using a Distributed Digital
Calibration function. See: ch. 5.9.1 of
AB08XX Series Ultra Low Power RTC IC User's Guide
https://abracon.com/realtimeclock/AB08XX-Application-Manual.pdf

Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
---
 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 4c545ece33b5..fac36db7460e 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -41,3 +41,16 @@ property to enable the output:
 	"1_min", "16384_Hz", "100_Hz", "1_hour", "1_day", "TIRQ", "nTIRQ",
 	"1_year", "1_Hz_to_Counters", "1/32_Hz_from_Acal", "1/8_Hz_from_Acal",
 	"none"
+
+The RTCs support XT calibration that allows to improve the RTC accuracy.
+To perform the calibration follow the instruction:
+
+	Write the nominal XT frequency (in milliHerz) 32768000 to
+		/sys/class/rtc/your_rtc/xt-frequency
+		to ensure the calibration is not occurring.
+	Select the XT oscillator by writing by writing xtal to
+		/sys/class/rtc/your_rtc/oscillator
+	Configure the square wave SQW output by writing
+		32768_Hz to /sys/class/rtc/your_rtc/sqw
+	Measure the square wave frequency on the output pin in milliHerz.
+	Assign the measured value to the property xt-frequency.
-- 
2.11.0

