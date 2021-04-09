Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8783B35A083
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhDIOAb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 10:00:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:57929 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbhDIOA3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 10:00:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Apr 2021 07:00:16 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Apr 2021 07:00:14 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Apr 2021 19:29:40 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id A60B441C6; Fri,  9 Apr 2021 19:29:39 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 2/4] dt-bindings: mfd: Add compatible for pmk8350 rtc
Date:   Fri,  9 Apr 2021 19:29:24 +0530
Message-Id: <1617976766-7852-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add compatible string for pmk8350 rtc support.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes in V2:
 - Moved this patch before conversion patches.

 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
index 9e5eba4..07f4925 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
@@ -64,6 +64,7 @@ The below bindings specify the set of valid subnodes.
 		    "qcom,pm8921-rtc"
 		    "qcom,pm8941-rtc"
 		    "qcom,pm8018-rtc"
+		    "qcom,pmk8350-rtc"
 
 - reg:
 	Usage: required
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

