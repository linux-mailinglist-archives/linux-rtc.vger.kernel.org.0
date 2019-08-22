Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16ACF98C8D
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 09:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731671AbfHVHoZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 03:44:25 -0400
Received: from mga05.intel.com ([192.55.52.43]:63963 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727875AbfHVHoZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 03:44:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 00:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,415,1559545200"; 
   d="scan'208";a="330284772"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2019 00:44:19 -0700
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@intel.com, alan@linux.intel.com,
        linux-kernel@vger.kernel.org, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com, rahul.tanwar@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 2/2] dt-bindings: rtc: Add optional status property
Date:   Thu, 22 Aug 2019 15:44:04 +0800
Message-Id: <1b01287241d49638c43222d32f3ece5a38c95ddf.1566458029.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1566456205.git.rahul.tanwar@linux.intel.com>
References: <cover.1566456205.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some products may not support MC146818 RTC CMOS device. Introduce a optional
'status' standard property for RTC-CMOS to indicate if the MC146818 RTC device
is available (status="okay") or not (status="disabled")

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 Documentation/devicetree/bindings/rtc/rtc-cmos.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt b/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
index b94b35f3600b..fea4fe0ed4b9 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
@@ -11,6 +11,9 @@ Optional properties:
     called "Register B".
   - freq-reg : Contains the initial value of the frequency register also
     called "Regsiter A".
+  - status: indicates the operational status of the device.
+    Value must be either "disabled" or "okay".
+
 
 "Register A" and "B" are usually initialized by the firmware (BIOS for
 instance). If this is not done, it can be performed by the driver.
@@ -24,4 +27,5 @@ ISA Example:
 	         ctrl-reg = <2>;
 	         freq-reg = <0x26>;
 	         reg = <1 0x70 2>;
+		 status = "okay";
 	 };
-- 
2.11.0

